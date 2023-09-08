//
//  SingleEditView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/6/23.
//

import SwiftUI

struct SingleEditView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @State var currentRemark = ""
    @State var showingRemarkErrors: Bool = false
    @State var errorTitle: String = ""
    @State var errorMessage: String = ""
    var myRange = 0...100
    var layout = [
        GridItem(.adaptive(minimum: 20, maximum: 90))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: layout) {
                    ForEach(session.speakers) { speaker in
                        if speaker.name == session.currentSpeaker.name {
                            Button(speaker.name) {
                                session.setCurrentSpeaker(speaker: speaker)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        else {
                            Button(speaker.name) {
                                session.setCurrentSpeaker(speaker: speaker)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: 55)
            Form {
                Section("Ah Counts for: \(session.currentSpeaker.name)") {
                    Stepper("Ahs: \(session.currentSpeaker.ahCounts.ahs)", value: $session.currentSpeaker.ahCounts.ahs, in: myRange, step: 1)
                    Stepper("Ums: \(session.currentSpeaker.ahCounts.ums)", value: $session.currentSpeaker.ahCounts.ums, in: myRange, step: 1)
                    Stepper("Ers: \(session.currentSpeaker.ahCounts.ers)", value: $session.currentSpeaker.ahCounts.ers, in: myRange, step: 1)
                    Stepper("Sos: \(session.currentSpeaker.ahCounts.sos)", value: $session.currentSpeaker.ahCounts.sos, in: myRange, step: 1)
                    Stepper("Likes: \(session.currentSpeaker.ahCounts.likes)", value: $session.currentSpeaker.ahCounts.likes, in: myRange, step: 1)
                    Stepper("Buts: \(session.currentSpeaker.ahCounts.buts)", value: $session.currentSpeaker.ahCounts.buts, in: myRange, step: 1)
                    Stepper("Wells: \(session.currentSpeaker.ahCounts.wells)", value: $session.currentSpeaker.ahCounts.wells, in: myRange, step: 1)
                }
                
                Stepper("\(session.wod.word) usages: \(session.currentSpeaker.gRemarks.wodUsages)", value: $session.currentSpeaker.gRemarks.wodUsages, in: myRange, step: 1)
                
                Section("Grammar Remarks: ") {
                    HStack {
                        TextField("", text: $currentRemark, prompt: Text("Enter a remark"))
                        Button {
                            let result = session.currentSpeaker.addRemark(remark: currentRemark)
                            if result.0 {
                                errorTitle = result.1
                                errorMessage = result.2
                                showingRemarkErrors.toggle()
                            }
                            currentRemark = ""
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ForEach(session.currentSpeaker.gRemarks.remarks, id: \.self) { remark in
                        Text(remark)
                    }
                }
            }
            .navigationTitle(session.currentSpeaker.name)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        nav.showingAddWodView.toggle()
                    } label: {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    }
                    .sheet(isPresented: $nav.showingAddWodView) {
                        AddWodView(session: session, nav: nav)
                    }
                    Spacer()
                    Button {
                        nav.showingAddSpeakerView.toggle()
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .sheet(isPresented: $nav.showingAddSpeakerView) {
                        AddSpeakerView(session: session)
                    }
                    Spacer()
                }
            }
            .alert(errorTitle, isPresented: $showingRemarkErrors) {
                Button("Ok", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    return SingleEditView(session: s, nav: nav)
}
