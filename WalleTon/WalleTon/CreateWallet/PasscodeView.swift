//
//  PasscodeView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 5.04.23.
//

import SwiftUI

struct PasscodeView: View {
    
    @State private var passcode: String = ""
    @State private var title: String = "Set a passcode"
    @State private var passcodeLength: Int = 4
    
    var body: some View {
        ZStack {
            VStack {
                AnimationView(sticker: .password)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .padding(.top, 26.0)
                
                TitleView(title: passcode.count != passcodeLength ? title : "Confirm a Passcode")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "Enter the \(passcodeLength == 4 ? "4" : "6") digits in the passcode.")
                    .padding(.bottom, 28.0)
                
                PasscodeCircleView(passcode: $passcode, lengthOfPasscode: $passcodeLength)
                
            }
        }
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
