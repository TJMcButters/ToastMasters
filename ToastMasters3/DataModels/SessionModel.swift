//
//  SessionModel.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/28/23.
//

import Foundation

@MainActor final class Session: Identifiable, ObservableObject {
    let id: UUID = UUID()
    @Published var sessionDate = Date.now
    @Published var speakers: [Speaker] = []
    @Published var wod: WodData = WodData(word: "", definition: "", example: "")
    
    func addSpeaker(name n: String) -> (Bool, String, String) {
        for speaker in speakers {
            if n == speaker.name {
                return (true, "Duplicate Name", "\'\(n)\' already exists - try another one")
            }
        }
        if n.isEmpty {
            return (true, "Empty Name", "You must provide a name for the Speaker")
        }
        speakers.append(Speaker(name: n))
        return (false, "", "")
    }
    
    func updateWod(wod w: String, def d: String, ex e: String) {
        wod.word = w
        wod.definition = d
        wod.example = e
    }
    
    func addDummySpeakers() {
        for i in 0...10 {
            speakers.append(Speaker(name: "S\(i)"))
        }
    }
    
    func addDummyWod() {
        wod.word = "Test"
        wod.definition = "Test Def"
        wod.example = "Test Example"
    }
    
}
