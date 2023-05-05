//
//  RegisterView.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    @State private var passwordPlaceholder = Text("Password...")
    @State private var confirmPasswordPlaceholder = Text("Confirm Password...")
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "Register", subtitle: "Start organizing To-Do's", angle: -15, backgroundColor: .red)
                
                //Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Username...", text: $viewModel.userName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Email...", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    HStack {
                        if viewModel.passwordIsSecure {
                            SecureField("", text: $viewModel.password, prompt: passwordPlaceholder)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        } else {
                            TextField("", text: $viewModel.password, prompt: passwordPlaceholder)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        }
                        
                        Button {
                            viewModel.passwordIsSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.passwordIsSecure ? "eye.slash" : "eye")
                        }
                        .foregroundColor(.green)
                    }
                    
                    HStack {
                        if viewModel.confirmedPasswordIsSecure {
                            SecureField("", text: $viewModel.confirmedPassword, prompt: confirmPasswordPlaceholder)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        } else {
                            TextField("", text: $viewModel.confirmedPassword, prompt: confirmPasswordPlaceholder)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        }
                        
                        Button {
                            viewModel.confirmedPasswordIsSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.confirmedPasswordIsSecure ? "eye.slash" : "eye")
                        }
                        .foregroundColor(.green)
                    }
                    SDButton(title: "Register", backgroundColor: .green, action: {
                        viewModel.register()
                    })
                }
                .scrollDisabled(true)
                .offset(y: -150)
                
                //Create Account
                VStack{
                    Text("Already have an account?")
                    
                    NavigationLink("Login", destination: LoginView())
                }
                .padding(.bottom, 50)
                
                Spacer()
                
            }
        }.navigationBarBackButtonHidden()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
