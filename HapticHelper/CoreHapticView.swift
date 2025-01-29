//
//  CoreHapticView.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/29/25.
//

import SwiftUI
import CoreHaptics

struct CoreHapticView: View {
    @State private var engine: CHHapticEngine?
    @State private var isEditing = false
    @State private var customIntensity: Float = 0.1
    @State private var customSharpness: Float = 0.1
    @State private var customDuration = 10.0
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
//        for i in stride(from: 0, to: 1, by: 0.1) {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: customIntensity)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: customSharpness)
        let continuousEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: customDuration)
            events.append(continuousEvent)
//        }
        
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i + i)
//            events.append(event)
//        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack{
                Text("Sharpness \(customSharpness, specifier: "%.1f")")
                    .font(.title2)
                
                Slider(
                    value: $customSharpness,
                    in: 0.0...1.0,
                    step: 0.1
                ) {
                    Text("Sharpness")
                } minimumValueLabel: {
                    Text("0.0")
                } maximumValueLabel: {
                    Text("1.0")
                }
                onEditingChanged: { editing in
                    isEditing = editing
                }
//                .padding(.horizontal)
            }
            .padding()
            
            VStack{
                Text("Intensity \(customIntensity, specifier: "%.1f")")
                    .font(.title2)
                
                Slider(
                    value: $customIntensity,
                    in: 0.0...1.0,
                    step: 0.1
                ) {
                    Text("Intensity")
                } minimumValueLabel: {
                    Text("0.0")
                } maximumValueLabel: {
                    Text("1.0")
                }
                onEditingChanged: { editing in
                    isEditing = editing
                }
            }
            .padding()
            
            VStack{
                Text("Duration \(customDuration, specifier: "%.0f")")
                    .font(.title2)
                
                Slider(
                    value: $customDuration,
                    in: 1.0...10.0,
                    step: 1.0
                ) {
                    Text("Sharpness")
                } minimumValueLabel: {
                    Text("1")
                } maximumValueLabel: {
                    Text("10")
                }
                onEditingChanged: { editing in
                    isEditing = editing
                }
            }
            .padding()
            
            
            Spacer()
            
            Button("Tap Me", action: complexSuccess)
                .onAppear(perform: prepareHaptics)
                .buttonStyle(HapticButtonStyle())
                .navigationTitle("Core Haptics")
        }
    }
}

#Preview {
    CoreHapticView()
}
