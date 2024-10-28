// TextData.swift

import Foundation

class TextData {
    private var fileName: String
    private var text: String
    private var numberOfVowels: Int = 0
    private var numberOfConsonants: Int = 0
    private var numberOfLetters: Int = 0
    private var numberOfSentences: Int = 0
    private var longestWord: String = ""
    
    init(text: String, fileName: String) {
        self.text = text
        self.fileName = fileName
        analyzeText()
    }
    
    
    func getFilename() -> String {
        return fileName
    }
    
    func getText() -> String {
        return text
    }
    
    func getNumberOfVowels() -> Int {
        return numberOfVowels
    }
    
    func getNumberOfConsonants() -> Int {
        return numberOfConsonants
    }
    
    func getNumberOfLetters() -> Int {
        return numberOfLetters
    }
    
    func getNumberOfSentences() -> Int {
        return numberOfSentences
    }
    
    func getLongestWord() -> String {
        return longestWord
    }
    
 
    
    
    private func analyzeText() {
        countLetters()
        countSentences()
        findLongestWord()
    }
    
    private func countLetters() {
        let vowelsSet = CharacterSet(charactersIn: "AEIOUaeiou")
        let consonantsSet = CharacterSet.letters.subtracting(vowelsSet)
        
        for character in text.unicodeScalars {
            if vowelsSet.contains(character) {
                numberOfVowels += 1
                numberOfLetters += 1
            } else if consonantsSet.contains(character) {
                numberOfConsonants += 1
                numberOfLetters += 1
            }
        }
    }
    
    private func countSentences() {
        let sentenceTerminators = CharacterSet(charactersIn: ".!?")
        numberOfSentences = text.unicodeScalars.filter { sentenceTerminators.contains($0) }.count
    }
    
    private func findLongestWord() {
        let words = text.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        for word in words {
            let cleanedWord = word.trimmingCharacters(in: CharacterSet.punctuationCharacters)
            if cleanedWord.count > longestWord.count {
                longestWord = cleanedWord
            }
        }
    }
}
