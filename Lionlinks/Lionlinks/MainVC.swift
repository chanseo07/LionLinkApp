//
//  MainVC.swift
//  Lionlinks
//
//  Created by Brian Bae on 2017. 2. 7..
//  Copyright © 2017년 Sakura Clicker. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return 2
        }
        else{
            return 8
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "label", for: indexPath)
        switch "\(indexPath.section)\(indexPath.row)" {
        case "00":
            cell.textLabel?.text = "Health Course Meeting Days"
            break
        case "01":
            cell.textLabel?.text = "Mail Room Information"
            break
        case "10":
            cell.textLabel?.text = "My Class Schedule"
            break
        case "11":
            cell.textLabel?.text = "My Course & Adviser Comments"
            break
        case "12":
            cell.textLabel?.text = "My Academic Year Courses"
            break
        case "13":
            cell.textLabel?.text = "My Out-of-town permissions"
            break
        case "14":
            cell.textLabel?.text = "My Class Schedule by Terms"
            break
        case "15":
            cell.textLabel?.text = "Student View Absences"
            break
        case "16":
            cell.textLabel?.text = "Grade Poing Average by Term"
            break
        case "17":
            cell.textLabel?.text = "Transcript"
        default:
            cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "General Information"
        }else{
            return "Students"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch "\(indexPath.section)\(indexPath.row)" {
        case "00":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "healthVC")
            self.navigationController?.pushViewController(vc!, animated: true)
            break
        case "01":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "mailVC")
            self.navigationController?.pushViewController(vc!, animated: true)
            break
        case "10":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "scheduleVC")
            self.navigationController?.pushViewController(vc!, animated: true)
            break
        case "11":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "commentsVC")
            self.navigationController?.pushViewController(vc!, animated: true)
            break
        case "12":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "yearscheduleVC")
            self.navigationController?.pushViewController(vc!, animated: true)
            break
        case "13":
            break
        case "14":
            break
        case "15":
            break
        case "16":
            break
        case "17":
            break
            default:
                print("no")
            }
    }
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
