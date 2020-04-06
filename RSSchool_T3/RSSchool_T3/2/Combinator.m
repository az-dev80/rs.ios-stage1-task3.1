#import "Combinator.h"

@implementation Combinator
//-(int)factorialRecursive:(int)operand
//{
//    if( operand == 1 || operand == 0) {
//        return(1);
 //   } else if( operand < 0 ) {
 //       return(-1);
 //   }
    
 //   return( operand * [self factorialRecursive:operand-1] );
//}

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    int long long b =  [[array objectAtIndex:0] intValue];
    int long long a =  [[array objectAtIndex:1] intValue];
    int i=1;
    int long long l;
    int long long x=1;
    int long long factorialn = 1; // переменная для результата
    int long long factorialx = 1;
    int long long factorialz = 1;
    for (i = 1; i <= a; i++) {
        factorialn = factorialn * i; }
    int long long m = factorialn;
    
    for (x = 1; x<a; x++) {
        factorialx = factorialx * x;
        int long long z = a - x;
        
        for (l = z; l > 0; l--) {
            factorialz = factorialz * l; }
        int long long r = factorialx*factorialz;
        int long long w = m/r;
        factorialz = 1;
        if (b>w) continue;
        else {
            NSNumber *res = [NSNumber numberWithInteger: x];
            return res;
            break;
        }
        
    }
    return nil;
}
@end
