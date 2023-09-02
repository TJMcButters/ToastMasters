//
//  GrammarianStartView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct GrammarianStartView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    
    var body: some View {
        NavigationStack {
            Form {
                
                TextField(session.wod.word, text: $session.wod.word, prompt: Text("Add a Word of the day"))
                TextField(session.wod.definition, text: $session.wod.definition, prompt: Text("Add a definition"))
                TextField(session.wod.example, text: $session.wod.example, prompt: Text("Add an example"))
                
                Section("Current Speakers: ") {
                    ForEach(session.speakers) { speaker in
                        NavigationLink {
                            GrammarianSpeakerEditView(session: session, nav: nav, currentSpeaker: speaker)
                        } label: {
                            Text(speaker.name)
                        }
                    }
                }
            }
            .navigationTitle("Select a speaker")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        nav.showingGrammarianScript.toggle()
                    } label: {
                        Image(systemName: "applescript")
                    }
                    .sheet(isPresented: $nav.showingGrammarianScript) {
                        GrammarianScriptView(session: session)
                    }
                    Spacer()
                    Button {
                        nav.showingAddSpeakerView.toggle()
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .sheet(isPresented: $nav.showingAddSpeakerView) {
                        AddSpeakerView(session: session)
                    }
                    Spacer()
                    Button {
                        nav.showingGrammarianSummary.toggle()
                    } label: {
                        Image(systemName: "rays")
                    }
                    .sheet(isPresented: $nav.showingGrammarianSummary) {
                        GrammarianSummaryView(session: session, nav: nav, currentSpeaker: session.speakers[0])
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    return GrammarianStartView(session: s, nav: nav)
}
