//
//  MainBody.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct MainBody: View {
    
    @Binding var wallet: String
    @Binding var balance: Double
    @Binding var state: MainState
    
    var body: some View {
        switch state {
            case .loading:
                AnimationView(sticker: .main)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
                    .padding(.top, 34.0)
            case .created, .transactions:
                VStack {
                    HuggedText(hugTo: 4, text: wallet)
                        .font(.bodyRegular())
                        .foregroundColor(.white)
                        .padding(.top, 28.0)
                    
                    HStack {
                        AnimationView(sticker: .main)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
                        
                        Text("\(balance)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
        }

    }
}
