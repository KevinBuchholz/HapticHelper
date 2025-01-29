//
//  ContentView.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                NavigationLink("UI Notification", destination: UINotificationHaptics())
                    .buttonStyle(HapticButtonStyle())
                    .foregroundStyle(.blue)
                    
                NavigationLink("Custom Haptics", destination: CustomHapticView())
                    .buttonStyle(HapticButtonStyle())
                    .foregroundStyle(.blue)
                
                NavigationLink("Sensory Feedback", destination: SensoryFeedbackView())
                    .buttonStyle(HapticButtonStyle())
                    .foregroundStyle(.blue)
            }
                .padding()
                .navigationTitle("Haptic Helper")
            }
            .padding()
        }
}

#Preview {
    let viewModelPreview = ViewModel()
    
    return ContentView()
        .environmentObject(viewModelPreview)
}
