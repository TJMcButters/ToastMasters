//
//  AddWodView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/7/23.
//

import SwiftUI

struct AddWodView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @Environment(\.dismiss) var dismiss
    @State var wodServer = WodServer()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add a WOD: ") {
                    TextField("", text: $session.wod.word, prompt: Text(session.wod.word))
                    TextField("", text: $session.wod.definition, prompt: Text(session.wod.definition))
                    TextField("", text: $session.wod.example, prompt: Text(session.wod.example))
                    Button("Feeling Lucky?") {
                        session.updateWodWithData(wodData: wodServer.getRandomWord())
                    }
                }
            }
            .navigationTitle("Add WOD")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Done", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    
    return AddWodView(session: s, nav: nav)
}
