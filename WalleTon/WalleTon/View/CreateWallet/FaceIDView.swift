//
//  FaceIDView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 6.04.23.
//

import SwiftUI

struct FaceIDView: View {
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                Image(systemName: "faceid")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .foregroundColor(.accentColor)
                    .padding(.top, 26.0)
                
                TitleView(title: "Enable Face ID")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "Face ID allows you to open your wallet faster without having to enter your password.")
                    .padding(.bottom, 154.0)
                
                
                CreateButton(label: "Enable Face ID", action: {
                    
                })
                .padding(.bottom, 16.0)
                
                Button("Skip", action: {
                    
                })
            }
        }
    }
}

struct FaceIDView_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDView()
    }
}
