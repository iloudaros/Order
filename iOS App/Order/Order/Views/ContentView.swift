//
//  ContentView.swift
//  Order
//
//  Created by Ioannis Loudaros on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State public var username: String = ""
    @State public var pass: String = ""
    @State public var valid: Bool = true
    @EnvironmentObject var authentication: Authentication


    var body: some View {
        VStack{
            Spacer()
            Image("LogoLetters")
            Spacer()
            VStack(alignment: .center){
                
                ZStack(alignment: .center) {
                    Image("logrec")
                    TextField("Username", text: $username ).multilineTextAlignment(.center)
                }
                ZStack {
                    Image("logrec")
                    SecureField("Password", text: $pass )
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.bottom)
                        
            Button{
                if (username == "iloudaros" && pass == "password")
                {
                    authentication.updateValidation(success: true)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
