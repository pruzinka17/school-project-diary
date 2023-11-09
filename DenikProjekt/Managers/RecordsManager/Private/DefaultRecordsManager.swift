//
//  RecordsManager.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation
import Combine

final class DefaultRecordsManager {
    
    private let userDefaults: UserDefaults
    
    private let endcoder: JSONEncoder
    private let decoder: JSONDecoder
        
    private let parserService: RecordsToLinkedListParserService
    
    private(set) var recordsListPublisher: CurrentValueSubject<LinkedList<Record>, Never>

    init(
        parserService: RecordsToLinkedListParserService
    ) {
        
        userDefaults = .standard
        
        self.endcoder = JSONEncoder()
        self.decoder = JSONDecoder()
        
        self.parserService = parserService
        
        self.recordsListPublisher = CurrentValueSubject<LinkedList<Record>, Never>(LinkedList())
        
        configure()
    }
}

// MARK: - Public interface

extension DefaultRecordsManager: RecordsManager {
    
    func createRecord(_ record: Record) {
        
        let recordsList = recordsListPublisher.value
        recordsList.append(record)
        
        recordsListPublisher.send(recordsList)
        
        saveRecords()
    }
    
    func deleteRecord(_ node: Node<Record>) {
        
        let recordsList = recordsListPublisher.value
        recordsList.delete(node)
        
        recordsListPublisher.send(recordsList)
        
        saveRecords()
    }
}

// MARK: - Configuration

private extension DefaultRecordsManager {
    
    func configure() {
        
        if let data = userDefaults.data(forKey: Defaults.recordsKey) {
            
            do {
                
                let recordsArray = try decoder.decode([Record].self, from: data)
                
                let recordsList = parserService.toLinkedList(recordsArray)
                recordsListPublisher.send(recordsList)
            } catch {
                
                print(error)
            }
        }
    }
}

// MARK: - Helpers

private extension DefaultRecordsManager {
    
    func saveRecords() {
        
        let recordList = recordsListPublisher.value
        
        let recordsArray = parserService.toArray(recordList)
        
        do {
            
            let data = try endcoder.encode(recordsArray)
            userDefaults.set(data, forKey: Defaults.recordsKey)
        } catch {
            
            print(error)
        }
    }
}

// MARK: - Defaults

private extension DefaultRecordsManager {
    
    enum Defaults {
        
        static let recordsKey: String = "denik.records"
    }
}
