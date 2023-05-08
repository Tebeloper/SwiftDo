//
//  LoginViewViewModel.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var isSecure: Bool = true
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""

    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
               !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
