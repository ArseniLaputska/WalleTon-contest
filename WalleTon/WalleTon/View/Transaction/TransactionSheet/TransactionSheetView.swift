//
//  TransactionSheetView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct TransactionSheet: View {
    
    @State var transaction: Transaction
    @Environment(\.presentationMode) private var presentationMode
    
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateStyle = .short
           return formatter
       }()
    
    var body: some View {
        ZStack {
            VStack {
//                TransactionHeaderView(dismiss: {
//                })
//                
                TransactionDetailView(transaction: $transaction)
                
                BubbleComment(comment: transaction.comment)
                    .padding(.bottom, 16.0)
                
                TransactionBodyView(transaction: $transaction, viewInExplorer: {
                    
                })
                
                CreateButton(label: "Send TON to this address", action: {
                    
                })
                .padding(.top, 24.0)
                .padding(.bottom, 12.0)
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
