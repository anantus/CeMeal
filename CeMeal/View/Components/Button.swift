//
//  Button.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 24/06/22.
//

import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring(), value: 10)
    }
}
