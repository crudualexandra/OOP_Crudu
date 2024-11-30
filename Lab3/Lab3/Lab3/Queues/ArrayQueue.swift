//
//  ArrayQueue.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

// ArrayQueue.swift
class ArrayQueue<T>: Queue {
    private var elements: [T] = []

    func enqueue(_ element: T) {
        elements.append(element)
    }

    func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }
}
