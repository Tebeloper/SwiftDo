//
//  LoginViewViewModel.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 01/05/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var isSecure: Bool = true
    @Published var email: String = ""
    @Published var password: String = ""

    init() {}
    
    func login() {
        
    }
    
    func validate() {
        
    }
}
