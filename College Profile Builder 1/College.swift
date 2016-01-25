//
//  College.swift
//  College Profile Builder 1
//
//  Created by JonathanMarch on 1/20/16.
//  Copyright © 2016 JonathanMarch. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name: String = ""
    var location: String = ""
    var enrollment: Int = -1
    var image: UIImage = UIImage()
    
    init(n: String, l: String, e: Int)
    {
        name = n;
        location = l
        enrollment = e
    }
    
    init(n: String, l: String, e: Int, i: UIImage)
    {
        name = n;
        location = l
        enrollment = e
        image = i
    }

    
    override
    init()
    {
    }
}
