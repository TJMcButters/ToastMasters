//
//  ContentView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var session = Session()
    @StateObject var nav = NavCon()
    
    var body: some View {
        VStack {
            Image("ToastMastersLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 90)
            Text("What's speaking to you today?")
                .font(.caption.bold())
            
            NavigationStack {
                Form {
                    Section("Pick your role: ") {
                        NavigationLink {
                            AhCounterStartView(session: session, nav: nav)
                        } label: {
                            Text("Ah Counter")
                        }
                        NavigationLink {
                            GrammarianStartView(session: session, nav: nav)
                        } label: {
                            Text("Grammarian")
                        }
                        NavigationLink {
                            Text("Timer View")
                        } label: {
                            Text("Timer")
                        }
                    }
                    Section("Previous Sessions: ") {
                        Text("Placeholder Text")
                        Text("More placeholder text")
                    }
                }
                .navigationTitle("Session")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
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
                            session.addDummySpeakers()
                            session.addDummyWod()
                        } label: {
                            Image(systemName: "plus")
                        }
                        Spacer()
                    }
                }
            }
        }
        .background(Color.mint)
    }
}

#Preview {
    ContentView()
}
