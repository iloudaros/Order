//
//  Scanner.swift
//  Order
//
//  Created by Ioannis Loudaros on 14/12/21.
//

/*
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
        ).ignoresSafeArea()
    }
    
    
    var body: some View {
        VStack{
            Button("Scan QR Code"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        Scanner()
    }
}*/


import SwiftUI
import CodeScanner

struct Scanner: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = ""
    @State var didscan: Bool = false
    
    var scannerSheet : some View {
        CodeScannerView(codeTypes: [.qr],
                        completion:{ result in
            if case let .success(code) = result {
                withAnimation{self.scannedCode = code}
                self.isPresentingScanner = false
            }
        }
        )
            .ignoresSafeArea()
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
            if scannedCode == "0000000000"{
                Image("Results").transition(.slide)

            }
        }.background(Color("order blue"))
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        Scanner()
    }
}

