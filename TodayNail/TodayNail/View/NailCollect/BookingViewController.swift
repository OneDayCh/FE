//
//  BookingViewController.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit
import FSCalendar

class BookingViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var timeCollectionView: UICollectionView!
    
    var bookedDateList = ["2023-11-01", "2023-11-04", "2023-11-05", "2023-11-10", "2023-11-12", "2023-11-14"];
    var timeSelectedList = [Bool](repeating: false, count: 24)
    var dateFormat = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendar()
        setupCollectionView()
    }
    
    func setupCalendar() {
        dateFormat.locale = Locale(identifier: "ko_KR")
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.appearance.headerDateFormat = "YYYY.MM"
        calendarView.appearance.headerTitleAlignment = .center
        calendarView.headerHeight = 45
        
        setupCalanderLayout()
    }
    
    func setupCalanderLayout() {
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .horizontal
        calendarView.backgroundColor = .white
        calendarView.appearance.selectionColor = UIColor.purple
        calendarView.appearance.todayColor = UIColor.blue
    }
    
    func setupCollectionView() {
        timeCollectionView.dataSource = self
        timeCollectionView.delegate = self
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormat.string(from: date) + " 날짜가 선택되었습니다.")
    }
    
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormat.string(from: date) + " 날짜가 선택 해제 되었습니다.")
    }

}


extension BookingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTimeCollectionViewCell", for: indexPath) as? BookingTimeCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(timeStr: "\(indexPath.row < 10 ? "0\(indexPath.row)" : "\(indexPath.row)"):00", isSelected: timeSelectedList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        timeSelectedList[indexPath.row] = !timeSelectedList[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width)/5
        return CGSize(width: width, height: 40)
    }
}
