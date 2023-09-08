//
//  NavigationController.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/29/23.
//

import Foundation
import SwiftUI

final class NavCon: ObservableObject {
    
    // Add views
    @Published var showingAddSpeakerView: Bool = false
    let addSpeakerSF = Image(systemName: "plus")
    @Published var showingAddWodView: Bool = false
    let addWodSF = Image(systemName: "rectangle.and.pencil.and.ellipsis")
    
    // Single Edit View
    @Published var showingSingleEditView: Bool = false
    
    // FeelingLucky
    @Published var showingFeelingLucky: Bool = false
    
    // Summary views
    @Published var showingAhCounterSummary: Bool = false
    @Published var showingGrammarianSummary: Bool = false

    // Script views
    @Published var showingAhCounterScript: Bool = false
    @Published var showingGrammarianScript: Bool = false
    @Published var showingTimerScript: Bool = false
    let showScriptSF = Image(systemName: "rays")
}
