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
            Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
                GridRow(alignment: .firstTextBaseline) {
                    Text("Name")
                    Text("Ahs")
                    Text("Ums")
                    Text("Sos")
                }
                ForEach(session.speakers) { speaker in
                    GridRow(alignment: .firstTextBaseline) {
                        Text(speaker.name)
                        Text("\(speaker.ahCounts.ahs)")
                        Text("\(speaker.ahCounts.ums)")
                        Text("\(speaker.ahCounts.sos)")
                    }
                }
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
