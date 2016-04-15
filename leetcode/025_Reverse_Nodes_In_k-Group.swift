import Foundation

extension Solution {
    
    public func testReverseKGroup() {
        
        let a: ListNode = ListNode.init(1);
        let b: ListNode = ListNode.init(2);
        let c: ListNode = ListNode.init(3);
        let d: ListNode = ListNode.init(4);
        let e: ListNode = ListNode.init(5);
        
        var k = 1;
        
        resetTestListNode(a, b, c, d, e);
        a.next = nil;
        k = 3;
        NSLog("input 1 : %@, %d", nodeListString(a), k);
        let header1 = reverseKGroup(a, k);
        NSLog("output 1 : %@", nodeListString(header1));
        
        resetTestListNode(a, b, c, d, e);
        a.next = nil;
        k = 1;
        NSLog("input 2 : %@, %d", nodeListString(a), k);
        let header2 = reverseKGroup(a, k);
        NSLog("output 2 : %@", nodeListString(header2));
        
        resetTestListNode(a, b, c, d, e);
        c.next = nil;
        k = 3;
        NSLog("input 3 : %@, %d", nodeListString(a), k);
        let header3 = reverseKGroup(a, k);
        NSLog("output 3 : %@", nodeListString(header3));
        
        resetTestListNode(a, b, c, d, e);
        c.next = nil;
        k = 2;
        NSLog("input 4 : %@, %d", nodeListString(a), k);
        let header4 = reverseKGroup(a, k);
        NSLog("output 4 : %@", nodeListString(header4));
        
        resetTestListNode(a, b, c, d, e);
        d.next = nil;
        k = 2;
        NSLog("input 5 : %@, %d", nodeListString(a), k);
        let header5 = reverseKGroup(a, k);
        NSLog("output 5 : %@", nodeListString(header5));
        
        resetTestListNode(a, b, c, d, e);
        k = 2;
        NSLog("input 6 : %@, %d", nodeListString(a), k);
        let header6 = reverseKGroup(a, k);
        NSLog("output 6 : %@", nodeListString(header6));
        
        resetTestListNode(a, b, c, d, e);
        k = 3;
        NSLog("input 7 : %@, %d", nodeListString(a), k);
        let header7 = reverseKGroup(a, k);
        NSLog("output 7 : %@", nodeListString(header7));
        
        NSLog("input 8 : %@, %d", nodeListString(nil), k);
        NSLog("output 8 : %@", nodeListString(nil));
    }
    
    func resetTestListNode(a: ListNode!, _ b: ListNode!, _ c: ListNode!, _ d: ListNode!, _ e: ListNode!) -> Void {
        a.next = b;
        b.next = c;
        c.next = d;
        d.next = e;
        e.next = nil;
    }
    
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