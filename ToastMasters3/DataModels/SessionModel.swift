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
    @Published var speakers: [Speaker] = [Speaker(name: "")]
    @Published var currentSpeaker: Speaker = Speaker(name: "")
    var placeholderRemoved: Bool = false
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
        else if !placeholderRemoved {
            for i in 0..<speakers.count {
                if speakers[i].name == "" {
                    print("Removed")
                    speakers.remove(at: i)
                    placeholderRemoved = true
                }
            }
        }
        let newSpeaker = Speaker(name: n)
        speakers.append(newSpeaker)
        if currentSpeaker.name == "" {
            setCurrentSpeaker(speaker: newSpeaker)
        }
        return (false, "", "")
    }
    
    func updateWod(wod w: String, def d: String, ex e: String) {
        wod.word = w
        wod.definition = d
        wod.example = e
    }
    
    func updateWodWithData(wodData wd: WodData) {
        wod = wd
    }
    
    func setCurrentSpeaker(speaker s: Speaker) {
        currentSpeaker = s
    }
    
    func addDummySpeakers() {
        for i in 0...10 {
            let name = "S\(i)"
            let _ = addSpeaker(name: name)
        }
    }
    
    func addDummyWod() {
        wod.word = "Test"
        wod.definition = "Test Def"
        wod.example = "Test Example"
    }
    
}
