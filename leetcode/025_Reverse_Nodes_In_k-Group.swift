import Foundation

extension Solution {
    
    public func reverseKGroup(head: ListNode?, _ k: Int) -> ListNode? {
        
        var headerNode : ListNode? ;
        var lastNode : ListNode? ;
        var nextNode : ListNode? ;
        
        var node = head;
        
        while (node?.next != nil) {
            
            var subHeader = node;
            
            let subLast = lastNodeInKGroup(subHeader, k);
            nextNode = subLast?.next;
            subLast?.next = nil;

            let shouldSwap: Bool = shouldContinueSwap(subHeader, k);

            if (shouldSwap) {
                subHeader = swapNodes(subHeader);
            }
            
            lastNode?.next = subHeader;
            lastNode = lastNodeInKGroup(subHeader, k);

            node = nextNode;

            if headerNode == nil {
                headerNode = subHeader;
            }
        }
        
        lastNode?.next = node;
        
        if let _ = headerNode {return headerNode;}
        else {return head;}
    }
    
    func shouldContinueSwap(head: ListNode?, _ k: Int) -> Bool {
        var node = head;
        var n = 0;
        while (node != nil) {
            node = node?.next;
            n = n + 1;
            
            if (n >= k) {
                return true;
            }
        }
        if (n < k) {
            return false;
        }
        else {
            return true;
        }
    }
    
    func lastNodeInKGroup(head: ListNode?, _ k: Int) -> ListNode? {
        var node = head;
        var n = 0;
        while (n + 1 < k) {
            if (node?.next != nil) {
                node = node?.next;
            }
            else {
                break;
            }
            n = n + 1;
        }
        return node;
    }

    func swapNodes(head: ListNode?) -> ListNode? {
        
        var node = head;
        var last : ListNode? ;
        while (node?.next != nil) {
            
            let next = node?.next;
            node?.next = last;
            last = node;
            node = next;
        }
        node?.next = last;
        return node;
    }
}