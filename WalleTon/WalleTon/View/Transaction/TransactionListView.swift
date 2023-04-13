//
//  TransactionListView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
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
                                    .padding(.horizontal, 16.0)
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
