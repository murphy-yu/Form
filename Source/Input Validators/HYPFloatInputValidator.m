#import "HYPFloatInputValidator.h"

@implementation HYPFloatInputValidator

- (BOOL)validateReplacementString:(NSString *)string withText:(NSString *)text withRange:(NSRange)range
{
    BOOL valid = [super validateReplacementString:string withText:text withRange:range];

    if (!valid) return valid;

    BOOL hasComa = ([text rangeOfString:@","].location != NSNotFound);
    BOOL stringIsNilOrComma = (!string || [string isEqualToString:@","]);

    if (hasComa && stringIsNilOrComma) return NO;

    NSCharacterSet *floatSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890,"];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:string];

    return [floatSet isSupersetOfSet:stringSet];
}

@end
