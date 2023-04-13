//
//  TransactionView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct TransactionView: View {
    
    @State var transaction: Transaction
    
    //to be implemented properly
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateStyle = .short
           return formatter
       }()
    
    //to be implemented properly
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 9
        return formatter
    }()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    AnimationView(sticker: .main)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                    
                    Text("\(transaction.count.description)")
                        .padding(.leading, 1.0)
                        .padding(.trailing, 3.0)
                        .foregroundColor(transaction.isReceived ? .green : .red)
                    
                    Text(transaction.isReceived ? "from" : "to")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(dateFormatter.string(from: transaction.date))
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.textSecondary)
                }
                
                HStack {
                    HuggedText(hugTo: 6, text: transaction.address)
                        .padding(.top, 6.0)
                        .padding(.bottom, 8.0)
                    
                    Spacer()
                }
                
                HStack {
                    Text(transaction.fee.feeWrapper + " storage fee")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.textSecondary)
                    
                    Spacer()
                }
                .padding(.bottom, !transaction.comment.isEmpty ? 8.0 :  16.0)
                
                if !transaction.comment.isEmpty {
                    HStack {
                        BubbleComment(comment: transaction.comment)
                        
                        Spacer()
                    }
                    .padding(.bottom, 16.0)
                }
            }
        }
    }
}
