//
//  RecordsManager.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 07.11.2023.
//

import Foundation
import Combine

protocol RecordsManager: AnyObject {
    
    var recordsListPublisher: CurrentValueSubject<LinkedList<Record>, Never> { get }
    
    func createRecord(_ record: Record)
    
    func deleteRecord(_ node: Node<Record>)
}
