//
//  CommentsVC.swift
//  Lionlinks
//
//  Created by Brian Bae on 2017. 2. 19..
//  Copyright © 2017년 Sakura Clicker. All rights reserved.
//

import UIKit
import Kanna
import Foundation

class CommentsVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // File location
        let fileURLProject = Bundle.main.path(forResource: "recentGrades", ofType: "html")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURLProject), Error: " + error.localizedDescription)
        }
        

        
        let htmlToBeUsed = readStringProject
       
        
        
        
        
        
        ////////////////////////////////////
        var html = "<html> <body> hi </body> </html>"
        var pageBody = ""
        
        //Outputs text body of the html file.
        if let doc = HTML(html: htmlToBeUsed, encoding: .utf8) {
            var rawBody = doc.body!.content
            pageBody = rawBody!
        
        }
        
         parseandReturn(comments: pageBody)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func parseandReturn (comments: String) { //returns in format [course code, additional info, comments]
        var rawOne = comments.replacingOccurrences(of: "_", with: "")
        rawOne = rawOne.replacingOccurrences(of: "Final Course Comments for Fall Term 2016", with: "")
        print (rawOne)
        
        let toSearch = rawOne
        
        let pattern = "[A-Z]{3} [0-9]{3} "
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
            let splittedStringsArray = secondStringToDealWith.characters.split(separator: "\n", maxSplits: 1).map(String.init)
            newResults.append(splittedStringsArray[0])
            newResults.append(splittedStringsArray[1])
            i+=1

        }
        
        dump(newResults)
        
        

        
        
    }

}
