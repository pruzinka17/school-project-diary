//
//  Presenter.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation

class Presenter<ViewModel, ViewEvent>: ObservableObject {

    @Published var viewModel: ViewModel

    init(initialViewModel: ViewModel) {
    
        self.viewModel = initialViewModel
    }

    func present() {
    
        fatalError("Not implemented - subclass to implement.")
    }

    func handle(event: ViewEvent) {
    
        fatalError("Not implemented - subclass to implement.")
    }
}
