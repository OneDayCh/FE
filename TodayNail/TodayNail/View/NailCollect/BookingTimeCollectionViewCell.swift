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
    
    override var isSelected: Bool{
        didSet {
            if isSelected { backView.backgroundColor = UIColor(red: 202/255, green: 201/255, blue: 255/255, alpha: 1) }
            else { backView.backgroundColor = .systemGray6 }
        }
    }
    
    func configure(timeStr: String, isSelected: Bool) { timeLabel.text = timeStr }
}
