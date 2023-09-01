//
//  GrammarianSpeakerEditView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct GrammarianSpeakerEditView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @ObservedObject var currentSpeaker: Speaker
    @State var currentRemark: String = ""
    @State private var showingError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("\(session.wod.word) Usages: ") {
                    Stepper("\(currentSpeaker.gRemarks.wodUsages)", value: $currentSpeaker.gRemarks.wodUsages, in: 0...100, step: 1)
                }
                Section("Grammar Remarks: ") {
                    HStack {
                        TextField("", text: $currentRemark, prompt: Text("Add a remark"))
                        Button {
                            let results = currentSpeaker.addRemark(remark: currentRemark)
                            errorTitle = results.1
                            errorMessage = results.2
                            showingError = results.0
                            currentRemark = ""
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                Section("Current Remarks: ") {
                    ForEach(currentSpeaker.gRemarks.remarks, id: \.self) { remark in
                        Text(remark)
                    }
                    .onDelete(perform: { indexSet in
                        currentSpeaker.gRemarks.remarks.remove(atOffsets: indexSet)
                    })
                }
            }
            .navigationTitle("\(currentSpeaker.name)")
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    @StateObject var speaker = Speaker(name: "Name")
    return GrammarianSpeakerEditView(session: s, nav: nav, currentSpeaker: speaker)
}
