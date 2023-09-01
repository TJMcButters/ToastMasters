//
//  ScriptLoader.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import Foundation

struct ScriptLoader {
    var wod: String
    var def: String
    var ex: String
    var AhCounter = """
Greetings Toastmaster, fellow Toastmasters, and honored Guests.

The purpose of the Ah Counter is to note words and sounds that are used as a “crutch” or “pause filler” by anyone who speaks.

During the meeting, I will listen for overused words, including and, well, but, so and you know.

I will also listen for filler sounds, including ah, um, and er.

I will also note when a speaker repeats a word or phrase, such as “I, I” or “This means, this means”

At the end of the meeting I will report the number of times that each speaker used these expressions
"""
    

    var Grammarian: String {
"""
Greetings Toastmaster, fellow Toastmasters, and Honored Guests.

The purpose of the Grammarian is to pay close attention to all speakers, listening carefully to their language usage.

I’ll take note of any misuses of the English language as well as any outstanding uses, quotes, sayings, or thoughts.

As Grammarian, it is also my duty to introduce the Word of the Day.

For today’s meeting, the Word is \(wod), which means

\(def)

An example of using the word is: \(ex)

Each speaker is encouraged to use the Word of the Day.

I will give the Grammarian report when called upon during the meeting and also report on the usage of the Word of the Day
"""
    }
    
    var Timer = """
Greetings Toastmaster, fellow Toastmasters, and honored guests.

As Timer, I will keep track of time for each prepared speech, all Table Topics Speakers, and the speech Evaluators.

I will also alert each speaker of the time they have left, using the green, yellow, and red indications, which denote specific times remaining
"""
    
    enum ScriptType: String {
        case AhCounter = "AhCounter"
        case Grammarian = "Grammarian"
        case Timer = "Timer"
    }
    
    func getScript(script s: ScriptType) -> String {
        if s.rawValue == "Grammarian" {
            return Grammarian
        }
        if s.rawValue == "AhCounter" {
            return AhCounter
        }
        if s.rawValue == "Timer" {
            return Timer
        }
        return ""
    }
}
