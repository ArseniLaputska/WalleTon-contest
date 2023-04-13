//
//  BubbleComment.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct BubbleComment: View {
    let comment: String
    
    var body: some View {
        Text(comment)
            .font(.subheadline)
            .fontWeight(.regular)
            .padding(.horizontal, 10)
            .padding(.vertical, 8.0)
            .background(Color.textField)
            .clipShape(BubbleShape())
    }
}
