//
//  SendTonView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 15.04.23.
//

import SwiftUI

enum SendState {
    case enterAddress
    case amountOfTON
}

struct SendTonView: View {
    
    @State private var sendState: SendState = .enterAddress
    
    var body: some View {
        NavigationView {
            ZStack {
                switch sendState {
                    case .enterAddress:
                        EnterAddressState(state: $sendState)
                    case .amountOfTON:
                        EnterAddressState(state: $sendState)
                }
            }
            .navigationTitle("Send TON")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SendTonView_Previews: PreviewProvider {
    static var previews: some View {
        SendTonView()
    }
}
