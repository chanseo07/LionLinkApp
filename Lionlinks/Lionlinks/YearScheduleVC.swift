//
//  YearScheduleVC.swift
//  Lionlinks
//
//  Created by Brian Bae on 2017. 2. 19..
//  Copyright © 2017년 Sakura Clicker. All rights reserved.
//

import UIKit
import Kanna

class YearScheduleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Save data to file
        let targetHTML = "academicYear"
        let fileName = "Test"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        //print("FilePath: \(fileURL.path)")
        
        let writeString = "Write this text to the fileURL as text in iOS using Swift"
        do {
            // Write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        var readString = "" // Used to store the file contents
        do {
            // Read the file contents
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        //print("File Text: \(readString)")
        
        /*** Read from project txt file ***/
        
        // File location
        let fileURLProject = Bundle.main.path(forResource: targetHTML, ofType: "html")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        //print(readStringProject)
        
        let htmlToBeUsed = readStringProject
        
        
        
        
        
        ////////////////////////////////////
        var html = "<html> <body> hi </body> </html>"
        var mBB = ""
        
        //Outputs text body of the html file.
        if let doc = HTML(html: htmlToBeUsed, encoding: .utf8) {
            var rawBody = doc.body!.content
            mBB = rawBody!
        }
        
        parsingSchedule (yearSchedule: mBB)
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parsingSchedule(yearSchedule: String) { //
        
        var variableSchedule = yearSchedule
        
        variableSchedule = variableSchedule.replacingOccurrences(of: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nCopyright 2010, the trustees of Phillips Exeter Academy.\n\n\n\n\n\n\n", with: "")

        
        let toSearch = variableSchedule
        let pattern = "[0-9]{2}/[A-Z]{2} "
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        
        // NSRegularExpression works with objective-c NSString, which are utf16 encoded
        let matches = regex.matches(in: toSearch, range: NSMakeRange(0, toSearch.utf16.count))
        
        // the combination of zip, dropFirst and map to optional here is a trick
        // to be able to map on [(result1, result2), (result2, result3), (result3, nil)]
        var results = zip(matches, matches.dropFirst().map { Optional.some($0) } + [nil]).map { current, next -> String in
            let range = current.rangeAt(0)
            let start = String.UTF16Index(range.location)
            // if there's a next, use it's starting location as the ending of our match
            // otherwise, go to the end of the searched string
            let end = next.map { $0.rangeAt(0) }.map { String.UTF16Index($0.location) } ?? String.UTF16Index(toSearch.utf16.count)
            
            return String(toSearch.utf16[start..<end])!
        }
        
        print(results)
        print (results[0])
        print ("\n")
        //let n = String(results[0])
        
       // print (n!.components(separatedBy: "\n"))
        
        //cleanup
        results[0] = results[0].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        results[1] = results[1].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        results[2] = results[2].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        //Fall Term
        let fallStartIndex = results[0].index(results[0].startIndex,offsetBy: 5)
        let fallString = results[0].substring(from: fallStartIndex)
        
        let fallTerm = fallString.components(separatedBy: "\n")
        print (fallTerm)
        
        //Winter Term
        let winterStartIndex = results[1].index(results[1].startIndex,offsetBy: 5)
        let winterString = results[1].substring(from: winterStartIndex)
        
        let winterTerm = winterString.components(separatedBy: "\n")
        print (winterTerm)
        
        
        //Spring term
        let springStartIndex = results[2].index(results[2].startIndex,offsetBy: 5)
        let springString = results[2].substring(from: springStartIndex)
        
        let springTerm = springString.components(separatedBy: "\n")
        print (springTerm)
        
        

        
        /*
        //now take the individuals elements and separate into course info and comments
        
        var resultsLength = results.count
        var i = 0
        var newResults = [""]
        
        while i < resultsLength {
            var str = results[i]
            print (str)
            //Deal with course name
            let startIndex = str.index(str.startIndex, offsetBy: 0) //set the start position of string
            let endIndex = str.index(str.startIndex, offsetBy: 6) //set the end position of string
            newResults.append(str[startIndex...endIndex])
            
            //Deal with comments
            let commentStartIndex = str.index(str.startIndex,offsetBy: 8)
            let secondStringToDealWith = str.substring(from: commentStartIndex)
            
            //splitting between teacher name and the actual comments
            let splittedStringsArray = secondStringToDealWith.characters.split(separator: "\n").map(String.init)
            newResults.append(splittedStringsArray[0].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            newResults.append(splittedStringsArray[1].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            i+=1
            
        }
        
        dump(newResults)
        
        */

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
