//
//  ViewController.swift
//  College Profile Builder 1
//
//  Created by JonathanMarch on 1/20/16.
//  Copyright © 2016 JonathanMarch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var colleges = [College]()
    
    var change = College()
    var ind:Int = -1
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var editingButton: UIBarButtonItem!
    override func viewDidLoad()
    {
        if(ind == -1)
        {
            colleges.append(College(n: "name0",l: "location0",e: 0, u: "http://192.210.139.208/0", i: UIImage(named: "zero")!))
            
            colleges.append(College(n: "name1",l: "location1",e: 0, u: "http://192.210.139.208/1", i: UIImage(named: "one")!))
        }
        editingButton.tag = 0
    }
    
    override func viewDidAppear(animated: Bool)
    {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        return cell;
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        colleges.insert(colleges.removeAtIndex(sourceIndexPath.row), atIndex: destinationIndexPath.row)
    }
    
    @IBAction func editPressed(sender: UIBarButtonItem)
    {
        if(sender.tag == 0)
        {
            tableView.editing = true
            sender.tag = 1
        }
        else
        {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if(editingStyle == .Delete)
        {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler
            { (textField) -> Void in
                textField.placeholder = "Add Name Here"
        }
        alert.addTextFieldWithConfigurationHandler
            { (textField) -> Void in
                textField.placeholder = "Add Location Here"
        }
        alert.addTextFieldWithConfigurationHandler
            { (textField) -> Void in
                textField.placeholder = "Add Number Here"
                textField.keyboardType = UIKeyboardType.NumberPad;
        }
        alert.addTextFieldWithConfigurationHandler
            { (textField) -> Void in
                textField.placeholder = "Add URL Here"
                textField.keyboardType = UIKeyboardType.URL;
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default)
            { (action) -> Void in
                let name = (alert.textFields![0] as UITextField).text
                let location = (alert.textFields![1] as UITextField).text
                let num = (alert.textFields![2] as UITextField).text
                let url =  (alert.textFields![3] as UITextField).text
                if let x = Int(num!)
                {
                    self.colleges.append(College(n: name!, l: location!, e: x, u: url!))
                }
                else
                {
                    self.colleges.append(College(n: name!, l: location!, e: 0, u: url!))
                }
                self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! Detailed
        let index: Int = (tableView.indexPathForSelectedRow?.row)!
        dvc.colleges = colleges
        dvc.index = index
    }
}
