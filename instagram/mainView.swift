//
//  ViewController.swift
//  instagram
//
//  Created by R82 on 24/07/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

struct Data{
    var userImage : String
}

class mainView: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var array = ["e","f"]
    
    let userid = Auth.auth().currentUser?.uid
    var arr = [Data]()
    var ref: DatabaseReference!
    var refr = Firestore.firestore()
    @IBOutlet weak var cvForPost: UICollectionView!
    @IBOutlet weak var cvForStory: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cvForStory{
            let cell = cvForStory.dequeueReusableCell(withReuseIdentifier: "cellForStory", for: indexPath) as! CollectionViewCellForStory
            cell.storyImage.layer.cornerRadius = 40
            if indexPath.row == 0  {
                cell.storyImage.image = 
            }
            return cell
        }
        let cells = cvForPost.dequeueReusableCell(withReuseIdentifier: "cellForPost", for: indexPath) as! CollectionViewCellForPost
        return cells
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cvForStory{
            return CGSize(width: 99, height: 130)
        }
        return CGSize(width: 392, height: 542)
    }
    
    func getdataFromFirestore(){
        refr.collection("User").addSnapshotListener{ [self] snapshot, error in
            if  error == nil {
                if let snapshot = snapshot {
                    arr = snapshot.documents.map({ i in
                        return Data(userImage: i["profilePicture"] as! String)
                      
                    })
                }
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
}
