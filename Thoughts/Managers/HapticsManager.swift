//
//  HapticsManager.swift
//  Thoughts
//
//  Created by Giorgi Meqvabishvili on 28.05.23.
//
import Foundation
import UIKit

class HapticsManager {
    static let shared = HapticsManager()

    private init() {}

    func vibrateForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }

    func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
