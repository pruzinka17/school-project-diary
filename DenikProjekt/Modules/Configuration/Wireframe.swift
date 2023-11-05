//
//  Wireframe.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import Foundation
import SwiftUI

protocol Wireframe: AnyObject {
    
    func prepare() -> any View
}
