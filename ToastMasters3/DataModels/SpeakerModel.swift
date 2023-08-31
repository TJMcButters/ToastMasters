//
//  SpeakerModel.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/27/23.
//

import Foundation

final class Speaker: Identifiable, ObservableObject {
    var id: UUID = UUID()
    @Published var name: String
    @Published var ahCounts: AhCountables = AhCountables()
    @Published var gRemarks: GrammarRemarks = GrammarRemarks()
    
    init(name: String) {
        self.name = name
    }
    
}

struct AhCountables {
    var ums: Int = 0
    var sos: Int = 0
    var ahs: Int = 0
    var ers: Int = 0
    var wells: Int = 0
    var buts: Int = 0
    var likes: Int = 0
}

struct GrammarRemarks {
    var remarks: [String] = []
    var wodUsages: Int = 0
}
