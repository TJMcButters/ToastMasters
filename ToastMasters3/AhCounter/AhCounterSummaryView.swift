//
//  AhCounterSummaryView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/29/23.
//

import SwiftUI

struct AhCounterSummaryView: View {
    
    @ObservedObject var session: Session
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Grid(alignment: .leading, horizontalSpacing: 5, verticalSpacing: 10) {
                GridRow(alignment: .firstTextBaseline) {
                    Text("Name")
                    Text("Ahs")
                    Text("Ums")
                    Text("Ers")
                    Text("Sos")
                    Text("Likes")
                    Text("Buts")
                    Text("Well")
                }
                .bold()
                MyDivider(height: 2, color: .black, padding: false)
                ForEach(session.speakers) { speaker in
                    GridRow {
                        Text(speaker.name)
                            .bold()
                        Text("\(speaker.ahCounts.ahs)")
                        Text("\(speaker.ahCounts.ums)")
                        Text("\(speaker.ahCounts.ers)")
                        Text("\(speaker.ahCounts.sos)")
                        Text("\(speaker.ahCounts.likes)")
                        Text("\(speaker.ahCounts.buts)")
                        Text("\(speaker.ahCounts.wells)")
                    }
                    .gridColumnAlignment(.center)
                    MyDivider(height: 1, color: .gray, padding: true)
                        
                }
                Spacer()
            }
            .navigationTitle("Ah Counts")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Done", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    return AhCounterSummaryView(session: s)
}
