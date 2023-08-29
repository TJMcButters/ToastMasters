//
//  ContentView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var session = Session()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Pick your role: ") {
                    NavigationLink {
                        AhCounterStartView(session: session)
                    } label: {
                        Text("Ah Counter")
                    }
                    NavigationLink {
                        Text("Grammarian View")
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
                }
            }
            .navigationTitle("Session")
        }
    }
    
}

#Preview {
    ContentView()
}
