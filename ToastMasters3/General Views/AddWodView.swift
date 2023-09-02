//
//  AddWodView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/1/23.
//

import SwiftUI

struct AddWodView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @Environment(\.dismiss) var dismiss
    @State var tempWod = ""
    @State var tempDef = ""
    @State var tempEx = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("", text: $session.wod.word, prompt: Text("Add a word of the day"))
                TextField("", text: $session.wod.definition, prompt: Text("Add a defintion"))
                TextField("", text: $session.wod.example, prompt: Text("Add an example"))
                Button("Add") {
                    session.updateWod(wod: tempWod, def: tempDef, ex: tempEx)
                }
//                Button("I'm feeling lucky!") {
//                    // TODO: add a feeling lucky function to session
//                }
            }
            .navigationTitle("W.O.D.")
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
