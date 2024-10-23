//
//  CarouselViewController.swift
//  CollectionView example
//
//  Created by Chaitanya Soni on 06/09/24.
//

import UIKit

class CarouselViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let nib = UINib(nibName: "CarouselCollectionViewCell",
                        bundle: .main)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "CarouselCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.currentPage = 0
        button.addTarget(self, action: #selector(self.buttonClicked), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}

extension CarouselViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(#function)
        pageControl.currentPage = indexPath.item
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as? CarouselCollectionViewCell
        else {
            return .init()
        }
        if indexPath.item == 0 {
            cell.imageView.backgroundColor = .red
        } else if indexPath.item == 1 {
            cell.imageView.backgroundColor = .blue
        } else if indexPath.item == 2 {
            cell.imageView.backgroundColor = .green
        }
        
        return cell
    }
    
}

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
}
