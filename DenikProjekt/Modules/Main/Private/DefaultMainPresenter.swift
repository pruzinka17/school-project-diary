//
//  DefaultMainPresenter.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation

final class DefaultMainPresenter: MainPresenter {
    
    private let recordsManager: RecordsManager
    
    private var isConfigured: Bool
    
    init(
        recordsManager: RecordsManager,
        initialViewModel: MainViewModel
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
    
    override func handle(event: MainViewEvents) {
        
    }
}
