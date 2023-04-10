//
//  CongratulationsView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                AnimationView(sticker: .congratulations)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .padding()
                
                TitleView(title: "Congratulations")
                
                DescriptionView(descr: "Your TON Wallet has just been created. Only you control it. \n\n To be able to always have access to it, please write down secret words and set up a secure passcode.")
                    .padding()
                
                Spacer()
                
                CreateButton(label: "Proceed", action: {
                    
                })
                
                Spacer()
            }
        }
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
