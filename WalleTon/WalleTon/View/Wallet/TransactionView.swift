//
//  TransactionView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct TransactionsListView: View {
    
    @State var transactons: [Transaction]
    @State private var currentTransaction: Transaction?
    @State private var isSheetPresented = false
    
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
                        .onTapGesture {
                            currentTransaction = transaction
                            isSheetPresented = true
                        }
                        .partialSheet(isPresented: $isSheetPresented, content: {
                            if let currentTransaction {
                                TransactionSheet(transaction: currentTransaction)
                            }
                        })
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
                HStack {
                    Text("Transaction")
                    
                    Button("Done", action: {
                        dismiss()
                    })
                }
                
                HStack {
                    AnimationView(sticker: .main)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56, height: 56)
                    
                    Text(transaction.count.description)
                        .font(.bodySemibold())
                        .foregroundColor(.green)
                }
                .padding(.top, 20.0)
                .padding(.bottom, 6.0)
                
                Text(transaction.fee.description + "transaction fee")
                    .font(.subheadline)
                    .foregroundColor(.textSecondary)
                    .padding(.bottom, 4.0)
                
                Text(dateFormatter.string(from: transaction.date))
                    .font(.subheadline)
                    .foregroundColor(.textSecondary)
                    .padding(.bottom, 16.0)
                
                BubbleComment(comment: transaction.comment)
                    .padding(.bottom, 16.0)
                
                Section(header: Text("DETAILS")) {
                    VStack {
                        HStack {
                            Text("Sender address")
                            Spacer()
                            HuggedText(hugTo: 4, text: transaction.address)
                        }
                        
                        HStack {
                            Text("Transaction")
                            Spacer()
                            HuggedText(hugTo: 6, text: transaction.transactionId)
                        }
                        
                        Button("View in explorer", action: {
                            
                        })
                    }
                }
                
                CreateButton(label: "Send TON to this address", action: {
                    
                })
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
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
                        BubbleComment(comment: transaction.comment)
                        
                        Spacer()
                    }
                    .padding(.bottom, 16.0)
                }
            }
        }
    }
}

struct BubbleComment: View {
    let comment: String
    
    var body: some View {
        Text(comment)
            .font(.subheadline)
            .fontWeight(.regular)
            .padding(.horizontal, 10)
            .padding(.vertical, 8.0)
            .background(Color.textField)
            .clipShape(BubbleShape())
    }
}
