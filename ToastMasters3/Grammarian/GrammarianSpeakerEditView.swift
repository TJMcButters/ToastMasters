//
//  GrammarianSpeakerEditView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct GrammarianSpeakerEditView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @ObservedObject var currentSpeaker: Speaker
    
    var body: some View {
        NavigationStack {
            Form {
                Section("W.O.D. Usages: ") {
                    Stepper("\(session.wod.word)", value: $currentSpeaker.gRemarks.wodUsages, in: 0...100, step: 1)
                }
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    @StateObject var speaker = Speaker(name: "")
    return GrammarianSpeakerEditView(session: s, nav: nav, currentSpeaker: speaker)
}
