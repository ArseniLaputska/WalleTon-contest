//
//  TestTimeView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 2.04.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct TestTimeView: View {
    
    @State private var showAlert: Bool = false
    @State var textField: String = ""
    @State var numbers: [String] = ["5:", "15:", "18:"]
    
    var body: some View {
        ZStack {
            VStack {
                AnimationView(sticker: .testTime)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .padding(.top, 26.0)
                
                TitleView(title: "Your Recovery Phrase")
                    .padding(.top, 20.0)
                    .padding(.bottom, 12.0)
                
                DescriptionView(descr: "Let’s check that you wrote them down correctly. Please enter the words 5, 15 and 18.")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 36.0)
                
                VStack(spacing: 16.0) {
                    TestTimeTextField(number: 5, text: $textField)
                    
                    TestTimeTextField(number: 15, text: $textField)
                    
                    TestTimeTextField(number: 18, text: $textField)
                    
                }
                .padding(.horizontal, 48.0)
                
                MainButton(label: "Continue", action: {
                    showAlert.toggle()
                    
                }).alert(isPresented: $showAlert, content: {
                    let titleView = Text("Incorrect words").bold()
                    
                    let messageView = Text("The secret words you have entered do not match the ones in the list.")
                    
                    let primaryButtonTitle = Text("See words")
                    let primaryButton = Alert.Button.default(primaryButtonTitle)
                    
                    let secondaryButtonTitle = Text("Try again")
                    let secondaryButton = Alert.Button.default(secondaryButtonTitle)
                    
                    return Alert(title: titleView, message: messageView, primaryButton: primaryButton, secondaryButton: secondaryButton)
                    
                })
                .padding(.top, 16.0)
                
            }
        }
    }
}

@available(iOS 15.0, *)
struct TestTimeView_Previews: PreviewProvider {
    static var previews: some View {
        TestTimeView()
    }
}
