//
//  Queue.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

protocol Queue {
    associatedtype Element
    func enqueue(_ element: Element)
    func dequeue() -> Element?
    func isEmpty() -> Bool
}
