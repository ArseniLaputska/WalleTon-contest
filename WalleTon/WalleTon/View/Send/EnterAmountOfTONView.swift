//
//  EnterAmountOfTONView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 15.04.23.
//

import SwiftUI

struct EnterAmountOfTONView: View {
    
    @State var wallet = "UQBFsF6_masda_3tE_yRUoqU96asdxuZSP8577EOvo_1234"
    @State var walletDNS = "arseni.ton"
    @State var amountOfTON = ""
    
    @State private var allTONs = 56.2322
    @State private var sendAll = false
    
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Send to:")
                    .foregroundColor(.textSecondary)
                
                HuggedText(hugTo: 4, text: wallet)
                
                Text(walletDNS)
                    .foregroundColor(.textSecondary)
                
                Spacer()
                
                Button("Edit", action: {
                    
                })
            }
            .padding(.horizontal, 16.0)
            .padding(.bottom, 110.0)
            
            HStack {
                AnimationView(sticker: .main)
                    .frame(maxWidth: 48, maxHeight: 48)
                
                TextField("0", text: $amountOfTON)
                    .font(.system(size: 48))
            }
            .padding(.leading, 145.5)
            .padding(.bottom, 105.0)
            
            Toggle(isOn: $sendAll, label: {
                    HStack {
                        Text("Send all")
                        
                        AnimationView(sticker: .main)
                            .frame(maxWidth: 22, maxHeight: 22)
                        
                        Text(allTONs.description)
                    }
            })
            .onChange(of: sendAll, perform: { newValue in
                amountOfTON = newValue ? "\(Int(allTONs))" + allTONs.decimal : ""
            })
            .padding(.horizontal, 16.0)
        }
    }
}

extension Double {

    /// Gets the decimal value from a double.
    var decimal: String {
        self.description.drop { $0 != "." }.description
    }
}

struct EnterAmountOfTONView_Previews: PreviewProvider {
    static var previews: some View {
        EnterAmountOfTONView()
    }
}
