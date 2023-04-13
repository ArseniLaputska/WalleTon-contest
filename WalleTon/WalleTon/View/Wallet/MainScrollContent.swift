//
//  MainScrollContent.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct MainScrollContent: View {
    
    @Binding var state: MainState
    @Binding var user: User
    @Binding var transactions: [Transaction]
    
    var body: some View {
        switch state {
            case .created:
                AnimationView(sticker: .created)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 124, height: 124)
                    .padding(.top, 90.0)
                
                TitleView(title: "Wallet Created")
                    .padding(.top, 8.0)
                    .padding(.bottom, 28.0)
                
                Text("Your wallet address")
                    .foregroundColor(.secondary)
                    .font(.bodyRegular())
                    .padding(.bottom, 6.0)
                
                Text(user.wallet)
                    .padding(.horizontal, 65.0)
                
            case .loading:
                AnimationView(sticker: .loading)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 124, height: 124)
                    .padding(.top, 170.0)
            case .transactions:
                TransactionsListView(transactons: transactions)
                    .padding(.horizontal, 16.0)
        }
    }
}
