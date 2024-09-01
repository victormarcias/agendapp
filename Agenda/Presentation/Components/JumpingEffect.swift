//
//  JumpingEffect.swift
//  Agenda
//
//  Created by Victor Marcias on 01/09/2024.
//

import SwiftUI

struct JumpingEffect: ViewModifier {
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .offset(y: isActive ? -10 : 0)  // Mueve el ícono hacia arriba para el salto
            .animation(
                .spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0),
                value: isActive
            )
            .onChange(of: isActive) { _ in
                // Se activa el salto cuando el estado cambia
                withAnimation {
                    isActive = false
                }
            }
    }
}

extension View {
    func jumpEffect(isActive: Binding<Bool>) -> some View {
        self.modifier(JumpingEffect(isActive: isActive))
    }
}
