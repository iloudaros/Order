//
//  Authentication.swift
//  Order
//
//  Created by Ioannis Loudaros on 15/12/21.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    
    func updateValidation(success: Bool) {
            isValidated = success
        }
    }

