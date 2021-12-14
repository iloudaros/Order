//
//  ContentView.swift
//  Order
//
//  Created by Ioannis Loudaros on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @State public var valid: Bool = true
    
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Image("LogoLetters")
                Spacer()
                VStack(alignment: .center){
                    
                    ZStack(alignment: .center) {
                        Image("logrec")
                        TextField("Username", text: $loginVM.credentials.email ).multilineTextAlignment(.center)
                    }
                    ZStack {
                        Image("logrec")
                        SecureField("Password", text: $loginVM.credentials.password )
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding(.bottom)
                
                Button{
                    if (username == "iloudaros" && pass == "password")
                    {
                        
                    }
                    else
                    {
                        valid = false
                    }
                } label: {
                    Text("Connect")
                        .fontWeight(.bold)
                        .foregroundColor(Color("order pink"))
                }
                .padding(.bottom)
                
                Text(valid ? "" : "Wrong Credentials!")
                    .foregroundColor(Color.red)
                Spacer()
            }.background(Color("order blue"))
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
