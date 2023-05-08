//
//  PhraselessImportView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct PhraselessImportView: View {
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                AnimationView(sticker: .tooBad)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                
                TitleView(title: "Too Bad!")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "Without the secret words you can’t restore access to the wallet.")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 176.0)
                
                CreateButton(label: "Enter 24 secret words", action: {
                    
                })
                .padding(.bottom, 16.0)
                
                Button("Create a new empty wallet instead", action: {
                    
                })
            }
        }
    }
}

struct PhraselessImportView_Previews: PreviewProvider {
    static var previews: some View {
        PhraselessImportView()
    }
}
