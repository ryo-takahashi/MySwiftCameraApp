//
//  ViewController.swift
//  MyCamera
//
//  Created by AdminAir on 2017/12/28.
//  Copyright © 2017年 ryotakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func launchCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("[INFO] カメラ使用可能")
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        } else {
            print("[ERROR] カメラ使用不可能")
        }
    }
    
    @IBAction func launchShareWindow(_ sender: Any) {
        if let sharedImage = imageView.image {
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems,applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

