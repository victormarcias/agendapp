//
//  BounceEffect.swift
//  Agenda
//
//  Created by Victor Marcias on 01/09/2024.
//

import SwiftUI

private struct BounceEffect: ViewModifier {
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isActive ? 1.1 : 1.0)  // Cambia ligeramente el tamaño para crear el efecto de rebote
            .animation(
                .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0),
                value: isActive
            )
            .onAppear {
                isActive = false  // Resetea el estado al cargar la vista
            }
            .onChange(of: isActive) { newValue in
                if newValue {
                    withAnimation {
                        isActive.toggle()  // Activa la animación una vez
                    }
                }
            }
    }
}

extension View {
    func bounceEffect(isActive: Binding<Bool>) -> some View {
        modifier(BounceEffect(isActive: isActive))
    }
}
