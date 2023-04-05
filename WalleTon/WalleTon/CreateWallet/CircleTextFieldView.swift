//
//  CircleTextFieldView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 5.04.23.
//

import SwiftUI

struct PasscodeCircleView: View {
    
    @State var passcode: String
    @State private var lenghtOfPasscode: Int = 4
    @State private var showOptions: Bool = false
    
    var body: some View {
        VStack {

            TextField("", text: $passcode)
                .keyboardType(.numberPad)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .background(Color.clear)
                .background(
                    HStack(spacing: 16) {
                        ForEach(0..<lenghtOfPasscode, id: \.self) { index in
                        Circle()
                            .foregroundColor(passcode.count > index ? .black : .white)
                            .frame(width: 16, height: 16)
                            .overlay(Circle()
                                .stroke(Color.black, lineWidth: 1)
                                .foregroundColor(.white)
                                .frame(width: 16, height: 16))
                    }
                }
                )
            
            Menu("Passcode options", content: {
        
                Button("6-digit code", action: {
                    lenghtOfPasscode = 6
                })
                
                Button("4-digit code", action: {
                    lenghtOfPasscode = 4
                })
                
            })
            .padding(.top, 73)
        }
    }
}

extension View {
    func hideKeyboardWhenTappedAround() -> some View  {
        return self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                  to: nil, from: nil, for: nil)
        }
    }
}
