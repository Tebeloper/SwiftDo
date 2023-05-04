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
    
    init() {}
}
