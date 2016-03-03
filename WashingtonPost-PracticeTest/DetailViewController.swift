//
//  DetailViewController.swift
//  WashingtonPost-PracticeTest
//
//  Created by HARPREET SINGH on 3/2/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let tableViewController = TableViewController()
    @IBOutlet weak var descriptionTextView: UITextView?
    @IBOutlet weak var idLabel: UILabel?
    
    var contentText:String?
    var idLabelText:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOutlets()
        
    }
    
    func setUpOutlets() {
        descriptionTextView?.text = contentText
        idLabel!.text = idLabelText
        view.addSubview(descriptionTextView!)
        view.addSubview(idLabel!)

    }
    @IBAction func backBTNTap(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
