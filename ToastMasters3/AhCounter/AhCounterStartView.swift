//
//  AhCounterStartView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/28/23.
//

import SwiftUI

struct AhCounterStartView: View {
    
    @ObservedObject var session: Session
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
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingAddSpeaker.toggle()
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .sheet(isPresented: $showingAddSpeaker) {
                        AddSpeakerView(session: session)
                    }
                }
            }
        }
    }
}

#Preview("Ah Counter Start View") {
    @ObservedObject var s = Session()
    return AhCounterStartView(session: s)
}
