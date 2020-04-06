#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
   unsigned long n = [numbers count];
   int i=0;
    NSString *x = @"";
    if (n==0) {return nil;}
    else if (n==1) {
        NSString *first = [NSString stringWithFormat:@"%d", [numbers.firstObject intValue]];
        return first;
        }
    else if (n==2) {
        NSString *first = [NSString stringWithFormat:@"%dx", [numbers.firstObject intValue]];
        NSString *last;
        if ([numbers.lastObject intValue]>0){
            last = [NSString stringWithFormat:@" + %d", [numbers.lastObject intValue]];}
        else {last = [NSString stringWithFormat:@" - %d", [numbers.lastObject intValue]];}
        NSString *result;
        if ([numbers.lastObject intValue]==0) {result = [NSString stringWithFormat:@"%@", first];}
        else {result = [NSString stringWithFormat:@"%@%@", first, last];}
        return result;
        }
    else {
        
        unsigned long c = n-1;
        NSString *first = [NSString stringWithFormat:@"%dx^%lu", [numbers.firstObject intValue], n-1];
        NSString *last;
        if ([numbers.lastObject intValue]>0){
            last = [NSString stringWithFormat:@" + %d", [numbers.lastObject intValue]];}
        else {last = [NSString stringWithFormat:@" - %d", [numbers.lastObject intValue]];}
       
        NSString *sublast;
        if ((([[numbers objectAtIndex:n-2] intValue]>0) && ([[numbers objectAtIndex:n-2] intValue]<1)) || ([[numbers objectAtIndex:n-2] intValue]>1)){
            sublast = [NSString stringWithFormat:@" + %dx", [[numbers objectAtIndex:n-2] intValue]];}
        else if ([[numbers objectAtIndex:n-2] intValue]==1){sublast = @" + x";}
        else if ([[numbers objectAtIndex:n-2] intValue]==-1) {sublast = @" - x"; }
    
        else {sublast = [NSString stringWithFormat:@" - %dx", abs ([[numbers objectAtIndex:n-2] intValue])];}
        
        for (i=1; i<n-2; i++){
            int long a =  [[numbers objectAtIndex:i] integerValue];
            if (a==0) {
                c=c-1;}
            else if (a > 0) {
                    c=c-1;
                NSString *y = [NSString stringWithFormat:@" + %lux^%lu", a, c];
                    x = [x stringByAppendingString:y];}
            else {
                c=c-1;
                a = labs (a);
                NSString *y = [NSString stringWithFormat:@" - %lux^%lu", a, c];
                x = [x stringByAppendingString:y];
                }
            
            }
        NSString *result;
        if ([numbers.lastObject intValue]==0) {
            if ([[numbers objectAtIndex:n-2] intValue]==0) {
            result = [NSString stringWithFormat:@"%@%@", first, x];}
            else {result = [NSString stringWithFormat:@"%@%@%@", first, x, sublast];}}
        else {
            if ([[numbers objectAtIndex:n-2] intValue]==0) {
            result = [NSString stringWithFormat:@"%@%@%@", first, x, last];}
            else {result = [NSString stringWithFormat:@"%@%@%@%@", first, x, sublast, last];}}
        return result;
    }
   
}
@end
