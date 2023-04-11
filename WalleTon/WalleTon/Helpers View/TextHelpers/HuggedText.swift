//
//  HuggedText.swift
//  WalleTon
//
//  Created by Arseni Laputska on 11.04.23.
//

import SwiftUI

struct HuggedText: View {
    
    var hugTo: Int
    let text: String
    
    var body: some View {
        Text(text.prefix(hugTo) + "..." + text.suffix(hugTo))
    }
}
