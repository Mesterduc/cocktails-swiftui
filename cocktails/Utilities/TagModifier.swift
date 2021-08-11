//
//  TagModifier.swift
//  cocktails
//
//  Created by Duc hong cai on 27/07/2021.
//

import Foundation
import SwiftUI

struct Tag: ViewModifier{
    let color: Color
    
    func body(content: Content) -> some  View {
        content
            .padding(.horizontal, 7)
            .padding(.vertical, 5)
            .background(color)
            .cornerRadius(12)
    }
}

extension View {
    func TagModifier(color: Color = Color.gray) -> some  View {
        modifier(Tag(color: color))
    }
}
