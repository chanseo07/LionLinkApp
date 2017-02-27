//
//  ScheduleVC.swift
//  Lionlinks
//
//  Created by Brian Bae on 2017. 2. 19..
//  Copyright © 2017년 Sakura Clicker. All rights reserved.
//

import UIKit
import Kanna

class ScheduleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Save data to file
        let targetHTML = "classSchedule"
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
        
        
        //Outputs text body of the html file.
        if let doc = HTML(html: htmlToBeUsed, encoding: .utf8) {
            var rawBody = doc.body!.content
            parsedSchedule(data: rawBody!)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parsedSchedule(data:String) {
        
        var starter = data.components(separatedBy: "Course #     Title                      Instructor         Building/Room")
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
