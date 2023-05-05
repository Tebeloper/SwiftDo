//
//  LoginView.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "SwiftDo", subtitle: "Get things done", angle: 15, backgroundColor: .yellow)
                
                //Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email...", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    HStack {
                        if viewModel.isSecure {
                            SecureField("Password...", text: $viewModel.password)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        } else {
                            TextField("Password...", text: $viewModel.password)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        }
                        
                        Button {
                            viewModel.isSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.isSecure ? "eye.slash" : "eye")
                        }
                    }
                    
                    
                    SDButton(title: "Log In", backgroundColor: .blue, action: {
                        //Attempt log in...
                        viewModel.login()
                    })
                }
                .offset(y: -150)
                
                //Create Account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Register", destination: RegisterView())
                        .foregroundColor(.green)
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }.navigationBarBackButtonHidden()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
