//
//  ProfileView.swift
//  cocktails
//
//  Created by Duc hong cai on 20/07/2021.
//

import SwiftUI

struct Profile2View: View {
    var body: some View {
        NavigationView{
        Home()
        .navigationTitle("Profile")
        }
    }
}

struct Profile2View_Previews: PreviewProvider {
    static var previews: some View {
        Profile2View()
    }
}


struct Home: View {
    
    @State var scrollViewOffset:  CGFloat = 0
    
    
    // getting start offset and elimination from Current  offset so what we will get exact offset...
    @State var startOffset:  CGFloat = 0
    
    var body: some View {
        ScrollViewReader { proxyReader in
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 25){
                    ForEach(1...30, id: \.self){ index in
                        HStack(spacing:15){
                            Circle()
                                .fill(Color.gray.opacity(0.5))
                                .frame(width:60,  height:60)
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                
                              RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.5))
                                .frame(height: 22)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(height: 22)
                                    .padding(.trailing,  100)
                            })
                        }
                    }
                }
                .padding()
                .id("SCROLL_TO_TOP")
                // getting scrollview offset
                .overlay(
                    // Using GeometryReader to get scrollview  offset
                    GeometryReader{  geo -> Color in
                        
                        DispatchQueue.main.async {
                            if startOffset == 0 {
                                self.startOffset = geo.frame(in: .global).minY
                            }
                            
                            let offset = geo.frame(in: .global).minY
                            self.scrollViewOffset = -offset + startOffset
                        }
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)
                    
                )
            })
            //if offset goes less than 450 then showing floating action button
            .overlay(
                
                Button(action: {
                    withAnimation(.spring()) {
                        proxyReader.scrollTo("SCROLL_TO_TOP", anchor: .top)
                    }
                }, label: {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.09), radius: 5, x: 5, y: 5)
                })
                .padding(.trailing)
//                .padding(.bottom, getSafeArea().bottom == 0 ? 12 : 0)
                .opacity(-scrollViewOffset > 450 ? 1 : 0)
                .animation(.easeInOut)
                
                
                // fixing at bottom right
                ,alignment: .bottomTrailing
                    
            )
        }
        .navigationTitle("Profile \(String(format: "%.2f", scrollViewOffset))")
    }
}
