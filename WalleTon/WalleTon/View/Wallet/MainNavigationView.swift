//
//  MainNavigationView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct MainNavigationView: View {
    
    @Binding var mainState: MainState
    @Binding var user: User
    
    var showTopView: Bool
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
                        HStack {
                            Spacer()
                            
                            VStack {
                                HStack {
                                    AnimationView(sticker: .main)
                                        .frame(width: 16, height: 20)
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.trailing, 2.0)
                                    
                                    Text("\(user.balance)")
                                        .font(.body)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                }
                                
                                //to do: implement converter
                                Text("≈ $89.6")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top, 3.0)
                            .padding(.bottom, 5.0)
                            
                            Spacer()
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
