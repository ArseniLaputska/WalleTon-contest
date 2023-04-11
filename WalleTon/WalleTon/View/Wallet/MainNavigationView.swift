//
//  MainNavigationView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct MainNavigationView: View {
    
    @State var mainState: MainState
    @State var showTopView: Bool
    @State var balance: Double
    var scan: () -> Void
    var settings: () -> Void
    
    var body: some View {
        HStack {
            Button(action: scan, label: {
                Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .navigationButtonModifier()
            })
            
            switch mainState {
                case .loading, .created:
                    Spacer()
                case .transactions:
                    if showTopView {
                        VStack {
                            HStack {
                                AnimationView(sticker: .main)
                                    .frame(width: 16, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.trailing, 2.0)
                                
                                Text("\(balance)")
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            
                            //to do: implement converter
                            Text("≈ $89.6")
                        }
                    } else {
                        Spacer()
                    }
            }
            
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
