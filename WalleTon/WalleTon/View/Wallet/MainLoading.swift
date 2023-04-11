//
//  MainLoading.swift
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

struct MainLoading: View {
    
    @State private var headerOffset: CGFloat = 0
    @State private var mainState: MainState = .created
    @State private var count = 0
    @State private var wallet = "UQBFz01R2CU7YA8pevUaNIYEzi1mRo4cX-r3W2Dwx-WEAoKP"
    
    var body: some View {
        ZStack {
            VStack {
                
                MainNavigationView(scan: {
                    
                }, settings: {
                    
                })
                    
                ScrollView {
                    VStack {
                        switch mainState {
                            case .loading:
                                AnimationView(sticker: .main)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 36, height: 36)
                                    .padding(.top, 34.0)
                            case .created:
                                VStack {
                                    HuggedText(text: wallet)
                                        .font(.bodyRegular())
                                        .foregroundColor(.white)
                                        .padding(.top, 28.0)
                                    
                                    HStack {
                                        AnimationView(sticker: .main)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 36, height: 36)
                                        
                                        Text("\(count)")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                }
                            case .transactions:
                                AnimationView(sticker: .main)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 36, height: 36)
                                    .padding(.top, 34.0)
                        }
                        
                        MainButtonsView(receive: {
                            
                        }, send: {
                            
                        })
                        .frame(height: 50)
                        .padding(.top, 54.0)
                        .padding(.bottom, 34.0)
                    }
                    .background(Color.black)
                    
                    VStack {
                        switch mainState {
                            case .created:
                                AnimationView(sticker: .created)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 124, height: 124)
                                    .padding(.top, 90.0)
                                
                                TitleView(title: "Wallet Created")
                                    .padding(.top, 8.0)
                                    .padding(.bottom, 28.0)
                                
                                Text("Your wallet address")
                                    .foregroundColor(.secondary)
                                    .font(.bodyRegular())
                                    .padding(.bottom, 6.0)
                                
                                Text(wallet)
                                    .padding(.horizontal, 65.0)
                                
                            case .loading:
                                // todo
                                AnimationView(sticker: .loading)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 124, height: 124)
                                    .padding(.top, 170.0)
                            case .transactions:
                                    //to do
                                AnimationView(sticker: .loading)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 124, height: 124)
                                    .padding(.top, 170.0)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(12.0)
                    .padding(.top, -18.0)
                    
                }
                .background(Color.white)
            }
        }
        .background(Color.black)
    }
}

struct HuggedText: View {
    let text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text.prefix(4) + "..." + text.suffix(4))
            Spacer()
        }
    }
}

struct MainLoading_Previews: PreviewProvider {
    static var previews: some View {
        MainLoading()
    }
}
