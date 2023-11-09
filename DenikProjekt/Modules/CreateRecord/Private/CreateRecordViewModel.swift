//
//  CreateRecordViewModel.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

struct CreateRecordViewModel {
    
    var title: String
    var text: String
    
    var dismiss: Bool
}

// MARK: - Initial

extension CreateRecordViewModel {
    
    static func makeInitial() -> CreateRecordViewModel {
        
        return CreateRecordViewModel(
            title: "",
            text: "",
            dismiss: false
        )
    }
}
