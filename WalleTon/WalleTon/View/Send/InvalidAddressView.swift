//
//  InvalidAddressView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 15.04.23.
//

import SwiftUI

struct InvalidAddressView: View {
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.octagon.fill")
                .padding(12)
            
            VStack(alignment: .leading) {
                Text("Invalid Address")
                    .font(.headline)
                
                Text("Address entered does not belong to TON")
                    .font(.callout)
            }
            .padding(.vertical, 9)
            .padding(.trailing, 16)
        }
        .foregroundColor(.white)
        .background(Color.invalidAddress)
        .cornerRadius(12)
    }
}

struct InvalidAddressView_Previews: PreviewProvider {
    static var previews: some View {
        InvalidAddressView()
    }
}
