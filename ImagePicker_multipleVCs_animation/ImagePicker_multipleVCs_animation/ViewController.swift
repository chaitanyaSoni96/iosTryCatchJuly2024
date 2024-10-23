//
//  ViewController.swift
//  ImagePicker_multipleVCs_animation
//
//  Created by Chaitanya Soni on 23/09/24.
//

import UIKit
import Photos
import PhotosUI

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
    private var currentImageViewTileTag: Int? = nil
    
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
        
        imageViewController.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageViewController.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageViewController.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        self.addChild(imageSliderViewController)
        imageSliderViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageSliderViewController.view)
        
        imageSliderViewController.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageSliderViewController.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageViewController.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: imageSliderViewController.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageSliderViewController.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageSliderViewController.view.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        imageViewController.view.bottomAnchor
        
        imageSliderViewController.button1.addTarget(self,
                                                    action: #selector(self.addButtonTapped(_:)),
                                                    for: .touchUpInside)
        imageSliderViewController.button2.addTarget(self,
                                                    action: #selector(self.addButtonTapped(_:)),
                                                    for: .touchUpInside)
        imageSliderViewController.button3.addTarget(self,
                                                    action: #selector(self.addButtonTapped(_:)),
                                                    for: .touchUpInside)
        imageSliderViewController.button4.addTarget(self,
                                                    action: #selector(self.addButtonTapped(_:)),
                                                    for: .touchUpInside)
        imageSliderViewController.button5.addTarget(self,
                                                    action: #selector(self.addButtonTapped(_:)),
                                                    for: .touchUpInside)
        imageSliderViewController.button6.addTarget(self,
                                                    action: #selector(self.addButtonTapped(_:)),
                                                    for: .touchUpInside)
    }
    
    @objc func addButtonTapped(_ sender: UIButton) {
        if photoLibraryAuthorisation {
            
            var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            config.selectionLimit = 1
            config.filter = .images
            
            
            let photoPicker = PHPickerViewController(configuration: config)
            photoPicker.delegate = self
            
            currentImageViewTileTag = sender.superview?.tag
            
            self.present(photoPicker, animated: true)
        }
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
        
        self.present(alert, animated: true)
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let identifiers = results.compactMap(\.assetIdentifier)
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        fetchResult.enumerateObjects { (asset, index, stop) -> Void in
            PHImageManager.default().requestImage(for: asset,
                                                  targetSize: self.imageViewController.imageView.frame.size,
                                                  contentMode: PHImageContentMode.aspectFit,
                                                  options: nil) { (image: UIImage?, _: [AnyHashable : Any]?) in
                self.imageViewController.imageView.image = image
                if let currentImageViewTileTag = self.currentImageViewTileTag {
                    let imageView = self.imageSliderViewController.view.viewWithTag(currentImageViewTileTag)?.subviews.first(where: { $0.isKind(of: UIImageView.self) }) as? UIImageView
                    imageView?.image = image
                }
            }
        }
    }
}
