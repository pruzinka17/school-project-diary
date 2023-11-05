//
//  DefaultMainWireframe.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation
import SwiftUI

final class DefaultMainWireframe {
    
    private let recordsManager: RecordsManager
    
    init(
        recordsManager: RecordsManager
    ) {
        
        self.recordsManager = recordsManager
    }
}

extension DefaultMainWireframe: MainWireframe {
    
    func prepare() -> any View {
        
        return wireUp()
    }
}

// MARK: - WireUp

private extension DefaultMainWireframe {
    
    func wireUp() -> any View {
        
        let initialViewModel = MainViewModel.makeInitial()
        
        let presenter = DefaultMainPresenter(
            recordsManager: recordsManager,
            initialViewModel: initialViewModel
        )
        
        let view = MainView(
            presenter: presenter
        )
        
        return AnyView(view)
    }
}
