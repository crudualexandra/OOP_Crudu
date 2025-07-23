// main.swift

import Foundation

// Check if the correct number of arguments is provided
guard CommandLine.arguments.count > 1 else {
    print("Usage: Task2 <path_to_text_file>")
    exit(1)
}

// Get the file path from the arguments
let filePath = CommandLine.arguments[1]

// Create a FileReader instance
let fileReader = FileReader()

// Read the file into a string
guard let fileContents = fileReader.readFileIntoString(filePath) else {
    print("Failed to read the file at path: \(filePath)")
    exit(1)
}

// Create a TextData instance
let textData = TextData(text: fileContents, fileName: (filePath as NSString).lastPathComponent)

// Print the text data info
print("File Name: \(textData.getFilename())")
print("Number of Vowels: \(textData.getNumberOfVowels())")
print("Number of Consonants: \(textData.getNumberOfConsonants())")
print("Number of Letters: \(textData.getNumberOfLetters())")
print("Number of Sentences: \(textData.getNumberOfSentences())")
print("Longest Word: \(textData.getLongestWord())")
