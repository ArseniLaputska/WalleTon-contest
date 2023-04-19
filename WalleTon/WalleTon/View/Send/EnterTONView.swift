//
//  EnterAmountOfTONView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 15.04.23.
//

import SwiftUI

struct EnterTONView: View {
    
    @Binding var wallet: String
    @State var walletDNS = "arseni.ton" // TODO: wallet DNS
    @Binding var amountOfTON: String
    @Binding var state: SendState
    
    @State private var allTONs = 56.2322
    @State private var sendAll = false
    @State private var isSufficient = true
    @State private var showConfirm: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Send to:")
                        .foregroundColor(.textSecondary)
                    
                    HuggedText(hugTo: 4, text: wallet)
                    
                    Text(walletDNS)
                        .foregroundColor(.textSecondary)
                    
                    Spacer()
                    
                    Button("Edit", action: {
                        state = .enterAddress
                    })
                }
                .padding(.horizontal, 16.0)
                .padding(.bottom, 110.0)
                
                HStack {
                    AnimationView(sticker: .main)
                        .frame(maxWidth: 48, maxHeight: 48)
                    
                    TextField("0", text: $amountOfTON)
                        .font(.system(size: 24))
                        .foregroundColor(!isSufficient ? .red : .black)
                        .keyboardType(.decimalPad)
                        .onChange(of: amountOfTON, perform: { newValue in
                            isSufficient = isSufficientAmout(newValue)
                        })
                }
                .padding(.leading, 145.5)
                .padding(.bottom, !isSufficient ? 1.0 : 105.0)
                
                if !isSufficient {
                    Text("Insufficient funds")
                        .foregroundColor(.red)
                }
                
                Spacer()
                
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
                .padding(.bottom, 5.0)
                
                NavigationLink(destination: ConfirmView(wallet: wallet, count: amountOfTON), tag: 1, selection: $showConfirm) {
                    MainButton(label: {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }, action: {
                        showConfirm = 1
                    })
                    .disabled((amountOfTON.isEmpty || !isSufficient) ? true : false)
                    .padding(.horizontal, 16.0)
                    .padding(.bottom, 10)
                }
            }
        }
    }
    
    private func isSufficientAmout(_ amount: String) -> Bool {
        
        return Double(amount) ?? 0.0 <= allTONs
    }
}

extension Double {

    /// Gets the decimal value from a double.
    var decimal: String {
        self.description.drop { $0 != "." }.description
    }
}
