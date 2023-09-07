//
//  GrammarianScriptView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct GrammarianScriptView: View {
    
    @ObservedObject var session: Session
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("""
Greetings Toastmaster, fellow Toastmasters, and Honored Guests.

The purpose of the Grammarian is to pay close attention to all speakers, listening carefully to their language usage.

I’ll take note of any misuses of the English language as well as any outstanding uses, quotes, sayings, or thoughts.

As Grammarian, it is also my duty to introduce the Word of the Day.

For today’s meeting, the Word is \(session.wod.word), which means:

\(session.wod.definition)

An example of using the word is: \"\(session.wod.example)\"

Each speaker is encouraged to use the Word of the Day.

I will give the Grammarian report when called upon during the meeting and also report on the usage of the Word of the Day
""")
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
    @StateObject var s = Session()
    return GrammarianScriptView(session: s)
}
