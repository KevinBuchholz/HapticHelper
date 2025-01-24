//
//  Model.swift
//  HapticHelper
//
//  Created by Kevin Buchholz on 1/22/25.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    let feedbackArray = SensoryFeedbackType.allCases
    
    enum SensoryFeedbackType: String, CaseIterable {
        case success
        case warning
        case error
        case selection
        case lightImpact
        case mediumImpact
        case heavyImpact
//        case increase
//        case decrease
//        case start
//        case stop
//        case alignment
//        case levelChange
        
        func triggerFeedback() {
            switch self {
            case .success:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            case .warning:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
            case .error:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            case .selection:
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
            case .lightImpact:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            case .mediumImpact:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            case .heavyImpact:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
//            case .increase:
//                let generator = UINotificationFeedbackGenerator()
//                generator.notificationOccurred(.increase)
//            case .decrease:
//                let generator = UINotificationFeedbackGenerator()
//                generator.notificationOccurred(.decrease)
//            case .start:
//                let generator = UINotificationFeedbackGenerator()
//                generator.notificationOccurred(.start)
//            case .stop:
//                let generator = UINotificationFeedbackGenerator()
//                generator.notificationOccurred(.stop)
//            case .alignmnent:
//                let generator = UINotificationFeedbackGenerator()
//                generator.notificationOccurred(.alignment)
//            case .levelChange:
//                let generator = UINotificationFeedbackGenerator()
//                generator.notificationOccurred(.levelChange)
                
            }
        }
    }
    
}



