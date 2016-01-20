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
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var theView: UIImageView!
    
    override func viewDidLoad()
    {
        nameField.text = college.name
        locationField.text = college.location
        numberField.text = "\(college.enrollment)"
        theView.image = college.image
    }
}
