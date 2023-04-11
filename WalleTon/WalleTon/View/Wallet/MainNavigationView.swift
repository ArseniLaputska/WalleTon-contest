//
//  MainNavigationView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct MainNavigationView: View {
    
    var scan: () -> Void
    var settings: () -> Void
    
    var body: some View {
        HStack {
            Button(action: scan, label: {
                Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .navigationButtonModifier()
            })
            
            Spacer()
            
            Button(action: settings, label: {
                Image(systemName: "gear")
                    .resizable()
                    .navigationButtonModifier()
            })
            
        }
    }
}

extension View {
    func navigationButtonModifier() -> some View {
        self
            .frame(width: 28, height: 28)
            .foregroundColor(.white)
            .padding(.horizontal, 14.0)
            .padding(.vertical, 8.0)
    }
}
