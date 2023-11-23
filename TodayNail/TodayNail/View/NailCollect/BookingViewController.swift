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
    @IBOutlet weak var bookingBtn: UIButton!
    
    var timeSelectedList = [Bool](repeating: false, count: 24)
    var dateFormat = DateFormatter()
    
    var selectedDateStr = ""
    var selectedTimeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupCalendar()
        setupCollectionView()
    }
    
    @IBAction func didTapBookingBtn(_ sender: UIButton) {
        if (selectedDateStr.isEmpty || selectedTimeStr.isEmpty) {
            let alert = UIAlertController(title: "", message: "예약하실 날짜와 시간대를 선택해주세요!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "확인", style: .default) { _ in }
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "예약 완료", message: "예약자 : 김오늘\n예약시간 : \(selectedDateStr) \(selectedTimeStr)", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "확인", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func setupLayout() {
        bookingBtn.layer.cornerRadius = 20
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
        selectedDateStr = dateFormat.string(from: date)
    }
    
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDateStr = ""
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
        if (timeSelectedList[indexPath.row]) {
            selectedTimeStr = "\(indexPath.row < 10 ? "0\(indexPath.row)" : "\(indexPath.row)"):00"
        } else {
            selectedTimeStr = ""
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width)/5
        return CGSize(width: width, height: 40)
    }
}
