import Foundation

extension Solution {
    public func swapPairs(head: ListNode?) -> ListNode? {
        var result = head;
        if let _ = head?.next {
            result = head?.next;
            
            var current = head;
            var next = current?.next;
            var last : ListNode?;
            
            while let _ = current {
                
                current?.next = next?.next;
                next?.next = current;
                if let _ = next {
                    last?.next = next;
                }
                else {
                    last?.next = current;
                }
                
                last = current;
                current = current?.next;
                next = current?.next;
            }
        }
        
        return result;
    }
}