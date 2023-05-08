//
//  ImportSuccessView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct ImportSuccessView: View {
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                AnimationView(sticker: .congratulations)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                
                TitleView(title: "Your wallet has just been imported!")
                    .padding(.top, 20.0)
                    .padding(.bottom, 150.0)

                CreateButton(label: "View my wallet", action: {
                    
                })
            }
        }

    }
}

struct ImportSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ImportSuccessView()
    }
}
