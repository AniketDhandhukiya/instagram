//
//  ViewController.swift
//  instagram
//
//  Created by R82 on 24/07/23.
//

import UIKit

class mainView: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    var array = ["a"]
    
    @IBOutlet weak var cvForPost: UICollectionView!
    @IBOutlet weak var cvForStory: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cvForStory{
            let cell = cvForStory.dequeueReusableCell(withReuseIdentifier: "cellForStory", for: indexPath) as! CollectionViewCellForStory
            cell.storyImage.layer.cornerRadius = 40
            return cell
        }
        let cells = cvForPost.dequeueReusableCell(withReuseIdentifier: "cellForPost", for: indexPath) as! CollectionViewCellForPost
        cells.userImage.layer.cornerRadius = 25
        
        return cells
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cvForStory{
            return CGSize(width: 150, height: 150)
        }
        return CGSize(width: 392, height: 532)
    }
    
}

