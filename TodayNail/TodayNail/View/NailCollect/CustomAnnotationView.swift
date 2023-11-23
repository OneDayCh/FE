//
//  CustomAnnotationView.swift
//  TodayNail
//
//  Created by 김초원 on 11/23/23.
//

import MapKit

class CustomAnnotationView: MKAnnotationView {
    
    static let identifier = "CustomAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?){
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 40, height: 50)
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
    }
    
}


class CustomAnnotation: NSObject, MKAnnotation {
  let isOnline: Bool?
  let coordinate: CLLocationCoordinate2D

  init(isOnline: Bool?, coordinate: CLLocationCoordinate2D) {
    self.isOnline = isOnline
    self.coordinate = coordinate

    super.init()
  }

}
