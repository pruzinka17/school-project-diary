//
//  MainView.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var presenter: MainPresenter
    
    var body: some View {
        
        ZStack {
            
            Text("MainView")
        }
        .onAppear {
            
            presenter.present()
        }
    }
}
