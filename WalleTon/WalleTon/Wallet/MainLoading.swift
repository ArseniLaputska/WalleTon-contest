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
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                VStack {

                    MainNavigationView(scan: {
                        
                    }, settings: {
                        
                    })
                    
                    AnimationView(sticker: .main)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 36)
                        .padding(.top, 52.0)
                    
                    MainButtonsView(receive: {
                        
                    }, send: {
                        
                    })
                    .padding(.top, 72.0)
                    .padding(.bottom, 16.0)
                    
                    VStack {
                        AnimationView(sticker: .loading)
                    }
                    .background(Color.white)
                    .cornerRadius(15.0)
                }
            }
            .background(Color.black)
            
        }
    }
}

struct MainLoading_Previews: PreviewProvider {
    static var previews: some View {
        MainLoading()
    }
}
