//
//  BookingTimeCollectionViewCell.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import UIKit

class BookingTimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configure(timeStr: String, isSelected: Bool) {
        backView.backgroundColor = isSelected ? .purple : .systemGray6
        timeLabel.text = timeStr
    }
}
