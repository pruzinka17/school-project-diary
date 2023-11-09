//
//  Record.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 06.11.2023.
//

import Foundation

struct Record: Codable {
    
    let title: String
    let text: String
    let date: Date
    
    init(
        title: String,
        text: String
    ) {
        
        self.title = title
        self.text = text
        self.date = Date()
    }
}
