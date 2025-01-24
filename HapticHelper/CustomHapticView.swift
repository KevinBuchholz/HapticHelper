//
//  CustomHapticView.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/24/25.
//

import SwiftUI

struct CustomHapticView: View {
    @EnvironmentObject var model: ViewModel
    
    @State private var intensity = 0.5
    @State private var isEditing = false
    @State private var buttonPressed = false
    
    enum Flexibility: String, CaseIterable, Identifiable {
        case soft
        case rigid
        case solid
        
        var id: Self { self }
    }
    
    @State private var selectedFlexibility: Flexibility = .soft
    
    var convertedFlexibility: SensoryFeedback.Flexibility {
        switch selectedFlexibility {
        case .soft:
            return .soft
        case .rigid:
            return .rigid
        case .solid:
            return .solid
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                Text("Flexibility")
                
                Picker(selection: $selectedFlexibility) {
                    Text("Soft").tag(Flexibility.soft)
                    Text("Rigid").tag(Flexibility.rigid)
                    Text("Solid").tag(Flexibility.solid)
                } label: {
                    Text("Flexibility")
                    Text("Choose a flexibility.")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Spacer()
                
                Text("Intensity: \(intensity, specifier: "%.1f")")
                
                Slider(
                    value: $intensity,
                    in: 0.0...1.0,
                    step: 0.1
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0.0")
                } maximumValueLabel: {
                    Text("1.0")
                }
                onEditingChanged: { editing in
                    isEditing = editing
                }
                
                .padding(.horizontal)
                
                Spacer()
                
                
                Button("Play Haptic") {
                    buttonPressed.toggle()
                }
                .sensoryFeedback(.impact(flexibility: convertedFlexibility, intensity: intensity),trigger: buttonPressed)
                .buttonStyle(HapticButtonStyle())
            }
            .navigationTitle("Custom Haptics")
        }
    }
}

#Preview {
    let viewModelPreview = ViewModel()
    
    return CustomHapticView()
        .environmentObject(viewModelPreview)
}


