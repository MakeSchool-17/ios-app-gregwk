//
//  PhotoTakingHelper.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/11/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

typealias PhotoTakingHelperCallback = UIImage? -> Void

class PhotoTakingHelper: NSObject {

    weak var viewController: UIViewController!
    var callback: PhotoTakingHelperCallback
    var imagePickerController: UIImagePickerController?
    
    init(viewController: UIViewController, callback: PhotoTakingHelperCallback) {
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        
        showPhotoTaker()
    }
    
    
    func showPhotoTaker() {
        self.showImagePickerController(.Camera)
    }
    
    func showPhotoSourceSelection() {
        let alertController = UIAlertController(title: nil, message: "How will you attach student work?", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo From Library", style: .Default) { (action) in
            self.showImagePickerController(.PhotoLibrary)
    }
        
        alertController.addAction(photoLibraryAction)
    
        
        if (UIImagePickerController.isCameraDeviceAvailable(.Rear)) {
            let cameraAction = UIAlertAction(title: "Photo From Camera", style: .Default) { (action) in
                self.showImagePickerController(.Camera)
            }
            alertController.addAction(cameraAction)
        }
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
        
    }
        
        
        func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
            imagePickerController = UIImagePickerController()
            imagePickerController!.sourceType = sourceType
            imagePickerController!.delegate = self
            imagePickerController!.allowsEditing = true
            
            self.viewController.presentViewController(imagePickerController!, animated: true, completion: nil)

    }
}


    extension PhotoTakingHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
       
        func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
            viewController.dismissViewControllerAnimated(false, completion: nil)
            
            callback(image)
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            viewController.dismissViewControllerAnimated(true, completion: nil)
        }
        
}