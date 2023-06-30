//
//  ViewController.swift
//  Compositional_layout
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 30/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    private let images: [UIImage] = Array(1 ... 11).map{ UIImage(named: String($0))! }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createLayout()
        
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        //item
        
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 1)
        
        let fullItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 1)
        
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), item: fullItem, count: 2)
        
        //Group
        
        let group = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.3), items:  [item, verticalGroup])
        
        //Section
        
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.setup(image: images[indexPath.row])
        return cell
    }
}

class MyCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet var cellImageView: UIImageView!
    
    func setup(image: UIImage) {
        cellImageView.image = image
    }
    
}
