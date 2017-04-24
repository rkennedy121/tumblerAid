//
//  StylistProfileTableViewHeader.swift
//  Salon
//
//  Created by Luke Jones on 29/12/2016.
//  Copyright © 2016 Luke Jones. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var avatarImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 100.0 / 2
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4.0
        iv.contentMode = UIViewContentMode.scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func setupViews() {
        addSubview(avatarImage)
        avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
