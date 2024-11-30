//
//  LinkedListNode.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

// LinkedListNode.swift
class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?

    init(value: T) {
        self.value = value
    }
}
