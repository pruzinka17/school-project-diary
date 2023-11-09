//
//  MainViewModel.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation

struct MainViewModel {
    
    var state: State

    enum State {
        
        case empty
        case record(Record)
    }
    
    struct Record {
        
        let title: String
        let text: String
        let date: Date
        
        let showNext: Bool
        let showPrevious: Bool
    }
}

// MARK: - Initial

extension MainViewModel {
    
    static func makeInitial() -> MainViewModel {
        
        return MainViewModel(
            state: .empty
        )
    }
}
