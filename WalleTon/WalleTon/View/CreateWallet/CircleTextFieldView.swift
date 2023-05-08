//
//  CircleTextFieldView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 5.04.23.
//

import SwiftUI

struct PasscodeCircleView: View {
    
    @Binding var passcode: String
    @Binding var lengthOfPasscode: Int
    
    @State private var showOptions: Bool = false
    
    var body: some View {
        VStack(spacing: .zero) {

            TextField("", text: $passcode)
                .keyboardType(.numberPad)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .background(Color.clear)
                .background(
                    HStack(spacing: 16) {
                        ForEach(0..<lengthOfPasscode, id: \.self) { index in
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
                    lengthOfPasscode = 6
                })
                
                Button("4-digit code", action: {
                    lengthOfPasscode = 4
                })
                
            })
            .padding(.top, 73)
            .onChange(of: lengthOfPasscode) { newValue in
                passcode = ""
            }
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
