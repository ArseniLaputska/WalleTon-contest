//
//  MainView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

enum MainState {
    case loading
    case created
    case transactions
}

struct MainView: View {
    
    @State private var transactions: [Transaction] = [
        Transaction(date: Date(timeIntervalSince1970: +999900000), count: 1.091, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "Testing payments, D.", isReceived: true, transactionId: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", state: .done),
        Transaction(date: Date(timeIntervalSince1970: +999900000), count: 10, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.00734732, comment: "Thanks", isReceived: false, transactionId: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", state: .done),
        Transaction(date: Date(timeIntervalSince1970: +999800000), count: 15, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "", isReceived: true, transactionId: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", state: .cancelled),
        Transaction(date: Date(timeIntervalSince1970: +999700000), count: 12, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "", isReceived: true, transactionId: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", state: .pending),
        Transaction(date: Date(timeIntervalSince1970: +999700000), count: 1.091, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "", isReceived: true, transactionId: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", state: .pending)]
    
    @State private var offset: CGFloat = 0
    @State private var mainState: MainState = .transactions
    @State private var user: User = User(wallet: "UQBFz01R2CU7YA8pevUaNIYEzi1mRo4cX-r3W2Dwx-WEAoKP", balance: 0.0)
    @State private var count: Double = 0.0
    @State private var wallet = "UQBFz01R2CU7YA8pevUaNIYEzi1mRo4cX-r3W2Dwx-WEAoKP"
    
    var body: some View {
        ZStack {
            VStack {
                
                MainNavigationView(mainState: $mainState, user: $user, showTopView: offset > 0, scan: {
                    
                }, settings: {
                    
                })
                
                MainScrollView(user: $user, state: $mainState, transactions: $transactions, offset: $offset)
            }
        }
        .attachPartialSheetToRoot()
        .background(Color.black)
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = CGFloat.zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
