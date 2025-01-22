//
//  HapticButtonStyle.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/22/25.
//

import SwiftUI

struct HapticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.primary)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary, lineWidth: 2)
            )

            
    }
}


