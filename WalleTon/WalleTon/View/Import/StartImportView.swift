//
//  StartImportView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 10.04.23.
//

import SwiftUI

struct StartImportView: View {
    
    @State private var showAlert: Bool = false
    @State private var secondClick: Bool = false
    @State var textField: String = ""
    
    @State var phrases = 24
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: .zero) {
                    AnimationView(sticker: .recovery)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 124, maxHeight: 124)
                        .padding(.top, 26.0)
                    
                    TitleView(title: "24 Secret Words")
                        .padding(.top, 20.0)
                        .padding(.bottom, 12.0)
                    
                    DescriptionView(descr: "You can restore access to your wallet by entering 24 words you wrote when down you creating the wallet.")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Button("I don't have those", action: {
                        
                    })
                    .padding(.top, 12.0)
                    .padding(.bottom, 36.0)
                    
                    ForEach(0..<phrases, id: \.self) { phrase in
                        TestTimeTextField(number: phrase, text: $textField)
                            .frame(minHeight: 50)
                            .padding(.bottom, 16.0)
                    }
                    .padding(.horizontal, 48.0)
                    
                    CreateButton(label: "Continue", action: {
                        showAlert.toggle()
                        secondClick.toggle()
                        
                    }).alert(isPresented: $showAlert, content: {
                        let titleView = Text("Incorrect words").bold()
                        
                        let messageView = Text("The secret words you have entered do not match the ones in the list.")
                        
                        let primaryButtonTitle = Text("See words").bold()
                        let primaryButton = Alert.Button.default(primaryButtonTitle)
                        
                        let secondaryButtonTitle = Text("Try again")
                        let secondaryButton = Alert.Button.default(secondaryButtonTitle)
                        
                        if secondClick {
                            return Alert(title: titleView, message: messageView, dismissButton: primaryButton)
                        } else {
                            return Alert(title: titleView, message: messageView, primaryButton: primaryButton, secondaryButton: secondaryButton)
                        }
                        
                    })
                    
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct StartImportView_Previews: PreviewProvider {
    static var previews: some View {
        StartImportView()
    }
}
