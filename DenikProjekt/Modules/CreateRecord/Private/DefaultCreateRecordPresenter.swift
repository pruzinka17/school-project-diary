//
//  DefaultCreateRecordPresenter.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

final class DefaultCreateRecordPresenter: CreateRecordPresenter {
    
    private let recordsManager: RecordsManager
    
    private var isConfigured: Bool
    
    init(
        recordsManager: RecordsManager,
        initialViewModel: CreateRecordViewModel
    ) {
        
        self.recordsManager = recordsManager
        
        self.isConfigured = false
        
        super.init(initialViewModel: initialViewModel)
    }
    
    override func present() {
        
        guard !isConfigured else {
            
            return
        }
        
        isConfigured = true
    }
    
    override func handle(event: CreateRecordViewEvents) {
        
        switch event {
        case .didTapCreate:
            
            let record = Record(
                title: viewModel.title,
                text: viewModel.text
            )
            
            viewModel.dismiss = true
            
            recordsManager.createRecord(record)
        }
    }
}
