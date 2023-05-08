//
//  MainScrollView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct MainScrollView: View {
    
    @Binding var user: User
    @Binding var state: MainState
    @Binding var transactions: [Transaction]
    @Binding var offset: CGFloat
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: .zero) {
                MainBody(user: $user, state: $state)
                
                MainButtonsView(receive: {
                    
                }, send: {
                    
                })
                .frame(height: 50)
                .padding(.top, 36.0)
                .padding(.bottom, 16.0)
            }
            
            VStack(spacing: .zero) {
                MainScrollContent(state: $state, user: $user, transactions: $transactions)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(TopRoundedRectangle(radius: 12).fill(Color.white))
            .background(
                GeometryReader { geo in
                    Color.clear
                        .preference(key: OffsetPreferenceKey.self, value: -geo.frame(in: .named("scroll")).origin.y)
                }
            )
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                self.offset = offset
            }
        }
        .coordinateSpace(name: "scroll")
    }
}
