//
//  CreateRecordPresenter.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

enum CreateRecordViewEvents {
    
    case didTapCreate
}

typealias CreateRecordPresenter = Presenter<CreateRecordViewModel, CreateRecordViewEvents>
