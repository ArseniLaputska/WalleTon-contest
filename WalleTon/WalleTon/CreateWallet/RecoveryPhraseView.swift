//
//  RecoveryPhraseView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct RecoveryPhraseView: View {
    
    let phrases: [String] = ["network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network","network"]
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    AnimationView(sticker: .recovery)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 124, maxHeight: 124)
                        .padding(.top, 26.0)
                    
                    TitleView(title: "Your Recovery Phrase")
                        .padding(.top, 20.0)
                    
                    DescriptionView(descr: "Write down these 24 words in this exact order and keep them in a secure place. Do not share this list with anyone. If you lose it, you will irrevocably lose access to your TON account.")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    PhraseTableView(phrases: phrases)
                        .padding(.top, 40.0)
                        .padding(.horizontal, 45.0)
                        .padding(.bottom, 52.0)
                    
                    MainButton(label: "Done", action: {
                        
                    })
                    
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct RecoveryPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryPhraseView()
    }
}
