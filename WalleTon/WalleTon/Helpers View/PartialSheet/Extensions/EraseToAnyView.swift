//
//  EraseToAnyView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 12.04.23.
//

import SwiftUI

extension View {
    /// Wrap the current view into an **AnyView**
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
