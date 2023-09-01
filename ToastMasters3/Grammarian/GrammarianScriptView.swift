//
//  GrammarianScriptView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct GrammarianScriptView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Replace me")
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Grammarian Script")
        }
    }
}

#Preview("Grammarian Script View") {
    GrammarianScriptView()
}
