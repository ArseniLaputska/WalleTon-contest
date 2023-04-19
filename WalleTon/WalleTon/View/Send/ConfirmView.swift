//
//  ConfirmView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 19.04.23.
//

import SwiftUI

struct ConfirmView: View {
    
    var wallet: String
    var count: String
    var fee: String = "0.007" // TODO: fee
    @State private var comment: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                Section {
                    if comment.count <= 1 {
                        TextField("Description of the payment", text: $comment)
                    } else {
                        TextEditor(text: $comment)
                    }
                } header: {
                    Text("COMMENT (OPTIONAL)")
                } footer: {
                    VStack(alignment: .leading) {
                        Text("The comment is visible to everyone. You must include the note when sending to an exchange.")
                            .multilineTextAlignment(.leading)
                        
                        if comment.count > 0 {
                            Text(comment.count > 255 ? "Message size has been exceeded by \(comment.count - 255) characters." : "\(255 - comment.count) characters left.")
                                .foregroundColor(comment.count > 255 ? .red : .orange)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                
                Section(header: Text("LABEL")) {
                    HStack(spacing: .zero) {
                        Text("Recipient")
                        
                        Spacer()
                        
                        HuggedText(hugTo: 4, text: wallet)
                    }
                    
                    HStack(spacing: .zero) {
                        Text("Amount")
                        
                        Spacer()
                        
                        HStack(spacing: .zero) {
                            AnimationView(sticker: .main)
                                .frame(maxWidth: 18, maxHeight: 18)
                            
                            Text(count)
                                .padding(.leading, 3)
                        }
                    }
                    
                    HStack(spacing: .zero) {
                        Text("Fee")
                        
                        Spacer()
                        
                        HStack(spacing: .zero) {
                            AnimationView(sticker: .main)
                                .frame(maxWidth: 18, maxHeight: 18)
                            
                            Text(" ≈ " + fee)
                        }
                    }
                }
            }
        }
    }
}
