//
//  ProfileViewController.swift
//  ClassProject
//
//  Created by Fahim Bhatty on 1/29/16.
//  Copyright © 2016 Fahim Bhatty. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickProfileImage(sender: AnyObject) {
        
        if hasCamera() {
            
        }
        else {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.delegate = self
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func hasCamera() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.Camera)
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.contentMode = .ScaleAspectFit
            profileImage.image = pickedImage
            
            // save image to file
            let imageData = UIImageJPEGRepresentation(pickedImage, 0.8)
            let fileName = NSUUID().UUIDString
            let documentsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
            let fullFilePath = documentsDir.stringByAppendingString("/\(fileName).jpg")
            let fileManager = NSFileManager.defaultManager()
            fileManager.createFileAtPath(fullFilePath, contents: imageData, attributes: nil)
            
            // TODO: delete old file if any and then set this to be the file.
//            if (filePath != nil) {
//                let filePathToBeDeleted = "\(documentsDir)/\(filePath)"
//                do { try fileManager.removeItemAtPath(filePathToBeDeleted) } catch {}
//            }
//            filePath = "\(fileName).jpg"
//            if let callback = completionCallback {
//                callback(filePath!)
//            }
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
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
