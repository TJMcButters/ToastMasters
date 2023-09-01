//
//  AhCounterScriptView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct AhCounterScriptView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @State var sl = ScriptLoader()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(sl.getScript(script: .AhCounter))
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("AhCounter Script")
        }
    }
}

#Preview("Ah Counter Script View") {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    return AhCounterScriptView(session: s, nav: nav)
}
