//
//  LikedNailViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit

class LikedNailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() {
       collectionView.dataSource = self
       collectionView.delegate = self
       collectionView.register(UINib(nibName: "LikeNailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LikeNailCollectionViewCell")
   }
    
    
}


extension LikedNailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeNailCollectionViewCell", for: indexPath) as? LikeNailCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let detailVC = storyboard?.instantiateViewController(identifier: "NailDetailViewController") as? NailDetailViewController else { return }
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width)/2 - 10
        return CGSize(width: width, height: width*1.35)
    }
}

