//
//  searchPage.swift
//  instagram
//
//  Created by R82 on 02/08/23.
//

import UIKit

class searchPage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    @IBOutlet weak var cvForSearch: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvForSearch.dequeueReusableCell(withReuseIdentifier: "cellForSearch", for: indexPath) as! CollectionViewCellForSearch
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 101, height: 102)
    }
}
