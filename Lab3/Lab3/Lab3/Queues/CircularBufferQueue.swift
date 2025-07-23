//
//  CircularBufferQueue.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

// CircularBufferQueue.swift
class CircularBufferQueue<T>: Queue {
    private var buffer: [T?]
    private var head: Int = 0
    private var tail: Int = 0
    private var capacity: Int
    private var count: Int = 0

    init(capacity: Int) {
        self.capacity = capacity
        self.buffer = [T?](repeating: nil, count: capacity)
    }

    func enqueue(_ element: T) {
        if count < capacity {
            buffer[tail] = element
            tail = (tail + 1) % capacity
            count += 1
        } else {
            print("Queue is full")
        }
    }

    func dequeue() -> T? {
        if count > 0 {
            let element = buffer[head]
            buffer[head] = nil
            head = (head + 1) % capacity
            count -= 1
            return element
        }
        return nil
    }

    func isEmpty() -> Bool {
        return count == 0
    }
}
