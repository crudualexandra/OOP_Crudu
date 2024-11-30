//
//  LinkedListQueue.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

// LinkedListQueue.swift
class LinkedListQueue<T>: Queue {
    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?

    func enqueue(_ element: T) {
        let newNode = LinkedListNode(value: element)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func dequeue() -> T? {
        if let headNode = head {
            let value = headNode.value
            head = headNode.next
            if head == nil {
                tail = nil
            }
            return value
        }
        return nil
    }

    func isEmpty() -> Bool {
        return head == nil
    }
}
