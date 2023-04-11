//
//  TransactionView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct TransactionsListView: View {
    
    @State var transactons: [Transaction]
    
    //to be implemented properly
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        ForEach(groupedTransactions.keys.sorted(by: >), id: \.self) { date in
            Section(header: headerFor(date)) {
                ForEach(groupedTransactions[date]!) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .padding(.top, 20.0)
        }
    }
    
    private func headerFor(_ date: Date) -> some View {
        Text(dateFormatter.string(from: date))
            .font(.bodySemibold())
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var groupedTransactions: [Date: [Transaction]] {
        Dictionary(grouping: transactons, by: { Calendar.current.startOfDay(for: $0.date) })
    }
}

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
                        Text(transaction.comment)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8.0)
                            .background(Color.textField)
                            .clipShape(BubbleShape())
                        
                        Spacer()
                    }
                    .padding(.bottom, 16.0)
                }
            }
        }
    }
}
