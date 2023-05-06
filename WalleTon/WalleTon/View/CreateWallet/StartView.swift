//
//  StartView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                Spacer()
                
                AnimationView(sticker: .start)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .padding()
                
                TitleView(title: "TON Wallet")
                
                DescriptionView(descr: "TON Wallet allows you to make fast and secure blockchain-based payments without intermediaries.")
                    .padding()
                
                Spacer()
                
                CreateButton(label: "Create my wallet", action: {
                    
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Import existing wallet")
                }).padding(.top, 12.0)
                
                Spacer()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
