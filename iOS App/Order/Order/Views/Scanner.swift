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
    @State var scannedCode: String = "Scan a QR Code"
    
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
        VStack{
            Text(scannedCode)
                .padding(.bottom, 5.0)
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
}
