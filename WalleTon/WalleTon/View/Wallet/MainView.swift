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
        Transaction(date: Date(timeIntervalSince1970: +999900000), count: 1.091, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "Testing payments, D.", isReceived: true),
        Transaction(date: Date(timeIntervalSince1970: +999900000), count: 10, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.00734732, comment: "Thanks", isReceived: false),
        Transaction(date: Date(timeIntervalSince1970: +999800000), count: 15, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "", isReceived: true),
        Transaction(date: Date(timeIntervalSince1970: +999700000), count: 12, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "", isReceived: true),
        Transaction(date: Date(timeIntervalSince1970: +999700000), count: 1.091, address: "12nP8p4Ad9BDh4Ad9BDh4Ad9BDh", fee: 0.000065732, comment: "", isReceived: true)]
    
    @State private var offset: CGFloat = 0
    @State private var showTopView: Bool = false
    @State private var mainState: MainState = .transactions
    @State private var count: Double = 0.0
    @State private var wallet = "UQBFz01R2CU7YA8pevUaNIYEzi1mRo4cX-r3W2Dwx-WEAoKP"
    
    var body: some View {
        ZStack {
            VStack {
                
                MainNavigationView(mainState: $mainState, showTopView: offset > 0, balance: $count, scan: {
                    
                }, settings: {
                    
                })
                
                ScrollView {
                    
                    VStack {
                        MainBody(wallet: $wallet, balance: $count, state: $mainState)
                        
                        MainButtonsView(receive: {
                            
                        }, send: {
                            
                        })
                        .frame(height: 50)
                        .padding(.top, 36.0)
                        .padding(.bottom, 16.0)
                    }
                    
                    VStack {
                        MainScrollContent(state: $mainState, wallet: $wallet, transactions: $transactions)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(TopRoundedRectangle(radius: 12).fill(Color.white))
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .preference(key: OffsetPreferenceKey.self, value: -geo.frame(in: .named("scroll")).origin.y)
                        }
                    )
                    .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                        self.offset = offset
                    }
                }
                .coordinateSpace(name: "scroll")
            }
        }
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
