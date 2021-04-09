//
//  UITableViews.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/2/21.
//

import UIKit

extension UITableView {
    
    func noAlarmImage(image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        imageView.image = image
        imageView.sizeToFit()
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.backgroundView = imageView
        self.separatorStyle = .none
        self.isScrollEnabled = false
    }
    
    func hideCells() {
        tableFooterView = UIView()
        
    }
    
    
    
    
}

