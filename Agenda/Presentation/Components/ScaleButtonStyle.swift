//
//  ScaleButtonStyle.swift
//  Agenda
//
//  Created by Victor Marcias on 26/08/2024.
//

import SwiftUI

private struct ScaleButtonStyle: ButtonStyle {
    var scale: Double = 0.9
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
    }
}

extension Button {
    func onPressScale(_ scale: Double = 0.9) -> some View {
        buttonStyle(ScaleButtonStyle(scale: scale))
    }
}
