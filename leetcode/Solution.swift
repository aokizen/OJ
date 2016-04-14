import Foundation

public class Solution : NSObject {
    
    public func nodeListString(head: ListNode!) -> String {
        var result = "[";
        var node = head;
        while (node != nil) {
            result = result + String(node.val);
            node = node.next;
            if (node != nil) {
                result = result + ", ";
            }
        }
        result = result + "]";
        return result;
    }
}

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}