import Foundation

extension Solution {

    public func canWinNim(n: Int) -> Bool {
        if (n % 4 == 0) {
            return false;
        }
        else {
            return true;
        }
    }
}