//
//  AhCounterSpeakerEditView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/28/23.
//

import SwiftUI

struct AhCounterSpeakerEditView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var selectedSpeaker: Speaker
    var myRange: ClosedRange = 0...100
    
    var body: some View {
        NavigationStack {
            Form {
                Stepper("Ahs: \(selectedSpeaker.ahCounts.ahs)", value: $selectedSpeaker.ahCounts.ahs, in: myRange, step: 1)
                Stepper("Ums: \(selectedSpeaker.ahCounts.ums)", value: $selectedSpeaker.ahCounts.ums, in: myRange, step: 1)
                Stepper("Sos: \(selectedSpeaker.ahCounts.sos)", value: $selectedSpeaker.ahCounts.sos, in: myRange, step: 1)
            }
            .navigationTitle(selectedSpeaker.name)
        }
    }
}

#Preview {
    @StateObject var s = Session()
    return AhCounterSpeakerEditView(session: s, selectedSpeaker: Speaker(name: "Tyler"))
}
