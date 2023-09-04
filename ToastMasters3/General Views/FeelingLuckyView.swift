//
//  FeelingLuckyView.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/3/23.
//

import SwiftUI

struct FeelingLuckyView: View {
    
    @ObservedObject var session: Session
    @ObservedObject var nav: NavCon
    @State var searchWord: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("", text: $searchWord, prompt: Text("What word would you like to use?"))
                
            }
        }
    }
}

#Preview("Feeling Lucky") {
    @StateObject var s = Session()
    @StateObject var nav = NavCon()
    return FeelingLuckyView(session: s, nav: nav)
}
