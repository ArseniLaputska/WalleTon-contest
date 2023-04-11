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
    @State private var mainState: MainState = .loading
    
    var body: some View {
        ZStack {
            VStack {
                
                MainNavigationView(scan: {
                    
                }, settings: {
                    
                })
                    
                ScrollView {
                    VStack {
                        AnimationView(sticker: .main)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
                            .padding(.top, 34.0)
                        
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
                                AnimationView(sticker: .loading)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 124, height: 124)
                                    .padding(.top, 170.0)
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

struct MainLoading_Previews: PreviewProvider {
    static var previews: some View {
        MainLoading()
    }
}
