//
//  TestTimeTextField.swift
//  WalleTon
//
//  Created by Arseni Laputska on 2.04.23.
//

import SwiftUI

struct TestTimeTextField: View {
    
    var number: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(number)
                .padding(.leading, 20)
                .foregroundColor(.secondary)
            
            TextField("", text: $text)
                .foregroundColor(.primary)
        }
        .frame(maxHeight: 50)
        .background(Color.textField)
        .cornerRadius(10)
    }
}
