//
//  Node.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

final class Node<Value> {
    
    var value: Value
    
    var next: Node?
    var previous: Node?
    
    init(
        value: Value,
        next: Node? = nil,
        previous: Node? = nil
    ) {
        
        self.value = value
        self.next = next
        self.previous = previous
    }
}
