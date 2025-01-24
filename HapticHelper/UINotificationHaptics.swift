//
//  UINotificationHaptics.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/24/25.
//

import SwiftUI

struct UINotificationHaptics: View {
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
            }
                .padding()
                .navigationTitle("UI Notification Etc.")
            }
            .padding()
    }
}

#Preview {
    let viewModelPreview = ViewModel()
    
    return UINotificationHaptics()
        .environmentObject(viewModelPreview)
}
