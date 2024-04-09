//
//  MagicTheGatheringApp.swift
//  MagicTheGathering
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI
import Presentation

@main
struct MagicTheGatheringApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            PresentationView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FontManager.registerFonts()
        return true
    }
    
}
