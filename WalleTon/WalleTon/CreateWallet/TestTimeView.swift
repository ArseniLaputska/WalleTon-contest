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
    
    var body: some View {
        ZStack {
            VStack {
                AnimationView(sticker: .testTime)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 124, maxHeight: 124)
                    .padding(.top, 26.0)
                
                TitleView(title: "Your Recovery Phrase")
                    .padding(.top, 20.0)
                    .padding(.bottom, 36.0)
                
                //TODO text fields
//                TestTimeTextField(text: $textField)
                
                DescriptionView(descr: "Let’s check that you wrote them down correctly. Please enter the words 5, 15 and 18.")
                    .fixedSize(horizontal: false, vertical: true)
                
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
