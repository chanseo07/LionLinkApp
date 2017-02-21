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
        let html = "<html><head><title>titlfdae</title></head><body>hi</body></html>"
        
        if let doc = HTML(html: html, encoding: .utf8) {
            print(doc.title)
            
//            // Search for nodes by CSS
//            for link in doc.css("a, link") {
//                print(link.text)
//                print(link["href"])
//            }
//            
//            // Search for nodes by XPath
//            for link in doc.xpath("//a | //link") {
//                print(link.text)
//                print(link["href"])
//            }
        }
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
