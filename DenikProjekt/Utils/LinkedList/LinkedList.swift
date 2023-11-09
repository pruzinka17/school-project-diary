//
//  LinkedList.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

final class LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    init() {
        
        self.head = nil
        self.tail = nil
    }
    
    var isEmpty: Bool {
        
        return head == nil
    }
    
    func push(_ value: Value) {
        
        let newNode = Node(value: value)
        newNode.next = head
        
        if let head = head {
            
            head.previous = newNode
            
            self.head = newNode
            return
        }
        
        head = newNode
        
        if tail == nil {
            
            tail = head
        }
    }
    
    func append(_ value: Value) {
        
        guard !isEmpty else {
            
            push(value)
            return
        }
        
        let newNode = Node(value: value)
        newNode.previous = tail
        
        tail?.next = newNode
        tail = newNode
    }
    
    func delete(_ node: Node<Value>) {
        
        let previous = node.previous
        let next = node.next
        
        previous?.next = next
        next?.previous = previous
    }
}
