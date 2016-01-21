//
//  Detailed.swift
//  College Profile Builder 1
//
//  Created by JonathanMarch on 1/20/16.
//  Copyright © 2016 JonathanMarch. All rights reserved.
//

import UIKit

class Detailed: UIViewController
{
    var college = College()
    var index:Int = 0
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var theView: UIImageView!

    @IBAction func savePressed(sender: AnyObject)
    {
        college.name = nameField.text!
        college.location = locationField.text!
        if let n = Int(numberField.text!)
        {
            college.enrollment = n
        }
        performSegueWithIdentifier("show", sender: self)
    }
    
    override func viewDidLoad()
    {
        nameField.text = college.name
        locationField.text = college.location
        numberField.text = "\(college.enrollment)"
        theView.image = college.image
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! ViewController
        dvc.change = college
        dvc.ind = index
    }
}
