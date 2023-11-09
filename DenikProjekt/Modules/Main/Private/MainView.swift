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
            
            VStack(spacing: 0) {
                
                makeHeader()
                
                makeCotent()
                
                Spacer()
            }
            .padding(16)
        }
        .frame(minWidth: 750, minHeight: 350)
        .onAppear {
            
            presenter.present()
        }
    }
}

// MARK: - Header

private extension MainView {
    
    @ViewBuilder func makeHeader() -> some View {
        
        HStack {
            
            Text("Denik")
                .font(
                    .system(size: 21, weight: .bold, design: .rounded)
                )
            
            Spacer()
            
            NavigationLink(
                value: MainWireframeNavigation.createRecord,
                label: {
                    
                    Text("Create record")
                }
            )
        }
    }
}

// MARK: - Content

private extension MainView {
    
    @ViewBuilder func makeCotent() -> some View {
        
        VStack {
            
            switch presenter.viewModel.state {
            case .empty:
                
                Text("There are no records")
            case let .record(record):
                
                Text(record.title)
                Text(record.text)
                Text(record.date.description)
                
                HStack {
                    
                    Spacer()
                    
                    if record.showPrevious {
                        
                        Button("Previous") {
                            
                            presenter.handle(event: .didTapPrevious)
                        }
                    }
                    
//                    Button("Delete") {
//
//                        presenter.handle(event: .didTapDelete)
//                    }
                    
                    if record.showNext {
                        
                        Button("Next") {
                            
                            presenter.handle(event: .didTapNext)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(16)
    }
}
