//
//  NailDetailViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit

class NailDetailViewController: UIViewController {
    
    var isLiked: Bool = false

    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true;
        setupNavigationBar()
        setupLayout()
    }
    
    
    @IBAction func didTapLikeBtn(_ sender: UIButton) {
        isLiked = !isLiked
    }
    
    @IBAction func didTapBookingBtn(_ sender: UIButton) {
        guard let bookingVC = storyboard?.instantiateViewController(identifier: "BookingViewController") as? BookingViewController else { return }
        self.navigationController?.pushViewController(bookingVC, animated: true)
    }
    
    func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false

        let titleItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(moveToBackVC))
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
    
    
    func setupLayout() {
        likeBtn.tintColor = isLiked ? .systemPink :  .lightGray
        bottomBtn.layer.cornerRadius = 22
    }
    
    // MARK: @objc methods
    @objc private func moveToBackVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func moveToSearchVC() {
        
    }

}
