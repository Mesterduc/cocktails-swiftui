//
//  ScrollViewOffset.swift
//  cocktails
//
//  Created by Duc hong cai on 30/07/2021.
//

import SwiftUI
// two way
struct CustomScrollView<Content: View>: View {
    // to hold our view
    var content: Content
    
    @Binding var  offset: CGPoint
    var showIndicators:  Bool
    var axis:  Axis.Set
    
    init(offset: Binding<CGPoint>, showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: ()-> Content) {
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
    }
    // Getting exact start Offset and minu from current Offset
    @State var startOffset: CGPoint = .zero
    var body: some View {
        ScrollView(axis, showsIndicators: showIndicators, content: {
            content
            // getting Offset.......
                .overlay(
                    GeometryReader{proxy -> Color in
                        
                        let rect = proxy.frame(in: .global)
                        
                        if startOffset == .zero{
                            DispatchQueue.main.async {
                                startOffset = CGPoint(x: rect.minX, y: rect.minY)
                            }
                            
                        }
                        DispatchQueue.main.async {
                            self.offset = CGPoint(x: startOffset.x - rect.minX, y: startOffset.y - rect.minY)
                        }
                        
                        return Color.clear
                    }
                    // since were also fetching horzontal offset
                    // so setting width to full so that minx will be zero...
                    .frame(width: UIScreen.main.bounds.width, height: 0)
                    ,alignment: .top
                )
            
        })
    }
}
// one way
//struct CustomScrollView<Content: View>: View {
//    // to hold our view
//    var content: Content
//
//    @Binding var  offset: CGFloat
//    var showIndicators:  Bool
////    var axis:  Axis.Set
//
//    init(offset: Binding<CGFloat>, showIndicators: Bool, @ViewBuilder content: ()-> Content) {
//        self.content = content()
//        self._offset = offset
//        self.showIndicators = showIndicators
////        self.axis = axis
//    }
//    // Getting exact start Offset and minu from current Offset
//    @State var startOffset: CGFloat = 0
//    var body: some View {
//        ScrollView(showsIndicators: showIndicators, content: {
//            content
//            // getting Offset.......
//                .overlay(
//                    GeometryReader{proxy -> Color in
//
////                        let rect = proxy.frame(in: .global)
//
//                        if startOffset == .zero{
//                            DispatchQueue.main.async {
//                                startOffset = proxy.frame(in: .global).minY
//                            }
//
//                        }
//                        DispatchQueue.main.async {
//                            self.offset = startOffset - proxy.frame(in: .global).minY
//                        }
//
//                        return Color.clear
//                    }
//                    // since were also fetching horzontal offset
//                    // so setting width to full so that minx will be zero...
//                    .frame(width: UIScreen.main.bounds.width, height: 0)
//                    ,alignment: .top
//                )
//
//        })
//    }
//}
//
