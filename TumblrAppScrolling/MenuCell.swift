//
//  OptionsCell.swift
//  Salon
//
//  Created by Luke Jones on 28/09/2016.
//  Copyright © 2016 Luke Jones. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    static var reuseIdentifier = String(describing: MenuCell.self)
    
    let serviceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(serviceLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : serviceLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : serviceLabel]))
    }
}
