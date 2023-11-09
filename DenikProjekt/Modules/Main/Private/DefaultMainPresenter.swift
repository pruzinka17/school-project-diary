//
//  DefaultMainPresenter.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation
import Combine

final class DefaultMainPresenter: MainPresenter {
    
    private let recordsManager: RecordsManager
    
    private var recordsList: LinkedList<Record>
    private var currentRecord: Node<Record>?
        
    private var isConfigured: Bool
    
    private var cancellables: Set<AnyCancellable>
    
    init(
        recordsManager: RecordsManager,
        initialViewModel: MainViewModel
    ) {
        
        self.recordsManager = recordsManager
        
        self.recordsList = LinkedList()
                
        self.isConfigured = false
        
        self.cancellables = Set<AnyCancellable>()
        
        super.init(initialViewModel: initialViewModel)
    }
    
    override func present() {
        
        guard !isConfigured else {
            
            return
        }
        
        isConfigured = true
        
        configureRecordsPublisher()
        updateView()
    }
    
    override func handle(event: MainViewEvents) {
        
        switch event {
        case .didTapNext:
            
            guard let current = currentRecord else {
                
                return
            }
            
            currentRecord = current.next
            
            updateView()
        case .didTapPrevious:
            
            guard let current = currentRecord else {
                
                return
            }
            
            currentRecord = current.previous
            
            updateView()
        case .didTapDelete:
            
            guard let current = currentRecord else {
                
                return
            }
            
            recordsManager.deleteRecord(current)
            
            let nextNode = current.next
            let previousNode = current.previous
            
            if let previous = previousNode {
                
                currentRecord = previous
                updateView()
                return
            }
            
            if let next = nextNode {
                
                currentRecord = next
                updateView()
                return
            }
            
            currentRecord = nil
            updateView()
        }
    }
}

// MARK: - Update view

private extension DefaultMainPresenter {
    
    func updateView() {
        
        guard let current = currentRecord else {
            
            guard let head = recordsList.head else {
                
                viewModel.state = .empty
                return
            }
            
            currentRecord = head
            
            let showNext = head.next != nil
            let showPrevious = head.previous != nil
            
            let value = head.value
            
            let record = MainViewModel.Record(
                title: value.title,
                text: value.text,
                date: value.date,
                showNext: showNext,
                showPrevious: showPrevious
            )
            
            viewModel.state = .record(record)
            return
        }
                
        let showNext = current.next != nil
        let showPrevious = current.previous != nil
        
        let value = current.value
        
        let record = MainViewModel.Record(
            title: value.title,
            text: value.text,
            date: value.date,
            showNext: showNext,
            showPrevious: showPrevious
        )
        
        viewModel.state = .record(record)
    }
}

// MARK: - Configuration

private extension DefaultMainPresenter {
    
    func configureRecordsPublisher() {
        
        recordsManager.recordsListPublisher
            .eraseToAnyPublisher()
            .sink { [weak self] recordsList in
                
                self?.recordsList = recordsList
                self?.updateView()
            }
            .store(in: &cancellables)
    }
}
