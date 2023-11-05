//
//  DenikProjektApp.swift
//  DenikProjekt
//
//  Created by Miroslav Bořek on 05.11.2023.
//

import SwiftUI

@main
struct DenikProjektApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            
            AnyView(
                appDelegate.bootstrapper
                    .configure()
                    .prepare()
            )
        }
    }
}

// MARK: - AppDelegate
    
final class AppDelegate: NSObject, NSApplicationDelegate {
    
    let bootstrapper: AppBootstrapper = AppBootstrapper()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        bootstrapper.bootstrap()
    }
}
