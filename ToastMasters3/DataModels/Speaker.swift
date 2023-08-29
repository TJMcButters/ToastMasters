//
//  Speaker.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/26/23.
//

import Foundation

class Speaker: Identifiable {
    var id: UUID = UUID()
    var name: String
    @Published var ahCounts: AhCounts = AhCounts()
    @Published var grammarRemarks: GrammarRemarks = GrammarRemarks()
    
    init(name: String) {
        self.name = name
    }
    
}

struct AhCounts {
    var ums: Int = 0
    var ahs: Int = 0
    var ers: Int = 0
}

struct GrammarRemarks {
    var wodUses: Int = 0
    var remarks: [String] = []
}
