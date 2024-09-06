//
//  ViewController.swift
//  CollectionView example
//
//  Created by Chaitanya Soni on 26/08/24.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "custom")
        
        let headerFooterNib = UINib(nibName: "CollectionReusableView", bundle: .main)
        collectionView.register(headerFooterNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerFooter")
        collectionView.register(headerFooterNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "headerFooter")
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! CustomCollectionViewCell
        
        cell.titleLabel.text = "section: \(indexPath.section), item: \(indexPath.item)"
        
        cell.subtitleLabel.text = "section: \(indexPath.section), item: \(indexPath.item)"
//        cell.contentView.backgroundColor = .red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerFooter", for: indexPath) as! CollectionReusableView
        headerFooter.label.text = kind
        return headerFooter
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 80)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection == .vertical {
            let drawableWidth = (collectionView.frame.size.width - 60)
            return .init(width: drawableWidth/2, height: drawableWidth/2)
        } else {
            let drawableHeight = (collectionView.frame.size.height - 80)
            return .init(width: drawableHeight/3, height: drawableHeight/3)
        }
    }
}
