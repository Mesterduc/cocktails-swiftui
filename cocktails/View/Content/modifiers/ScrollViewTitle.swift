//
//  ScrollViewTitle.swift
//  cocktails
//
//  Created by Duc hong cai on 04/08/2021.
//

import Foundation
import SwiftUI

struct ScrollViewTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
//            .padding([.leading, .top, .trailing])
//            .padding(.bottom, -1)
            .padding(.horizontal, 10)
            .padding(.vertical,  0)
            .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
    }
}

extension View {
    func TitleModifier() -> some  View {
        modifier(ScrollViewTitleModifier())
    }
}

