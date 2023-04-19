//
//  EnterAddressState.swift
//  WalleTon
//
//  Created by Arseni Laputska on 15.04.23.
//

import SwiftUI

struct EnterAddressView: View {
    
    @Binding var state: SendState
    // TODO: if nil == "Enter Wallet Address or Domain..."
    @Binding var wallet: String
    @State private var isCorrectAddress = true
    
    var body: some View {
        VStack {

            HStack {
                if wallet.count <= 1 {
                    TextField("Enter Wallet Address or Domain", text: $wallet)
                        .padding(10.0)
                } else {
                    TextEditor(text: $wallet)
                        .colorMultiply(.textField)
                        .keyboardType(.alphabet)
                        .accessibilityHidden(true)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .textFieldStyle(.plain)
                        .padding(10.0)
                }
                
                Button(action: {
                    wallet = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                })
                .accentColor(.gray)
                .padding(.trailing, 10.0)
            }
            .frame(maxWidth: .infinity, maxHeight: wallet.count <= 1 ? 50 : 80)
            .background(Color.textField)
            .cornerRadius(10)
            .padding(.horizontal, 16.0)
            .padding(.bottom, 16.0)
            
            Text("Paste the 24-letter wallet address of the recipient here or TON DNS.")
                .font(.callout)
                .foregroundColor(.walletUnderline)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 17.0)
                .padding(.bottom, 12.0)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "doc.on.clipboard.fill")
                    
                    Text("Paste")
                })
                .padding(.trailing, 19.0)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "qrcode.viewfinder")
                    
                    Text("Scan")
                })
                
                Spacer()
            }
            .padding(.leading, 16.0)
            
//                    HStack {
//                        Text("RECENTS")
//                            .font(.footnote)
//                            .foregroundColor(.textSecondary)
//
//                        Spacer()
//
//                        Button("CLEAR", action: {
//
//                        })
//                        .font(.footnote)
//                    }
//                    .padding(.top, 44.0)
//                    .padding(.horizontal, 16.0)
            
            // TODO: add recents;
            
            if !isCorrectAddress {
                Spacer()
                
                InvalidAddressView()
                    .padding(.bottom, 12.0)
            } else {
                Spacer()
            }
            
            MainButton(label: {
                Text("Continue")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }, action: {
                state = .amountOfTON
            })
            .disabled(wallet.isEmpty ? true : false)
            .padding(.horizontal, 16.0)
            .padding(.bottom, 10)
        }
    }
}
