//
//  CheckmarkView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct CheckmarkView: View {
    var size: Double = 20
    var border: Double = 2
    @State var isChecked: Bool = false

    var body: some View {
        ZStack {
            if isChecked {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: size + border, weight: .bold))
            }
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Previews
#Preview {
    HStack(spacing: 20) {
        CheckmarkView()
        CheckmarkView(isChecked: true)
        CheckmarkView(size: 40, border: 4)
        CheckmarkView(size: 40, border: 4, isChecked: true)
    }
    .previewDevice(.none)
}
