//
//  SensoryFeedbackView.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/24/25.
//

import SwiftUI

struct SensoryFeedbackView: View {
    @State private var alignment = 0
    @State private var increase = 0
    @State private var decrease = 0
    @State private var impact = 0
    @State private var levelChange = 0
    @State private var pathComplete = 0
    @State private var selection = 0
    @State private var start = 0
    @State private var stop = 0
    @State private var success = 0
    @State private var warning = 0
    @State private var error = 0

    
    var body: some View {
        NavigationStack{
            ScrollView{
                Button(action: {
                    increase += 1 },
                       label: {
                    Text("Increase")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
                
                Button(action: {
                    decrease += 1 },
                       label: {
                    Text("Decrease")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
                
                Button(action: {
                    impact += 1 },
                       label: {
                    Text("Impact")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
                
                Button(action: {
                    selection += 1 },
                       label: {
                    Text("Selection")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
                
                Button(action: {
                    success += 1 },
                       label: {
                    Text("Success")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
                
                Button(action: {
                    warning += 1 },
                       label: {
                    Text("Warning")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
                
                Button(action: {
                    error += 1 },
                       label: {
                    Text("Error")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(HapticButtonStyle())
                .padding()
            }
            .navigationTitle("Sensory Feedback")
        }
        .sensoryFeedback(.increase, trigger: increase)
        .sensoryFeedback(.decrease, trigger: decrease)
        .sensoryFeedback(.impact, trigger: impact)
        .sensoryFeedback(.selection, trigger: selection)
        .sensoryFeedback(.success, trigger: success)
        .sensoryFeedback(.warning, trigger: warning)
        .sensoryFeedback(.error, trigger: error)
    }
}

#Preview {
    SensoryFeedbackView()
}
