//
//  Haptics.swift
//  Agenda
//
//  Created by Victor Marcias on 19/10/2024.
//

import Foundation
import UIKit

enum Haptics {

    static func feedback(_ feedback: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        UIImpactFeedbackGenerator(style: feedback).impactOccurred(intensity: 1)
    }
}
