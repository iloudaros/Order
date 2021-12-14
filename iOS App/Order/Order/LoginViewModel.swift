//
//  LoginViewModel.swift
//  Order
//
//  Created by Ioannis Loudaros on 15/12/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        APIService.shared.login(credentials: credentials) { [unowned self](result:Result<Bool, Authentication.AuthenticationError>) in
         showProgressView = false
            switch result {
            case .success:
                completion(true)
            case .failure(let authError):
                credentials = Credentials()
                error = authError
                completion(false)
            }
        }
    }
}
