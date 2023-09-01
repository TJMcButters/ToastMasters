//
//  AddSpeakerView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/26/23.
//

import SwiftUI

struct AddSpeakerView: View {
    
    @ObservedObject var session: Session
    @State private var name: String = ""
    
    var body: some View {
        Form {
            Section("Add a speaker: ") {
                HStack {
                    TextField("", text: $name, prompt: Text("Enter a name"))
                    Button {
                        session.addSpeaker(name: name)
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
    }
}

