//
//  DescrView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct DescriptionView: View {
    
    var descr: String
    
    var body: some View {
        Text(descr)
            .font(.bodyRegular())
            .multilineTextAlignment(.center)
            .padding(.horizontal, 32.0)
            .padding(.top, 12.0)
    }
}
