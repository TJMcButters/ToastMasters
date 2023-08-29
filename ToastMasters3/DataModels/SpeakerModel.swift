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
    
    init(name: String) {
        self.name = name
    }
    
}


struct AhCountables {
    var ums: Int = 0
    var sos: Int = 0
    var ahs: Int = 0
}
