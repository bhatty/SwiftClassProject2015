//
//  MyTableViewController.swift
//  ClassProject
//
//  Created by Fahim Bhatty on 1/20/16.
//  Copyright © 2016 Fahim Bhatty. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class MyTableViewController: UITableViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        // A little trick for removing the cell separators
        self.tableView.tableFooterView = UIView()
        
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "empty-book")
    }
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "You have no items"
        let attribs = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(18),
            NSForegroundColorAttributeName: UIColor.darkGrayColor()
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Add items to track the things that are important to you. Add your first item by tapping the + button."
        
        let para = NSMutableParagraphStyle()
        para.lineBreakMode = NSLineBreakMode.ByWordWrapping
        para.alignment = NSTextAlignment.Center
        
        let attribs = [
            NSFontAttributeName: UIFont.systemFontOfSize(14),
            NSForegroundColorAttributeName: UIColor.lightGrayColor(),
            NSParagraphStyleAttributeName: para
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        let text = "Add First Item"
        let attribs = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(16),
            NSForegroundColorAttributeName: view.tintColor
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
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
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
