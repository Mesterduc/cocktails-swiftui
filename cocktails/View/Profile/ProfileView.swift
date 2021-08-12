//
//  ProfileView.swift
//  cocktails
//
//  Created by Duc hong cai on 11/08/2021.
//

import SwiftUI

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        ZStack{
            VStack(spacing: 15){
                // loginpage header text
                welcomeText()
                
                // loginpage icon image
                loginImage()
                
                // Loginpage form
                loginForm(viewModel: viewModel)
            }
        }
        // background
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [.orange, .purple]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct welcomeText: View {
    var body: some View {
        Text("Welcome to Cocktail")
            .font(.largeTitle.weight(.semibold))
            .padding(15)
            .foregroundColor(.blue)
    }
}

struct loginImage: View {
    var body: some View {
        Image("Cocktail_Icon")
            .resizable()
            .clipShape(Capsule())
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .padding(10)
            .background(Color.orange)
            .clipShape(Capsule())
            .padding(.bottom, 50)
            .padding()
    }
}

struct loginForm: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var ShakesUsername: CGFloat = 0
    @State var ShakesPassword: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            TextField("Email", text: $viewModel.username)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShakeEffect(shakeNumber: ShakesUsername))
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShakeEffect(shakeNumber: ShakesPassword))
            
        }
        .padding(.horizontal, 25)
        .padding(.bottom, 25)
        
        Button(action: {
            if !viewModel.validateUsername() {
                withAnimation(.default) {
                    self.ShakesUsername += 5
                }
            }
            if !viewModel.validatePassword() {
                withAnimation(.default) {
                    self.ShakesPassword += 5
                }
            }
        }, label: {
            Text("Sign In")
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(20)
                .foregroundColor(.white)
                .font(.title2.weight(.semibold))
        })
    }
}
