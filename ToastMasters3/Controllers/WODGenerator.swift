//
//  WODGenerator.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/6/23.
//

import Foundation

struct WodServer {
    
    var wods: [WodData] = [WodData(word: "Fail", definition: "No Data was loaded", example: "Try again cause you failed")]
    
    init() {
        self.wods = try! getWods()
    }
    
    func getWods() throws -> [WodData] {
        guard let path = Bundle.main.url(forResource: "Words", withExtension: "json") else {
            throw WODServerErrors.InvalidPath
        }
        
        guard let data = try? Data(contentsOf: path) else {
            throw WODServerErrors.InvalidData
        }
        
        let decoder = JSONDecoder()
        guard let results = try? decoder.decode([WodData].self, from: data) else {
            throw WODServerErrors.InvalidDecoding
        }
        
        return results
        
    }
    
    func getRandomWord() -> WodData {
        let r = Int.random(in: 0..<wods.count)
        return wods[r]
    }
    
}

struct WodData: Codable {
    var word: String
    var definition: String
    var example: String
}

enum WODServerErrors: Error {
    case InvalidPath
    case InvalidData
    case InvalidDecoding
}
