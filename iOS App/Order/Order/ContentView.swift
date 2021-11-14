//
//  ContentView.swift
//  Order
//
//  Created by Ioannis Loudaros on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(){
            Spacer()
            Image("logo").resizable()
                         .aspectRatio(contentMode: .fit)
            Spacer()
            HStack(alignment: .center, spacing: 30.0) {
                Text("Left item")
                Text("Right item")
            }
            Spacer()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
