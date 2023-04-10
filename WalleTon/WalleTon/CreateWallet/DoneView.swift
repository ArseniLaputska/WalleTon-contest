//
//  DoneView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 10.04.23.
//

import SwiftUI

struct DoneView: View {
    var body: some View {
        ZStack {
            VStack {
                AnimationView(sticker: .start)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                
                TitleView(title: "Ready to go!")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "You are all set. Now you have a wallet that only you control — directly, without middlemen or bankers.")
                    .padding(.bottom, 154.0)
                
                MainButton(label: "View my wallet", action: {
                    
                })
            }
        }
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
