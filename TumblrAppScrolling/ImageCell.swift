//
//  ImageCell.swift
//  TumblrAppScrolling
//
//  Created by Luke Jones on 29/03/2017.
//  Copyright © 2017 Luke Jones. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: ImageCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iv : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "y")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    func setupViews() {
        
        addSubview(iv)
        
        iv.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        iv.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        iv.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}


