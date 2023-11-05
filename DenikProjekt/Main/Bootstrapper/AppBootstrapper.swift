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
        
        let recordsManager = RecordsManager()
        
        let wireframe = DefaultMainWireframe(
            recordsManager: recordsManager
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
