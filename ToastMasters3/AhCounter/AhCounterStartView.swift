//
//  AhCounterStartView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/28/23.
//

import SwiftUI

struct AhCounterStartView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @State private var showingAddSpeaker: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Current Speakers: ") {
                    ForEach(session.speakers) { speaker in
                        NavigationLink {
                            AhCounterSpeakerEditView(session: session, selectedSpeaker: speaker)
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
                        nav.showingAhCounterScript.toggle()
                    } label: {
                        Image(systemName: "applescript")
                    }
                    .sheet(isPresented: $nav.showingAhCounterScript) {
                        AhCounterScriptView(session: session, nav: nav)
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
                        nav.showingAhCounterSummary.toggle()
                    } label: {
                        Image(systemName: "rays")
                    }
                    .sheet(isPresented: $nav.showingAhCounterSummary) {
                        AhCounterSummaryView(session: session)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview("Ah Counter Start View") {
    @StateObject var s = Session()
    @StateObject var n = NavCon()
    return AhCounterStartView(session: s, nav: n)
}
