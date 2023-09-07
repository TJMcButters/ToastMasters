//
//  APIHandler.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 9/3/23.
//

import Foundation

class APIHandler: ObservableObject {
    var allWords: [String] = []
    
    func getWodData() async -> WodData {
        let word = getRandomWord()
        let result = Task(priority: .high) {
            try? await getDictionaryWordData(word: word)
        }
        let dw = await result.value
        let returnWod = WodData(word: dw?.word ?? "asdf", definition: dw?.meanings[0].definitions[0].definition ?? "asdf", example: dw?.meanings[0].definitions[0].example ?? "asdf")
        return returnWod
    }
    
    func getDictionaryWordData(word w: String) async throws -> DictionaryWord {
        let endpoint = "https://api.dictionaryapi.dev/api/v2/entries/en/\(w)"
        guard let url = URL(string: endpoint) else {
            throw DictionaryError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DictionaryError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            let returnWord = try decoder.decode(DictionaryWord.self, from: data)
            print(returnWord)
            return returnWord
        } catch {
            throw DictionaryError.invalidData
        }
    }
    
    func convertToWod(dictWord dw: DictionaryWord) -> WodData {
        return WodData(word: dw.word, definition: dw.meanings[0].definitions[0].definition, example: dw.meanings[0].definitions[0].example)
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

struct WodData: Codable {
    var word: String
    var definition: String
    var example: String
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

enum DictionaryError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
