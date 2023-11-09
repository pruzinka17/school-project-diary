//
//  AppBootstrapper.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation

final class AppBootstrapper {
    
    private var mainWireframe: MainWireframe?
    
    private var hasBootstrapped: Bool
    
    init() {
        
        self.hasBootstrapped = false
    }
    
    func configure() -> MainWireframe {
        
        if let mainWireframe = mainWireframe {
            
            return mainWireframe
        }
        
        let parserService = RecordsToLinkedListParserService()
        
        let recordsManager = DefaultRecordsManager(
            parserService: parserService
        )
        
        let createRecordWireframe = DefaultCreateRecordWireframe(
            recordsManager: recordsManager
        )
        
        let wireframe = DefaultMainWireframe(
            recordsManager: recordsManager,
            createRecordWireframe: createRecordWireframe
        )
        
        self.mainWireframe = wireframe
        
        return wireframe
    }
    
    func bootstrap() {
        
        guard !hasBootstrapped else {
            return
        }
        
        hasBootstrapped = true
    }
}
