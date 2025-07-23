// main.swift

import Foundation

// Check if at least one file is provided
guard CommandLine.arguments.count > 1 else {
    print("Usage: Task4 <path_to_text_file1> <path_to_text_file2> ...")
    exit(1)
}

// FileReader instance
let fileReader = FileReader()

// Iterate over each file
for filePath in CommandLine.arguments.dropFirst() {
    // Read file into string
    guard let fileContents = fileReader.readFileIntoString(filePath) else {
        print("Failed to read the file at path: \(filePath)")
        continue // Move next file
    }
    
   
    let textData = TextData(text: fileContents, fileName: (filePath as NSString).lastPathComponent)
    
    // Print
    print("\nFile Name: \(textData.getFilename())")
    print("Number of Vowels: \(textData.getNumberOfVowels())")
    print("Number of Consonants: \(textData.getNumberOfConsonants())")
    print("Number of Letters: \(textData.getNumberOfLetters())")
    print("Number of Sentences: \(textData.getNumberOfSentences())")
    print("Longest Word: \(textData.getLongestWord())")
}
