//
//  TapViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit
import Tabman
import Pageboy

class TapViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tab에 보여질 VC 추가
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "LikedNailViewController") as? LikedNailViewController {
            viewControllers.append(firstVC)
        }
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "LikedNailShopViewController") as? LikedNailShopViewController {
            viewControllers.append(secondVC)
        }
        
        self.dataSource = self

        // 바 생성 + tabbar 에 관한 디자인처리를 여기서 하면 된다.
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        // tab 밑 bar 색깔 & 크기
        bar.indicator.weight = .custom(value: 1.5)
        bar.indicator.tintColor = .purple
        // tap center
        bar.layout.alignment = .centerDistributed
        // tap 사이 간격
        bar.layout.interButtonSpacing = 12
        // tap 선택 / 미선택
        bar.buttons.customize { (button) in
            button.tintColor = .white
            button.selectedTintColor = .black
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }

        // bar를 안보이게 하고 싶으면 addBar를 지우면 된다. at -> bar 위치
        addBar(bar, dataSource: self, at: .top)
    }
    

}

extension TapViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
        // return .at(index: 0) -> index를 통해 처음에 보이는 탭을 설정할 수 있다.
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        let title: String = index == 0 ? "네일" : "네일샵"
        item.title = title
        return item
    }
}
