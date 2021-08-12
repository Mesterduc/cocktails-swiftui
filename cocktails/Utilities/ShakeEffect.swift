//
//  ShakeEffeckt.swift
//  cocktails
//
//  Created by Duc hong cai on 13/08/2021.
//

import Foundation
import SwiftUI

struct ShakeEffect: AnimatableModifier {
    var shakeNumber: CGFloat = 0

    var animatableData: CGFloat {
        get {
            shakeNumber
        } set {
            shakeNumber = newValue
        }
    }

    func body(content: Content) -> some View {
        content
            .offset(x: sin(shakeNumber * .pi) * 10)
    }
}
