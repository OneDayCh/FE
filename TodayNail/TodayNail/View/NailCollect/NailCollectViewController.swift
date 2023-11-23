//
//  NailCollectViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit

class NailCollectViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false

        let titleLabel = UILabel()
        titleLabel.text = "네일"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .purple
        titleLabel.sizeToFit()
        
        let titleItem = UIBarButtonItem(customView: titleLabel)
        
        self.navigationItem.leftBarButtonItem = titleItem
        
        let searchItem = UIBarButtonItem(image: UIImage(named: "search"), style: .done, target: self, action: #selector(moveToSearchVC))
        searchItem.tintColor = .purple
        let calendarItem = UIBarButtonItem(image: UIImage(named: "calendar"), style: .done, target: self, action: #selector(moveToSearchVC))
        calendarItem.tintColor = .purple
        let bagItem = UIBarButtonItem(image: UIImage(named: "shop_bag"), style: .done, target: self, action: #selector(moveToSearchVC))
        bagItem.tintColor = .purple
        
        self.navigationItem.rightBarButtonItems = [bagItem, calendarItem, searchItem]
    }
    
    
    @objc private func moveToSearchVC() {
        
    }

}
