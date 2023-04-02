//
//  TestTimeTextField.swift
//  WalleTon
//
//  Created by Arseni Laputska on 2.04.23.
//

import SwiftUI

struct TestTimeTextField: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text("5:")
            TextField("", text: $text)
        }
    }
}
