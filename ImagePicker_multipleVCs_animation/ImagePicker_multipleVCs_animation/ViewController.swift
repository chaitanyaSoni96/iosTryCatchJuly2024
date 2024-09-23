//
//  ViewController.swift
//  ImagePicker_multipleVCs_animation
//
//  Created by Chaitanya Soni on 23/09/24.
//

import UIKit
import Photos

class ViewController: UIViewController {

    
    fileprivate var photoLibraryAuthorisation: Bool = false
    
    private lazy var imageViewController: ImageViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "ImageViewController") as! ImageViewController
        return vc
    }()
    
    private lazy var imageSliderViewController: ImageSliderViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "ImageSliderViewController") as! ImageSliderViewController
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        let status = PHPhotoLibrary.authorizationStatus(for: PHAccessLevel.readWrite)
        
        if status == .notDetermined {
            
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                
                if status == .authorized || status == .limited {
                    
                    self.photoLibraryAuthorisation = true
                    
                } else {
                    
                    self.photoLibraryAuthorisation = false
                }
            }
            
        } else if status == .authorized || status == .limited {
            
            self.photoLibraryAuthorisation = true
        }
    }
    
    func setupUI() {
        
        //setup imagevc
        self.addChild(imageViewController)
        imageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageViewController.view)
        
        imageViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        imageViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        self.addChild(imageSliderViewController)
        imageSliderViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageSliderViewController.view)
        
        imageSliderViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageSliderViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        imageSliderViewController.view.topAnchor.constraint(equalTo: imageViewController.view.topAnchor).isActive = true
        imageSliderViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        imageSliderViewController.view.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        imageViewController.view.bottomAnchor
        
        
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
        
        self.present(alert, animated: true)
    }
}

