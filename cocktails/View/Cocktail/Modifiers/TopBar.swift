//
//  TopBar.swift
//  cocktails
//
//  Created by Duc hong cai on 01/08/2021.
//

import Foundation
import SwiftUI

struct TopBar: ViewModifier {
    
    @Binding var showBar: Bool
    @State var startOffset:  CGFloat = 0
    @State var offset:  CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{ geo -> Color in
                    DispatchQueue.main.async {
                        if startOffset == 0 {
                            self.startOffset = geo.frame(in: .global).minY
                        }
                        
                        let offset = geo.frame(in: .global).minY
                        self.offset = -offset + startOffset
                        self.showBar = self.offset > 10 ? true : false
                    }
                    
                    return Color.clear
                }
            )
    }
}
