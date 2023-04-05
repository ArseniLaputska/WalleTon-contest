//
//  PasscodeView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 5.04.23.
//

import SwiftUI

struct PasscodeView: View {
    
    @State private var passcode: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                AnimationView(sticker: .password)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .padding(.top, 26.0)
                
                TitleView(title: "Set a Passcode")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "Enter the 4 digits in the passcode.")
                    .padding(.bottom, 28.0)
                
                PasscodeCircleView(passcode: passcode)
                
            }
        }
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
