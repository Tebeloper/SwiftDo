//
//  LoginView.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isSecure: Bool = true
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView()
                
                //Login Form
                Form {
                    TextField("Email...", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    HStack {
                        if isSecure {
                            SecureField("Password...", text: $password)
                                .textFieldStyle(DefaultTextFieldStyle())
                        } else {
                            TextField("Password...", text: $password)
                                .textFieldStyle(DefaultTextFieldStyle())
                        }
                        
                        Button {
                            isSecure.toggle()
                        } label: {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.pink)
                        }
                    }
                    
                    
                    Button {
                        // Attempt log in...
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Text("Log In")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding()
                    
                }
                
                //Create Account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
