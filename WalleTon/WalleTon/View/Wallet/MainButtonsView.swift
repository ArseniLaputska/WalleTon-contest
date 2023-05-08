//
//  MainButtonsView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct MainButtonsView: View {
    
    var receive: () async -> Void
    var send: () async -> Void
    
    var body: some View {
        HStack {
            MainButton(label: {
                HStack(alignment: .center, spacing: .zero) {
                    Image(systemName: "arrow.down.left")
                    
                    Text("Receive")
                        .font(.bodySemibold())
                }
                .foregroundColor(.white)
                

            }, action: receive)
            .padding(.leading, 16.0)
            .padding(.trailing, 12.0)
            
            MainButton(label: {
                HStack(spacing: .zero) {
                    Image(systemName: "arrow.up.right")
                    
                    Text("Send")
                        .font(.bodySemibold())
                }
                .foregroundColor(.white)
            }, action: send)
            .padding(.trailing, 16.0)
        }
    }
}
