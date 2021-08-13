//
//  ProfileView.swift
//  cocktails
//
//  Created by Duc hong cai on 11/08/2021.
//

import SwiftUI

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var user: LoginViewModel
    var body: some View {
        ZStack{
            VStack(spacing: 15){
                // loginpage header text
                welcomeText()
                
                // loginpage icon image
                loginImage()
                
                // Loginpage form
                loginForm(viewModel: viewModel)
                
                Button(action: {
                    user.loggedIn.toggle()
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            }
            .padding(.bottom, 50)
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
    @ObservedObject var viewModel: LoginViewModel
    
    @State var ShakesUsername: CGFloat = 0
    @State var ShakesPassword: CGFloat = 0
    
    @State var wrongUsername: Bool = false
    @State var wrongPassword: Bool = false
    
    var body: some View {
        // Textfields
        VStack(alignment: .leading, spacing: 15){
            TextField("Email", text: $viewModel.username)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(wrongUsername ? Color.red : Color.clear , lineWidth: 4)
                        .padding(1)
            )
                .modifier(ShakeEffect(shakeNumber: ShakesUsername))
                .onChange(of: viewModel.username, perform: { value in
                    self.wrongUsername = false
                })
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(wrongPassword ? Color.red : Color.clear , lineWidth: 4)
                        .padding(1)
            )
                .onChange(of: viewModel.password, perform: { value in
                    self.wrongPassword = false
                })
                .modifier(ShakeEffect(shakeNumber: ShakesPassword))
            
        }
        .padding(.horizontal, 25)
        .padding(.bottom, 25)
        
        // Login Button
        Button(action: {
            if !viewModel.validateUsername() {
                withAnimation(.default) {
                    self.ShakesUsername += 5
                    self.wrongUsername = true
                }
            }
            if !viewModel.validatePassword() {
                withAnimation(.default) {
                    self.wrongPassword = true
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
