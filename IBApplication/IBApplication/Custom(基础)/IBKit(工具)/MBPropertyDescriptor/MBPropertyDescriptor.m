//
//  MBPropertyDescriptor.m
//  IBApplication
//
//  Created by Bowen on 2020/3/30.
//  Copyright © 2020 BowenCoder. All rights reserved.
//

#import "MBPropertyDescriptor.h"
#import "MBInline.h"

@implementation MBPropertyDescriptor

+ (instancetype)descriptorWithProperty:(objc_property_t)property {
    MBPropertyDescriptor *descriptor = [[MBPropertyDescriptor alloc] init];
    NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
    descriptor.name = propertyName;
    
    // getter
    char *getterChar = property_copyAttributeValue(property, "G");
    descriptor.getter = NSSelectorFromString(getterChar != NULL ? [NSString stringWithUTF8String:getterChar] : propertyName);
    if (getterChar != NULL) {
        free(getterChar);
    }
    
    // setter
    char *setterChar = property_copyAttributeValue(property, "S");
    NSString *setterString = setterChar != NULL ? [NSString stringWithUTF8String:setterChar] : NSStringFromSelector(setterWithGetter(NSSelectorFromString(propertyName)));
    descriptor.setter = NSSelectorFromString(setterString);
    if (setterChar != NULL) {
        free(setterChar);
    }
    
    // atomic/nonatomic
    char *attrValue_N = property_copyAttributeValue(property, "N");
    BOOL isAtomic = (attrValue_N == NULL);
    descriptor.isAtomic = isAtomic;
    descriptor.isNonatomic = !isAtomic;
    if (attrValue_N != NULL) {
        free(attrValue_N);
    }
    
    // assign/weak/strong/copy
    char *attrValue_isCopy = property_copyAttributeValue(property, "C");
    char *attrValue_isStrong = property_copyAttributeValue(property, "&");
    char *attrValue_isWeak = property_copyAttributeValue(property, "W");
    BOOL isCopy = attrValue_isCopy != NULL;
    BOOL isStrong = attrValue_isStrong != NULL;
    BOOL isWeak = attrValue_isWeak != NULL;
    if (attrValue_isCopy != NULL) {
        free(attrValue_isCopy);
    }
    if (attrValue_isStrong != NULL) {
        free(attrValue_isStrong);
    }
    if (attrValue_isWeak != NULL) {
        free(attrValue_isWeak);
    }
    descriptor.isCopy = isCopy;
    descriptor.isStrong = isStrong;
    descriptor.isWeak = isWeak;
    descriptor.isAssign = !isCopy && !isStrong && !isWeak;
    
    // readonly/readwrite
    char *attrValue_isReadonly = property_copyAttributeValue(property, "R");
    BOOL isReadonly = (attrValue_isReadonly != NULL);
    if (attrValue_isReadonly != NULL) {
        free(attrValue_isReadonly);
    }
    descriptor.isReadonly = isReadonly;
    descriptor.isReadwrite = !isReadonly;
    
    // type
    char *type = property_copyAttributeValue(property, "T");
    descriptor.type = [MBPropertyDescriptor typeWithEncodeString:[NSString stringWithUTF8String:type]];
    if (type != NULL) {
        free(type);
    }
    
    return descriptor;
}

- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"@property("];
    if (self.isNonatomic) [result appendString:@"nonatomic, "];
    [result appendString:self.isAssign ? @"assign" : (self.isWeak ? @"weak" : (self.isStrong ? @"strong" : @"copy"))];
    if (self.isReadonly) [result appendString:@", readonly"];
    if (![NSStringFromSelector(self.getter) isEqualToString:self.name]) [result appendFormat:@", getter=%@", NSStringFromSelector(self.getter)];
    if (self.setter != setterWithGetter(NSSelectorFromString(self.name))) [result appendFormat:@", setter=%@", NSStringFromSelector(self.setter)];
    [result appendString:@") "];
    [result appendString:self.type];
    [result appendString:@" "];
    [result appendString:self.name];
    [result appendString:@";"];
    return result.copy;
}

#define _DetectTypeAndReturn(_type) if (strncmp(@encode(_type), typeEncoding, strlen(@encode(_type))) == 0) return @#_type;

+ (NSString *)typeWithEncodeString:(NSString *)encodeString {
    if ([encodeString containsString:@"@\""]) {
        NSString *result = [encodeString substringWithRange:NSMakeRange(2, encodeString.length - 2 - 1)];
        if ([result containsString:@"<"] && [result containsString:@">"]) {
            // protocol
            if ([result hasPrefix:@"<"]) {
                // id pointer
                return [NSString stringWithFormat:@"id%@", result];
            }
        }
        // class
        return [NSString stringWithFormat:@"%@ *", result];
    }
    
    const char *typeEncoding = encodeString.UTF8String;
    _DetectTypeAndReturn(NSInteger)
    _DetectTypeAndReturn(NSUInteger)
    _DetectTypeAndReturn(int)
    _DetectTypeAndReturn(short)
    _DetectTypeAndReturn(long)
    _DetectTypeAndReturn(long long)
    _DetectTypeAndReturn(char)
    _DetectTypeAndReturn(unsigned char)
    _DetectTypeAndReturn(unsigned int)
    _DetectTypeAndReturn(unsigned short)
    _DetectTypeAndReturn(unsigned long)
    _DetectTypeAndReturn(unsigned long long)
    _DetectTypeAndReturn(CGFloat)
    _DetectTypeAndReturn(float)
    _DetectTypeAndReturn(double)
    _DetectTypeAndReturn(void)
    _DetectTypeAndReturn(char *)
    _DetectTypeAndReturn(id)
    _DetectTypeAndReturn(Class)
    _DetectTypeAndReturn(SEL)
    _DetectTypeAndReturn(BOOL)
    
    return encodeString;
}

@end
