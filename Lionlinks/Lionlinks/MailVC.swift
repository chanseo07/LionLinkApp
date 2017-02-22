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
        
        // Save data to file
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
        let fileURLProject = Bundle.main.path(forResource: "mailroom", ofType: "html")
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
        

        //Outputs text body of the html file.
        if let doc = HTML(html: htmlToBeUsed, encoding: .utf8) {
            var rawBody = doc.body!.content
            print (rawBody!)
            return
        }
        
        //Next section is in charge of chaning text to array
        
        //Declaring Variables to be used
        var box = 0000
        var a = 0
        var b = 0
        var c = 0
        var comboArray = [box,a,b,c]
        
        
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

}
