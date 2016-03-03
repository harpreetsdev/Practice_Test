//
//  TableViewController.swift
//  WashingtonPost-PracticeTest
//
//  Created by HARPREET SINGH on 3/2/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var items : NSMutableArray = []
    var records = [Record]()
    var titles = [String]()
    var detailVC : DetailViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNetworkCall()
        tableView.delegate = self
        tableView.dataSource = self
        }
    
    func setUpNetworkCall () {
        let url = NSURL(string: "http://www.washingtonpost.com/wp-srv/simulation/simulation_test.json")
        
        if let JSONData = NSData(contentsOfURL: url!) {
            
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(JSONData, options: []) as? NSDictionary {
                    
                    if let postsArray = jsonResult["posts"] as? [NSDictionary] {
                        //print(postsArray)
                        for post in postsArray {
                            records.append(Record(json: post))
                        }
                    }
                    //print(jsonResult)
                    }
                
                }
             catch let error as NSError {
                print(error.localizedDescription)
            }
        }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(records.count)
        return records.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = records[indexPath.row].title
        cell.detailTextLabel?.text = records[indexPath.row].date
        
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let selectedRecordContent = records[indexPath.row].descText else {
          return
        }
        if let detailVC = self.detailVC {
          detailVC.descriptionTextView!.text = selectedRecordContent
        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
//        guard let selectedRecordContent = records[indexPath.row].descText else {
//          return
//        }
//        print("SELECTED CONTENT ==\(selectedRecordContent)")
//        detailVC.descriptionTextView = UITextView()
//        detailVC.descriptionTextView?.textColor = UIColor.blackColor()
//
//        detailVC.descriptionTextView?.text = selectedRecordContent
//        if let descriptionTextView = detailVC.descriptionTextView {
//            
//            descriptionTextView.text = "SOME RENDOM TEXT"
//        }
        //self.presentViewController(detailVC, animated: true, completion: nil)
        print("Cell Tapped")
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            
            let indexPath = tableView.indexPathForSelectedRow
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = segue.destinationViewController as! DetailViewController
            guard let selectedRecordContent = records[indexPath!.row].descText else {
                return
            }
            print("SELECTED CONTENT ==\(selectedRecordContent)")
            detailVC.descriptionTextView = UITextView()
            detailVC.descriptionTextView?.textColor = UIColor.blackColor()
            
            detailVC.descriptionTextView?.text = "SOME RANDOM TEXT"
//            let detailVC =  segue.destinationViewController as! DetailViewController
//            
//            let indexPath = tableView.indexPathForSelectedRow
            print(indexPath?.row)
            //print(records[indexPath!.row].descText)
//            if let trimmedText = records[(indexPath?.row)!].descText?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) {
                //print("TRIMMED TEXT == \(trimmedText)")
                if let descriptionTextView = detailVC.descriptionTextView {
                    descriptionTextView.text = records[(indexPath?.row)!].descText }
//            }
//            detailVC.descriptionText.text = records[indexPath!.row].descText?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            //navigationController?.presentViewController(detailVC, animated: true, completion: nil)
            // Pass the selected object to the new view controller.
//            if let indexPath = tableView.indexPathForSelectedRow {
//                detailVC.descriptionText.textColor = UIColor.blueColor()//records[indexPath.row].descText
//            }
    }
    }
*/
}

class Record {
    
    var title: String?
    var date: String?
    var descText: String?
    
    init(json: NSDictionary) {
        self.title = json["title"] as? String
        self.date = json["date"] as? String
        self.descText = json["content"] as? String
    }
}
