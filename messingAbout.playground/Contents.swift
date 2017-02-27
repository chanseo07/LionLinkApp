/*
//: Playground - noun: a place where people can play

import UIKit

var data =

"Course #     Title                      Instructor         Building/Room\n\n" +

"MUS 010 N31       Private Lessons - Piano            Jonathan Sakata          Music          TBA CSC 506 D         Network/Mobile Architecture*       Ranila Haider            Phelps         127 ECO 510 C         Macroeconomics *                   Giorgio S. Secondi       Academy        121 ENG 549 A         William Faulkner *                 Lundy E. Smith           Phillips       203 MAT 430 EX        Calculus *                         Patricia Babecki         Academy        006 REL 594 F         Imagining Your Future*             Peter Vorkink            Academy        204 PEC 300 GHZQ      Challenge Fitness                  Courtney D. Marshall     Gymnasium      TBA"
//let myString = "  \t\t  Let's trim all the whitespace  \n \t  \n  "
//let trimmedString = myString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
// Returns "Let's trim all the whitespace"

var testString = "Music 123 reddit"

//array [class #, class_name, instructor, room#]

let m = data.index(data.startIndex, offsetBy: 74)
let subString = data.substring(from: m)
let characterNum = subString.characters.count
let characterArray = Array(subString.characters)


var i = 0
var isSpace = 0
var holdingArray = [""]
var charStore = ""
var building = 0
var checker = ""

while i < characterNum {
    var trimmed = charStore.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    if isSpace == 2 {
        holdingArray.append(trimmed)
        charStore = ""
        
    }
    
    //dealing with exceptions
    if charStore.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "Music" {
        building = 1
    }
    
    
    
    if characterArray[i] == " " {
        isSpace += 1
    }
    
    if characterArray[i] != " " {
        isSpace = 0
    }
    
    if building == 1 {
        
        var m=i
        
        while m < (4+i) {
            charStore += String(characterArray[m])
            print (charStore)
            m+=1
        }
        var trimmedX = charStore.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        building = 0
        i=m
        holdingArray.append(trimmedX)
        
    }
    
    charStore += String(characterArray[i])
    i+=1
}

print(holdingArray)




let sentence = "The quick brown fox jumped over the lazy dog."

//Mailroom
let numberSentence =
"Your ACADEMY CENTER mailbox is" +
    
"Box....... Combination..." +

"1522    L00-R34-L14"

if let quick = sentence.range(of: "quick") {
    let word = sentence[quick.lowerBound..<quick.upperBound]
    print(word) // prints "quick"
}

if let boxNumber = numberSentence.range(of: "[0-9][0-9][0-9][0-9]  ", options: .regularExpression) {
    let word = numberSentence[boxNumber.lowerBound..<boxNumber.upperBound]
    print(word) // prints "quick"
}

if let combo = numberSentence.range(of: "[A-Z][0-9][0-9]-[A-Z][0-9][0-9]-[A-Z][0-9][0-9]", options: .regularExpression) {
    let word = numberSentence[combo.lowerBound..<combo.upperBound]
    print (word)
}
 
//

import Foundation

let toSearch = "323 ECO Economics Course Grd: A+ \n commentcomment 451 ENG English Course \n comment 789 MAT Mathematical Topography \n comment"

let pattern = "[0-9]{3} [A-Z]{3}"
let regex = try! NSRegularExpression(pattern: pattern, options: [])

// NSRegularExpression works with objective-c NSString, which are utf16 encoded
let matches = regex.matches(in: toSearch, range: NSMakeRange(0, toSearch.utf16.count))

// the combination of zip, dropFirst and map to optional here is a trick
// to be able to map on [(result1, result2), (result2, result3), (result3, nil)]
let results = zip(matches, matches.dropFirst().map { Optional.some($0) } + [nil]).map { current, next -> String in
    let range = current.rangeAt(0)
    let start = String.UTF16Index(range.location)
    // if there's a next, use it's starting location as the ending of our match
    // otherwise, go to the end of the searched string
    let end = next.map { $0.rangeAt(0) }.map { String.UTF16Index($0.location) } ?? String.UTF16Index(toSearch.utf16.count)
    
    return String(toSearch.utf16[start..<end])!
}

//now take the individuals elements and separate into course info and comments 

var resultsLength = results.count
var i = 0
var newResults = [""]

//split between course code and rest
while i < resultsLength {
    var str = results[i]
    //Deal with course name
    let startIndex = str.index(str.startIndex, offsetBy: 0) //set the start position of string
    let endIndex = str.index(str.startIndex, offsetBy: 6) //set the end position of string
    newResults.append(str[startIndex...endIndex])
    
    //Deal with comments
    let commentStartIndex = str.index(str.startIndex,offsetBy: 8)
    let secondStringToDealWith = str.substring(from: commentStartIndex)
    
    //splitting between teacher name and the actual comments
    let splittedStringsArray = secondStringToDealWith.characters.split(separator: "\n", maxSplits: 1).map(String.init)
    newResults.append(splittedStringsArray[0])
    newResults.append(splittedStringsArray[1])
    i+=1
}

print (newResults)
 
 */

var m = "hi:hi"
print (m.characters.split(separatedBy))