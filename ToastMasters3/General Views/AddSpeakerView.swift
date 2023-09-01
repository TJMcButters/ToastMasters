//
//  AddSpeakerView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/28/23.
//

import SwiftUI

struct AddSpeakerView: View {
    
    @ObservedObject var session: Session
    @State private var currentName: String = ""
    @State private var showingError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a Speaker name: ") {
                    HStack {
                        TextField("", text: $currentName)
                        Button {
                            let results = session.addSpeaker(name: currentName)
                            if results.0 == true {
                                errorTitle = results.1
                                errorMessage = results.2
                                showingError = results.0
                            }
                            currentName = ""
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                Section("Current Speakers: ") {
                    ForEach(session.speakers) { speaker in
                        Text(speaker.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    return AddSpeakerView(session: s)
}
