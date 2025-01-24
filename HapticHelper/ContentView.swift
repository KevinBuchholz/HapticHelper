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
                    ForEach(model.feedbackArray, id: \.self) { feedback in
                        Button(action: {feedback.triggerFeedback()}, label: {Text(feedback.rawValue.capitalized)
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(HapticButtonStyle())
                        .padding()
                    }
                    .padding()
                        .navigationTitle("Haptic Helper")
                }
                .padding()
        }
    }
}

#Preview {
    let viewModelPreview = ViewModel()
    
    return ContentView()
        .environmentObject(viewModelPreview)
}
