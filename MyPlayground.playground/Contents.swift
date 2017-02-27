

//: Playground - noun: a place where people can play

import UIKit

/*

var str = "Hello, playground"

var general = "brother hey brother"
var sub = "brother"

let parsed = general.replacingOccurrences(of: sub, with: "")

import Foundation



var myString = "       ENG 502 C - Writing Seminar: Fiction  - Sarah Anderson  Grd: A In this Short Fiction Elective, students spent the term"

if let combo = myString.range(of: "Grd: [A-Z]", options: .regularExpression) {
    let wordX = myString[combo.lowerBound..<combo.upperBound]
    print (wordX) //wordX is the 
    print (myString[combo.lowerBound])
}


let Arr = myString.components(separatedBy: "Grd: ")

var m = Array(Arr[1].characters)
let Grade = "\(m[0])\(m[1])"
print(Grade)

let newLast = Arr[1].index(Arr[1].startIndex, offsetBy: 2)
let subString = Arr[1].substring(from: newLast)

let newString = "\(Arr[0])\(Grade)".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

var n = [newString, subString]
print (n)

//////////////////////////
print ("\n")

var data =
    "Course #     Title                      Instructor         Building/Room\n\n" +
        
"MUS 010 N31       Private Lessons - Piano            Jonathan Sakata          Music          TBA CSC 506 D         Network/Mobile Architecture*       Ranila Haider            Phelps         127 ECO 510 C         Macroeconomics *                   Giorgio S. Secondi       Academy        121 ENG 549 A         William Faulkner *                 Lundy E. Smith           Phillips       203 MAT 430 EX        Calculus *                         Patricia Babecki         Academy        006 REL 594 F         Imagining Your Future*             Peter Vorkink            Academy        204 PEC 300 GHZQ      Challenge Fitness                  Courtney D. Marshall     Gymnasium      TBA"
//let myString = "  \t\t  Let's trim all the whitespace  \n \t  \n  "


var starter = data.components(separatedBy: "Course #     Title                      Instructor         Building/Room\n\n")
var aka = starter[1].components(separatedBy: "  ")

var i = 0
var AKKA = [""]

//fixing aka
while i < aka.count {
    if aka[i] == "" {
        aka.remove(at: i)
    }
    if aka[i] != "" {
        aka[i] = aka[i].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)}

    i+=1
}

//print (aka)
//room numbers
var z = 0

while z < aka.count {
    if aka[z] == "Music" || aka[z] == "Phelps" || aka[z] == "Academy" || aka[z] == "Phillips" || aka[z] == "Gymnasium"{
        var saveMe = aka[z]
        var futureString = aka[z+1]
        var arrayofCharacters = Array(aka[z+1].characters)
        var roomNumber = "\(arrayofCharacters[0])\(arrayofCharacters[1])\(arrayofCharacters[2])"
        aka[z] = "\(saveMe) \(roomNumber)"
        
        if z+1 != aka.count-1 {
            let new = futureString.index(futureString.startIndex, offsetBy: 4)
            let sub = futureString.substring(from: new)
        
            aka[z+1] = sub
        }
        
        if z+1 == aka.count-1 {
            aka.remove(at: z+1)
        }
        
        
     
        
    }
    

    z+=1
}

print(aka)


*/

var myString =

"MY ACADEMIC YEAR COURSES 11:43:38 02-21-17" +

"Term. Course Name       Title........................." +

"16/FA ENG*502           Writing Seminar: Fiction *" +
"MAT*420           Calculus *" +
"CHI*502           Modern Chinese Lang & Lit *"+
"BIO*490           Introductory Genetics *"+
"REL*460           Ethics of the Marketplace *"+
"MUS*010           Private Lessons - Piano"+
"PEC*331           Boys Club Crew"+
""+
"17/WI ENG*549           William Faulkner *"+
"MAT*430           Calculus *"+
"CSC*506           Network/Mobile Architecture*"+
"ECO*510           Macroeconomics *"+
"REL*594           Imagining Your Future*"+
"MUS*010           Private Lessons - Piano"+
"PEC*300           Challenge Fitness"+
""+
"17/SP ENG*575           Satire and Humor *"+
"MAT*510           Calculus *"+
"CSC*590           Selected Topics in Computer *"+
"ECO*520           Microeconomics *"+
"ECO*999           Economics Field Course *"+
"HHD*STR           Crossroads Your Future&Health"+
"MUS*010           Private Lessons - Piano"+
"PEB*330           Boys V/JV/Novice Crew"+



































