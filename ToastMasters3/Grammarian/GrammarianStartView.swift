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
                ToolbarItem(placement: .bottomBar) {
                    // TODO: Add a script view button
                    Button {
                        nav.showingAddSpeakerView.toggle()
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .sheet(isPresented: $nav.showingAddSpeakerView) {
                        AddSpeakerView(session: session)
                    }
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
