//
//  DefaultCreateRecordWireframe.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation
import SwiftUI

final class DefaultCreateRecordWireframe {
    
    private let recordsManager: RecordsManager
    
    init(
        recordsManager: RecordsManager
    ) {
        
        self.recordsManager = recordsManager
    }
}

extension DefaultCreateRecordWireframe: CreateRecordWireframe {
    
    func prepare() -> any View {
        
        return wireUp()
    }
}

// MARK: - WireUp

private extension DefaultCreateRecordWireframe {
    
    func wireUp() -> any View {
        
        let initialViewModel = CreateRecordViewModel.makeInitial()
        
        let presenter = DefaultCreateRecordPresenter(
            recordsManager: recordsManager,
            initialViewModel: initialViewModel
        )
        
        let view = CreateRecordView(
            presenter: presenter
        )
        
        return AnyView(view)
    }
}
