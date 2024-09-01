//
//  DevicelessPreview.swift
//  Agenda
//
//  Created by Victor Marcias on 01/09/2024.
//

import SwiftUI

private struct DevicelessPreview: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding()
            .previewDevice(.none)
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    func devicelessPreview() -> some View {
        modifier(DevicelessPreview())
    }
}
