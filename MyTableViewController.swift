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
    
    var books: [Book]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        books = [
            Book(title: "Book1", author: "Author1", pages: 100, language: .English),
            Book(title: "Book2", author: "Author2", pages: 200, language: .English),
            Book(title: "Book3", author: "Author3", pages: 300, language: .English)
        ]
        
        navigationItem.title = "My Stuff"
        navigationItem.rightBarButtonItem = editButtonItem()
        
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
    
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        performAddItem(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellTypeBasic", forIndexPath: indexPath) as! BasicTableViewCell
        
        
        // Configure the cell...
        let row = indexPath.row
        let book = books[row]
        
        //for default tableviewcell style
        //cell.textLabel?.text = book.title
        //cell.detailTextLabel?.text = book.author
        cell.Title.text = book.title
        cell.Pages.text = "\(book.pages)"
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            books.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
           
            if (books.count == 0) {
                
                //refresh to display the pretty emptydataset page
                self.tableView.reloadData()
            
                //get rid of 'Done' button in edit mode (don't forget to bring it back!)
                self.navigationItem.rightBarButtonItem = nil
            }
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let b = books.removeAtIndex(fromIndexPath.row);
        books.insert(b, atIndex: toIndexPath.row)
    }
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    
    
    // MARK: - Navigation
    //#WARNING: FIX THIS HORRIBLE CODE
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "itemDetailSegue") {
            let detailViewController = segue.destinationViewController as! BookDetailTableViewController
            let indexPath = tableView.indexPathForSelectedRow
            let intRow = indexPath!.row
            let book = books[intRow]
            detailViewController.book = book
            detailViewController.completionHandler = { book in
                //chanage main model
                self.books[intRow] = book
                self.tableView.reloadData()
            }
        }
        else if segue.identifier == "addItemSegue" {
            let navVC = segue.destinationViewController as! UINavigationController
            let detailViewController = navVC.topViewController as! BookDetailTableViewController
            let book = Book(title: "New Title", author: "New Author", pages: 1, language: .English)
            
            //TODO: Insert alphabetically
            books.insert(book, atIndex: 0)
            detailViewController.book = book
            detailViewController.completionHandler = { book in
                //chanage main model
                self.books[0] = book
                self.tableView.reloadData()
            }
            
            detailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: detailViewController, action: "done")
            
            if (self.navigationItem.rightBarButtonItem == nil) {
                
                //brings edit button back
                self.navigationItem.rightBarButtonItem = editButtonItem()
                
                //programmatically toggles from 'Done' to 'Edit'
                self.setEditing(false, animated: true)
            }

        }
        
    }
    
    
    @IBAction func performAddItem(sender: AnyObject) {
        performSegueWithIdentifier("addItemSegue", sender: self)
        
    }
}
