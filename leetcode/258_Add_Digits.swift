import Foundation

extension Solution {
    
    public func addDigits(num: Int) -> Int {
        let multiple: Int = num / 9;
        let left: Int = num % 9;
        if (multiple < 1 || (multiple >= 1 && left != 0)) {
            return left;
        }
        else {
            return 9;
        }
    }
}