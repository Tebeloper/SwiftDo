//
//  RegisterViewViewModel.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var passwordIsSecure: Bool = true
    @Published var confirmedPasswordIsSecure: Bool = true
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
    }
    
    func validate() -> Bool {
        if password != confirmedPassword {
            password = ""
            confirmedPassword = ""
            errorMessage = "The passwords doesn't match."
        } else {
            print("passwords are the same...")
        }
        return true
    }
}
