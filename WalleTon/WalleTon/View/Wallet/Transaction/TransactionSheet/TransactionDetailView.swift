//
//  TransactionDetailView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct TransactionDetailView: View {
    
    @Binding var transaction: Transaction
    
    // TODO: formatter
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateStyle = .short
           return formatter
       }()
    
    var body: some View {
        HStack {
            AnimationView(sticker: .main)
                .aspectRatio(contentMode: .fit)
                .frame(width: 56, height: 56)
            
            Text(transaction.count.description)
                .font(.system(size: 48, weight: .semibold))
                .foregroundColor(transaction.isReceived ? .green : .red)
        }
        .padding(.top, 20.0)
        .padding(.bottom, 6.0)
        
        Text(transaction.fee.description + " transaction fee")
            .font(.subheadline)
            .foregroundColor(.textSecondary)
            .padding(.bottom, 4.0)
        
        switch transaction.state {
            case .cancelled:
                Text("Canceled")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.bottom, 16.0)
            case .pending:
                HStack {
                    CircleAnimation(color: .accentColor)
                        .frame(width: 10, height: 10)
                        .padding(.trailing, 8.0)
                    
                    Text("Pending")
                        .font(.subheadline)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 16.0)
            case .done:
                Text(dateFormatter.string(from: transaction.date))
                    .font(.subheadline)
                    .foregroundColor(.textSecondary)
                    .padding(.bottom, 16.0)
        }
    }
}
