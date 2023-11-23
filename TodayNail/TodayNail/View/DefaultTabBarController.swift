//
//  DefaultTabBarController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit

class DefaultTabBarController: UITabBarController {

    private let homeTab = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
    private let shopTab = UITabBarItem(title: nil, image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop"))
    private let itemCollectTab = UITabBarItem(title: nil, image: UIImage(named: "item_collect"), selectedImage: UIImage(named: "item_collect"))
    private let nailCollectTab = UITabBarItem(title: nil, image: UIImage(named: "nail_collect"), selectedImage: UIImage(named: "nail_collect"))
    private let likeTab = UITabBarItem(title: nil, image: UIImage(named: "like"), selectedImage: UIImage(named: "like"))
//    private let mypageTab = UITabBarItem(title: nil, image: UIImage(named: "mypage"), selectedImage: UIImage(named: "mypage"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        var tabFrame = tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = self.view.frame.size.height - 90
        tabBar.frame = tabFrame
        setLayoutTabBar()
    }
    
    private func setLayoutTabBar() {
        tabBar.clipsToBounds = true
        
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .purple
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
    }
    
    private func configureTabBar() {
        self.tabBarController?.tabBar.tintColor = .black
        
        var storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        let home = UINavigationController(rootViewController: homeVC)
        home.tabBarItem = homeTab
        
        storyboard = UIStoryboard.init(name: "Shop", bundle: nil)
        guard let shopVC = storyboard.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController else { return }
        let shop = UINavigationController(rootViewController: shopVC)
        shop.tabBarItem = shopTab
        
        storyboard = UIStoryboard.init(name: "ItemCollect", bundle: nil)
        guard let itemCollectVC = storyboard.instantiateViewController(withIdentifier: "ItemCollectViewController") as? ItemCollectViewController else { return }
        let itemCollect = UINavigationController(rootViewController: itemCollectVC)
        itemCollect.tabBarItem = itemCollectTab
        
        storyboard = UIStoryboard.init(name: "NailCollect", bundle: nil)
        guard let nailCollectVC = storyboard.instantiateViewController(withIdentifier: "NailCollectViewController") as? NailCollectViewController else { return }
        let nailCollect = UINavigationController(rootViewController: nailCollectVC)
        nailCollect.tabBarItem = nailCollectTab
        
        storyboard = UIStoryboard.init(name: "Like", bundle: nil)
        guard let likeVC = storyboard.instantiateViewController(withIdentifier: "LikeViewController") as? LikeViewController else { return }
        let like = UINavigationController(rootViewController: likeVC)
        like.tabBarItem = likeTab
        
//        storyboard = UIStoryboard.init(name: "Home", bundle: nil)
//        guard let mypageVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
//        let mypage = UINavigationController(rootViewController: mypageVC)
//        mypage.tabBarItem = mypageTab
        
        viewControllers = [
            home,
            shop,
            nailCollect,
            itemCollect,
            like,
//            mypage
        ]
    }
}
