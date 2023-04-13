//
//  SettingsView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 13.04.23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isOnNotifications = true
    @State private var address = "v4R2"
    @State private var currency = "USD"
    
    let currencies = ["USD", "BYN", "EUR"]
    let variants = ["v4R1", "v2R2", "v5R1", "v4R2"]
    
    
    @State private var isOnID = true
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("GENERAL")) {
                    
                    Toggle("Notifiactions", isOn: $isOnNotifications)
                            .toggleStyle(.switch)
                    
                    Picker("Active address", selection: $address, content: {
                        ForEach(variants, id: \.self) {
                            Text($0)
                        }
                    })
                    .pickerStyle(.menu)
                    
                    Picker("Primary currency", selection: $currency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("SECURITY")) {
                    NavigationLink("Show recovery phrase", destination: MainView()) // TODO: change View
                    
                    NavigationLink("Change passcode", destination: MainView()) // TODO: change View
                    
                    Toggle("Face ID", isOn: $isOnID)
                            .toggleStyle(.switch)
                }
                
                Button("Delete Wallet", action: {
                    
                })
                .foregroundColor(.red)
            }
            .navigationTitle("Wallet Settings")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
