//
//  Scanner.swift
//  Order
//
//  Created by Ioannis Loudaros on 14/12/21.
//

import SwiftUI
import CodeScanner

struct Scanner: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = ""
    
    var scannerSheet : some View {
        CodeScannerView(codeTypes: [.qr],
                        completion:{ result in
            if case let .success(code) = result {
                self.scannedCode = code
                self.isPresentingScanner = false
            }
        }
        )
    }
    
    
    var body: some View {
        ZStack {
            Image("background").offset(y:50)
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Text(scannedCode)
                    .padding(.bottom, 5.0)
               
                Button{
                    self.isPresentingScanner = true
                } label: {
                    Image("button")
                } .sheet(isPresented: $isPresentingScanner){
                    self.scannerSheet
                }
                
                
                Spacer()
            }
        }.background(Color("order blue"))
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        Scanner()
    }
}
