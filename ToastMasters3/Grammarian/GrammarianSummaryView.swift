//
//  GrammarianSummaryView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/2/23.
//

import SwiftUI

struct GrammarianSummaryView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @Environment(\.dismiss) var dismiss
    @State var currentSpeaker: Speaker
    var layout = [
        GridItem(.adaptive(minimum: 20, maximum: 80))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: layout) {
                    ForEach(session.speakers) { speaker in
                        if speaker.name == currentSpeaker.name {
                            Button(speaker.name) {
                                currentSpeaker = speaker
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        else {
                            Button(speaker.name) {
                                currentSpeaker = speaker
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: 55)
            Form {
                Section("Viewing \(currentSpeaker.name)") {
                    Text("\(session.wod.word) usages: \(currentSpeaker.gRemarks.wodUsages)")
                }
                Section("Grammatical Remarks: ") {
                    ForEach(currentSpeaker.gRemarks.remarks, id: \.self) { remark in
                        Text(remark)
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
        }
    }
}

#Preview {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    s.speakers.append(Speaker(name: ""))
    return GrammarianSummaryView(session: s, nav: nav, currentSpeaker: s.speakers[0])
}
