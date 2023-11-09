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
    
    private let createRecordWireframe: CreateRecordWireframe
    
    init(
        recordsManager: RecordsManager,
        createRecordWireframe: CreateRecordWireframe
    ) {
        
        self.recordsManager = recordsManager
        
        self.createRecordWireframe = createRecordWireframe
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
        
        return AnyView(
            NavigationStack(
                root: {
                    
                    view
                        .navigationDestination(
                            for: MainWireframeNavigation.self,
                            destination: { destination in
                                
                                switch destination {
                                case .createRecord:
                                    
                                    AnyView(
                                        self.createRecordWireframe.prepare()
                                    )
                                }
                            }
                        )
                }
            )
        )
    }
}
