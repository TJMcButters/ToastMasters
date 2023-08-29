//
//  Session.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/26/23.
//

import Foundation

class Session: Identifiable, ObservableObject {
    var id: UUID = UUID()
    var sessionDate: Date = Date.now
    @Published var speakers = [Speaker]()
    @Published var wod = WordOfDay()
    
    init() {
        
    }
    
    func addSpeaker(name n: String) {
        let newSpeaker = Speaker(name: n)
        speakers.append(newSpeaker)
    }
    
}

struct WordOfDay {
    var word: String = ""
    var definition: String = ""
    var example: String = ""
}
