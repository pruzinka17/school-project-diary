//
//  MainPresenter.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation

enum MainViewEvents {
    
    case didTapNext
    case didTapPrevious
    case didTapDelete
}

typealias MainPresenter = Presenter<MainViewModel, MainViewEvents>
