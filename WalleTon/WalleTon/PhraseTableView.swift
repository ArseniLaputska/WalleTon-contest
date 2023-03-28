//
//  PhraseTableView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct PhraseTableView: View {
    
    let phrases: [String]
    
    var body: some View {
        HStack {
            VStack {
                ForEach(phrases.indices.prefix(12), id: \.self) { index in
                    ColumnPhrase(position: index + 1, title: phrases[index])
                }
            }
            
            Spacer()
            
            VStack {
                ForEach(phrases.indices.suffix(12), id: \.self) { index in
                    ColumnPhrase(position: index + 1, title: phrases[index])
                }
            }
        }
    }
}

struct ColumnPhrase: View {
    
    let position: Int
    let title: String
    
    var body: some View {
        HStack {
            Text("\(position).")
                .frame(maxWidth: 26, maxHeight: 20, alignment: .trailing)
                .font(.bodyRegular())
                .foregroundColor(.textSecondary)
                .padding(.trailing, 6.0)
            Text(title)
                .font(.bodySemibold())
        }
        .padding(.bottom, 10.0)
    }
}
