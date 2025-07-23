// QueueTests.swift

import XCTest
@testable import Lab3

class QueueTests: XCTestCase {

    func testArrayQueue() {
        let queue = ArrayQueue<Int>()
        XCTAssertTrue(queue.isEmpty())
        queue.enqueue(1)
        queue.enqueue(2)
        XCTAssertFalse(queue.isEmpty())
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.dequeue())
    }

    func testLinkedListQueue() {
        let queue = LinkedListQueue<String>()
        XCTAssertTrue(queue.isEmpty())
        queue.enqueue("First")
        queue.enqueue("Second")
        XCTAssertFalse(queue.isEmpty())
        XCTAssertEqual(queue.dequeue(), "First")
        XCTAssertEqual(queue.dequeue(), "Second")
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.dequeue())
    }

    func testCircularBufferQueue() {
        let queue = CircularBufferQueue<Double>(capacity: 2)
        XCTAssertTrue(queue.isEmpty())
        queue.enqueue(3.14)
        queue.enqueue(2.71)
        XCTAssertFalse(queue.isEmpty())
        queue.enqueue(1.41) // Should print "Queue is full"
        XCTAssertEqual(queue.dequeue(), 3.14)
        XCTAssertEqual(queue.dequeue(), 2.71)
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.dequeue())
    }
}
