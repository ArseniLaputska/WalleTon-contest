//
//  TransactionHeaderView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct TransactionHeaderView: View {
    
    var dismiss: () -> Void
    
    var body: some View {
        HStack {
            Text("Transaction")
                .font(.bodySemibold())
                .foregroundColor(.primary)
            
            Spacer()
            
            Button("Done", action: dismiss)
        }
        .padding(.vertical, 17.0)
    }
}
