//
//  BtnButton.swift
//  cocktails
//
//  Created by Duc hong cai on 25/07/2021.
//

import Foundation
import SwiftUI

struct ChangeBtnBack: ViewModifier {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func body(content: Content) -> some  View {
            content
//                .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
    
    var btnBack : some View {
        
//        GeometryReader { geo in
//            print(geo.frame(in: .local).maxX)
            
            
            
            HStack{
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                {
                    HStack {
                        Image(systemName: "arrow.left") // set image here
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .font(.system(size: 15))
//                        Spacer()
//                        Image(systemName: "arrow.left")
                    }
                    
                }
//                Spacer()
//                Image(systemName: "arrow.left")
            }
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 80, maxHeight: 100, alignment: .center)
//            .padding()
            
//            return Color.clear
//        }
//        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, idealHeight: 80, maxHeight: 100, alignment: .center)
//        .padding()
    }
}
extension View{
    func BtnBack()  -> some View {
        modifier(ChangeBtnBack())
    }
}



// Makes swiping back work again - don't know what is does
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
