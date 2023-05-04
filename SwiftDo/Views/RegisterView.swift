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
    @State private var confirmedPasswordPlaceholder = Text("Confirmed Password...")
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "Register", subtitle: "Start organizing To-Do's", angle: -15, backgroundColor: .red)
                
                //Login Form
                Form {
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
                    }
                    
                    HStack {
                        if viewModel.confirmedPasswordIsSecure {
                            SecureField("", text: $viewModel.confirmedPassword, prompt: confirmedPasswordPlaceholder)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        } else {
                            TextField("", text: $viewModel.confirmedPassword, prompt: confirmedPasswordPlaceholder)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                        }
                        
                        Button {
                            viewModel.confirmedPasswordIsSecure.toggle()
                        } label: {
                            Image(systemName: viewModel.confirmedPasswordIsSecure ? "eye.slash" : "eye")
                        }
                    }
                    SDButton(title: "Register", backgroundColor: .green, action: {
                        if viewModel.password != viewModel.confirmedPassword {
                            viewModel.password = ""
                            viewModel.confirmedPassword = ""
                            
                            passwordPlaceholder = Text("Password...").foregroundColor(.red)
                            confirmedPasswordPlaceholder = Text("Confirmed Password").foregroundColor(.red)
                        } else {
                            print("passwords are the same...")
                        }
                    })
                }
                .offset(y: -100)
                
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
