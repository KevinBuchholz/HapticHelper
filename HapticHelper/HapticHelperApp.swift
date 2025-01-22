//
//  HapticHelperApp.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/22/25.
//

import SwiftUI

@main
struct HapticHelperApp: App {
    
    @EnvironmentObject var model : ViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
