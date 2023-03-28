//
//  DefaultButtonView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct MainButton: View {
    
    var label: String
    var action: () async -> Void
    
    var body: some View {
        DefaultButtonView(action: action, label: {
            Text(label)
                .font(.bodySemibold())
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(.white)
        })
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.accent)
        .cornerRadius(12)
        .padding(.horizontal, 48.0)
    }
}


struct DefaultButtonView<Label: View>: View {
    
    var action: () async -> Void
    var actionOptions = Set(ActionOption.allCases)
    @ViewBuilder var label: () -> Label
    
    @State private var isDisabled = false
    @State private var showProgressView = false
    
    var body: some View {
        Button(action: {
            if actionOptions.contains(.disableButton) {
                isDisabled.toggle()
            }
            
            Task {
                var progressViewTask: Task<Void, Error>?
                
                if actionOptions.contains(.showProgressView) {
                    progressViewTask = Task {
                        try await Task.sleep(nanoseconds: 150_000_000)
                        showProgressView.toggle()
                    }
                }
                
                await action()
                progressViewTask?.cancel()
                
                isDisabled.toggle()
                showProgressView.toggle()
            }
            
        }, label: {
            ZStack {
                HStack {
                    label()
                        .multilineTextAlignment(.center)
                    
                    if showProgressView {
                        CircleAnimation()
                            .frame(width: 16, height: 16)
                            .padding(.trailing, 5.0)
                    }
                }
            }
        })
        .disabled(isDisabled)
    }
}

extension DefaultButtonView {
    enum ActionOption: CaseIterable {
        case disableButton
        case showProgressView
    }
}

extension DefaultButtonView where Label == Text {
    init(@ViewBuilder label: @escaping () -> Label, actionOptions: Set<ActionOption> = Set(ActionOption.allCases), action: @escaping () async -> Void){
        self.init(action: action, label: label)
    }
}
