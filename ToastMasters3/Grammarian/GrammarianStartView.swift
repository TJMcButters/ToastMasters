//
//  GrammarianStartView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

// let results = apiHandler.fetchAPI(word: "Voracious")

import SwiftUI

struct GrammarianStartView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @StateObject var apiHandler = APIHandler()
    @State var myWord: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Text("\(myWord)")
                TextField(session.wod.word, text: $session.wod.word, prompt: Text("Add a Word of the day"))
                TextField(session.wod.definition, text: $session.wod.definition, prompt: Text("Add a definition"))
                TextField(session.wod.example, text: $session.wod.example, prompt: Text("Add an example"))
                Button("Feeling Lucky?") {
                    let results = apiHandler.fetchFeelingLuckyAPI()
                    session.wod.word = results.0
                    session.wod.definition = results.1
                    session.wod.example = results.2
                }
                Button("Search") {
                    nav.showingWordSearch.toggle()
                }
                .sheet(isPresented: $nav.showingFeelingLucky) {
                    FeelingLuckyView(session: session, nav: nav)
                }
                
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
