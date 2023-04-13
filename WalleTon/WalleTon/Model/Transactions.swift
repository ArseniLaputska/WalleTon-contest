//
//  Transactions.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import Foundation

enum TransactionState: Decodable {
    case pending
    case cancelled
    case done
}

struct Transaction: Decodable, Identifiable {
    var id = UUID()
    let date: Date
    let count: Double
    let address: String
    let fee: Double
    let comment: String
    let isReceived: Bool
    let transactionId: String
    let state: TransactionState
}
