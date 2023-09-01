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
                VStack {
                    if session.wod.word == "" {
                        HStack {
                            Text("Add a word of the day!")
                            // TODO: Need to figure out how to show this view conditionally
//                            Button {
//                                nav.showingAddWodView.toggle()
//                            } label: {
//                                Image(systemName: "plus")
//                            }
                        }
                    }
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
                    //TODO: Add a Results view
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
