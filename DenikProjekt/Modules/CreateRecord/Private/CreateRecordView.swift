//
//  CreateRecordView.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import SwiftUI

struct CreateRecordView: View {
    
    @ObservedObject var presenter: CreateRecordPresenter
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            makeContent()
        }
        .frame(minWidth: 750, minHeight: 350)
        .onChange(
            of: presenter.viewModel.dismiss,
            perform: { newValue in
                
                guard newValue else {
                    return
                }
                
                dismiss()
            }
        )
        .onAppear {
            
            presenter.present()
        }
    }
}

// MARK: - Content

private extension CreateRecordView {
    
    @ViewBuilder func makeContent() -> some View {
        
        VStack {
            
            TextField("title", text: $presenter.viewModel.title)
            
            TextField("text", text: $presenter.viewModel.text)
            
            Button("Create Record") {
                
                presenter.handle(event: .didTapCreate)
            }
            
            Spacer()
        }
        .padding(16)
    }
}
