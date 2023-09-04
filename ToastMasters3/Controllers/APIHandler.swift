//
//  APIHandler.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/3/23.
//

import Foundation

class APIHandler: ObservableObject {
    let feelingLucky = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    var allWords: [String] = []
    
    func fetchFeelingLuckyAPI() -> (String, String, String) {
        let searchURL = feelingLucky + getRandomWord()
        var word: String = ""
        var def: String = ""
        var example: String = ""
        print("Search URL: \(searchURL)")
        let url = URL(string: searchURL)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(DictionaryWord.self, from: data) {
                    word = decoded.word
                    def = decoded.meanings[0].definitions[0].definition
                    example = decoded.meanings[0].definitions[0].example
                }
            }
        }
        .resume()
        
        return (word, def, example)
    }
    
    func findAllWords() -> [String] {
        var myWordList: String = ""
        var myWordArray: [String] = []
        if let path = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let contents = try? String(contentsOf: path) {
                myWordList = contents
            }
        }
        myWordArray = myWordList.components(separatedBy: "\n")
        return myWordArray
    }
    
    func getRandomWord() -> String {
        let r = Int.random(in: 0..<allWords.count)
        return allWords[r]
    }
    
    init() {
        self.allWords = findAllWords()
    }
    
}

struct DictionaryWord: Codable {
    let word, phonetic: String
    let phonetics: [Phonetic]
    let origin: String
    let meanings: [Meaning]
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition, example: String
    let synonyms, antonyms: [String]
}

struct Phonetic: Codable {
    let text: String
    let audio: String?
}
