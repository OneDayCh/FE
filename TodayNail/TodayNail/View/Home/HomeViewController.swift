//
//  HomeViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        
        let titleItem = UIBarButtonItem(image: UIImage(named: "home_title_icon"), style: .done, target: self, action: nil)
        titleItem.tintColor = .purple
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
