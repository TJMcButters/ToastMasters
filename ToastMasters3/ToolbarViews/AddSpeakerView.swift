//
//  AddSpeakerView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/28/23.
//

import SwiftUI

struct AddSpeakerView: View {
    
    @ObservedObject var session: Session
    
    var body: some View {
        VStack {
            
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    session.addSpeaker()
                }
            }
        }
    }
}

#Preview {
    @StateObject var s = Session()
    return AddSpeakerView(session: s)
}
