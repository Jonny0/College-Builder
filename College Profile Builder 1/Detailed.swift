//
//  Detailed.swift
//  College Profile Builder 1
//
//  Created by JonathanMarch on 1/20/16.
//  Copyright © 2016 JonathanMarch. All rights reserved.
//

import UIKit
import SafariServices

class Detailed: UIViewController, SFSafariViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    var colleges = [College]()
    var index:Int = 0
    @IBOutlet var urlField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var theView: UIImageView!
    var imagePicker = UIImagePickerController()

    @IBAction func selectImagePressed(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
        {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            //imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func goToWebpage(sender: AnyObject)
    {
        let svc = SFSafariViewController(URL: NSURL(string: urlField.text!)!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func savePressed(sender: AnyObject)
    {
        colleges[index].url = urlField.text!
        colleges[index].name = nameField.text!
        colleges[index].location = locationField.text!
        colleges[index].image = theView.image!
        if let n = Int(numberField.text!)
        {
            colleges[index].enrollment = n
        }
        performSegueWithIdentifier("show", sender: self)
    }
    
    @IBAction func urlEnded(sender: AnyObject)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func nameEnded(sender: AnyObject)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func numberEnded(sender: AnyObject)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func locationEnded(sender: AnyObject)
    {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad()
    {
        urlField.text = colleges[index].url
        nameField.text = colleges[index].name
        locationField.text = colleges[index].location
        numberField.text = "\(colleges[index].enrollment)"
        theView.image = colleges[index].image
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! ViewController
        dvc.colleges = colleges
        dvc.ind = index
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        picker.dismissViewControllerAnimated(true, completion:
        {
            self.theView.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        })
    }
}
