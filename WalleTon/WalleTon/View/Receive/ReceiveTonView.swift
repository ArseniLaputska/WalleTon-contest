//
//  ReceiveTonView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 14.04.23.
//

import SwiftUI

struct ReceiveTonView: View {
    
    @State var wallet: String = "UQBFz01R2CU7YA8pevUaNIYEzi1mRo4cX-r3W2Dwx-WEAoKP"
    
    var body: some View {
        ZStack {
            VStack {
                Text("Receive Toncoin")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 12.0)
                
                Text("Send only \(Text("Toncoin (TON)").bold()) to this address. \nSending other coins may result in permanent loss.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32.0)
                    .padding(.bottom, 50.0)
                
                Image(systemName: "qrcode")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220, height: 220)
                    .padding(.bottom, 74.0)
                
                Text(wallet)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 6.0)
                
                Text("Your wallet address")
                    .font(.bodyRegular())
                    .foregroundColor(.textSecondary)
                
            }
        }
    }
}

struct ReceiveTonView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveTonView()
    }
}
