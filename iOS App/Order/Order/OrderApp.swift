//
//  OrderApp.swift
//  Order
//
//  Created by Ioannis Loudaros on 11/12/21.
//

import SwiftUI

@main
struct OrderApp: App {
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                Scanner().environmentObject(authentication)
            }
            else {
                ContentView().environmentObject(authentication)
            }
            
        }
    }
}

