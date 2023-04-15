//
//  TransactionBodyView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct TransactionBodyView: View {
    
    @Binding var transaction: Transaction
    var viewInExplorer: () -> Void
    
    var body: some View {
        Section(header: headerForSection()) {
            VStack {
                
                if !transaction.isReceived {
                    HStack {
                        Text("Recipient")
                            .font(.bodyRegular())
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        HuggedText(hugTo: 4, text: transaction.address) // TODO: recipient
                            .font(.bodyRegular())
                            .foregroundColor(.textSecondary)
                    }
                    .padding(.top, 11.0)
                    
                    Color.gray
                        .frame(width: .infinity, height: 0.5)
                        .padding(.vertical, 11.0)
                }
                
                HStack {
                    Text(transaction.isReceived ? "Sender address" : "Recipient address")
                        .font(.bodyRegular())
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    HuggedText(hugTo: 4, text: transaction.address)
                        .font(.bodyRegular())
                        .foregroundColor(.textSecondary)
                }
                .padding(.top, transaction.isReceived ? 11.0 : 0)
                
                Color.init(white: 0.7)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
                    .padding(.vertical, 11.0)
                
                HStack {
                    Text("Transaction")
                        .font(.bodyRegular())
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    HuggedText(hugTo: 6, text: transaction.transactionId)
                        .font(.bodyRegular())
                        .foregroundColor(.textSecondary)
                }
                
                Color.init(white: 0.7)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
                    .padding(.vertical, 11.0)
                
                HStack {
                    Button("View in explorer", action: viewInExplorer)
                    
                    Spacer()
                }
            }
        }
    }
    
    private func headerForSection() -> some View {
        HStack {
            Text("DETAILS")
                .foregroundColor(.textSecondary)
            
            Spacer()
        }
    }
}
