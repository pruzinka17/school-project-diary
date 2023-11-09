//
//  ArrayToLinkedListParserService.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

final class RecordsToLinkedListParserService {
    
    func toLinkedList(_ array: [Record]?) -> LinkedList<Record> {
        
        let linkedList: LinkedList = LinkedList<Record>()
        
        guard let recordsArray = array else {
            
            return linkedList
        }
        
        for record in recordsArray {
            
            linkedList.append(record)
        }
        
        return linkedList
    }
    
    func toArray(_ linkedList: LinkedList<Record>) -> [Record] {
                
        guard let head = linkedList.head else {
            
            return []
        }
        
        var records: [Record] = []
        var appendNext: Bool = true
        var current = head
        
        while appendNext {
            
            records.append(current.value)
            
            if let next = current.next {
                
                current = next
            } else {
                
                appendNext = false
            }
        }
        
        return records
    }
}
