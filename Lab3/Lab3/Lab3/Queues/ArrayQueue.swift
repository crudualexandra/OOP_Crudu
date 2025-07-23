//
//  ArrayQueue.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//


import Foundation

class ArrayQueue<T>: Queue {
    private var elements: [T] = []

    func enqueue(_ element: T) {
        elements.append(element)
    }

    func dequeue() -> T? {
        return isEmpty() ? nil : elements.removeFirst()
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    // New method to get elements without modifying the queue
    func getElements() -> [T] {
        return elements
    }
}
