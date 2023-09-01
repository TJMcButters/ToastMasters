//
//  NavigationController.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/29/23.
//

import Foundation

final class NavCon: ObservableObject {
    @Published var showingAddSpeakerView: Bool = false
    @Published var showingAhCounterSummary: Bool = false
    
    // Script views
    @Published var showingAhCounterScript: Bool = false
    @Published var showingGrammarianScript: Bool = false
    @Published var showingTimerScript: Bool = false
}
