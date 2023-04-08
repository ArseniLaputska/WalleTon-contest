//
//  TouchIDView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 8.04.23.
//

import SwiftUI

struct TouchIDView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "touchid")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .foregroundColor(.accentColor)
                    .padding(.top, 26.0)
                
                TitleView(title: "Enable Touch ID")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "Touch ID allows you to open your wallet faster without having to enter your password.")
                    .padding(.bottom, 154.0)
                
                
                MainButton(label: "Enable Touch ID", action: {
                    
                })
                .padding(.bottom, 16.0)
                
                Button("Skip", action: {
                    
                })
            }
        }
    }
}

struct TouchIDView_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDView()
    }
}
