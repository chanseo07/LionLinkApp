//
//  MailVC.swift
//  Lionlinks
//
//  Created by Brian Bae on 2017. 2. 19..
//  Copyright © 2017년 Sakura Clicker. All rights reserved.
//

import UIKit
import Kanna

class MailVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // File location
        let fileURLProject = Bundle.main.path(forResource: "mailroom", ofType: "html")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURLProject), Error: " + error.localizedDescription)
        }
        
        //print(readStringProject)
        
        let htmlToBeUsed = readStringProject
        
        returnMailInfo (numberSentence: htmlToBeUsed)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func returnMailInfo (numberSentence: String){ //Gonna need help getting this to return an array
        
        var arrayToReturn:[String]

        if let boxNumber = numberSentence.range(of: "[0-9][0-9][0-9][0-9]  ", options: .regularExpression) {
            let word = numberSentence[boxNumber.lowerBound..<boxNumber.upperBound]
            print(word) //word is the boxnumber
        }
        
        if let combo = numberSentence.range(of: "[A-Z][0-9][0-9]-[A-Z][0-9][0-9]-[A-Z][0-9][0-9]", options: .regularExpression) {
            let wordX = numberSentence[combo.lowerBound..<combo.upperBound]
            print (wordX) //wordX is the combination
        }
        
        return
        
        //
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
