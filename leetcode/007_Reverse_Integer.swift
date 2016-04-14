import Foundation

extension Solution {
    public func reverse(x: Int) -> Int {
        
        var result : Int64 = 0;
        var left : Int = x;
        while (left != 0) {
            let last = Int(left % 10);
            left = left / 10;
            
            result = result * 10 + last;
        }
        
        let limit = Int64(powf(2.0, 31.0));
        if (result > limit - 1 || result < -limit) {
            return 0;
        }
        
        return Int(result);
    }
}