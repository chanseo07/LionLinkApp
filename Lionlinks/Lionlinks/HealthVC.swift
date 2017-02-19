//
//  HealthVC.swift
//  Lionlinks
//
//  Created by Brian Bae on 2017. 2. 19..
//  Copyright © 2017년 Sakura Clicker. All rights reserved.
//

import UIKit

class HealthVC: UIViewController {

    @IBOutlet weak var pdf: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pdf.loadRequest(NSURLRequest(url: NSURL(string: "http://www.exeter.edu/sites/default/files/documents/Health_Course_Meeting_Days.pdf")! as URL) as URLRequest)
        
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
