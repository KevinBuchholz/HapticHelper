//
//  ContentView.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/22/25.
//

// Content View contains links to all the different haptic views. Each of the different views has different types of haptics for you to test out.
// They're pretty easy to implement and you can probably figure out how they work by looking at the code in this project. I generally used Hacking With Swift tutorials to get started. 


import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    NavigationLink("UI Notification", destination: UINotificationHaptics())
                        .buttonStyle(HapticButtonStyle())
                        .foregroundStyle(.teal)
                        .padding()
                }
                    
                NavigationLink("Custom Haptics", destination: CustomHapticView())
                    .buttonStyle(HapticButtonStyle())
                    .foregroundStyle(.teal)
                    .padding()
                
                NavigationLink("Sensory Feedback", destination: SensoryFeedbackView())
                    .buttonStyle(HapticButtonStyle())
                    .foregroundStyle(.teal)
                    .padding()
                
                NavigationLink("Core Haptics", destination: CoreHapticView())
                    .buttonStyle(HapticButtonStyle())
                    .foregroundStyle(.teal)
                    .padding()
            }
            .padding(.vertical, 80)
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
