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
    var url: String = ""
    
    init(n: String, l: String, e: Int, u: String)
    {
        name = n;
        location = l
        enrollment = e
        url = u
    }
    
    init(n: String, l: String, e: Int, u: String, i: UIImage)
    {
        name = n;
        location = l
        enrollment = e
        url = u
        image = i
    }

    
    override
    init()
    {
    }
}
