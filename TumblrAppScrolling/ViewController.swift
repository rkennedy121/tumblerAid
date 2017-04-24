//
//  ViewController.swift
//  TumblrAppScrolling
//
//  Created by Luke Jones on 29/03/2017.
//  Copyright © 2017 Luke Jones. All rights reserved.
//

import UIKit

let cellId = "cellId"

protocol sendOffset {
    func offsetChanged(offset: CGPoint)
}




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var offsetDelegate: sendOffset!
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableHeaderView = self.profileView
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        return tv
    }()
    
    lazy var menuBar : MenuBar = {
        let bar = MenuBar()
        bar.viewController = self
        let indexpathForCell = IndexPath(row: 0, section: 0)
        let cell = self.tableView.cellForRow(at: indexpathForCell) as! TableViewCell
        bar.swipeCell = cell
        return bar
    }()
    
    lazy var profileView : ProfileView = {
        let view = ProfileView()
        return view
    }()
    
}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        setupViews()
    }
    
    func setupViews() {
        
        view.addSubview(tableView)
        tableView.addSubview(menuBar)
        
        profileView.frame = CGRect(origin: CGPoint(x: 0 , y: 0 ), size: CGSize(width: view.frame.width,
                                                                               height: 270 + 39))
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        menuBar.frame = CGRect(origin: CGPoint(x: 0 ,
                                                  y: profileView.frame.height - 39),
                                  size: CGSize(width: view.frame.width,
                                               height: 39))
    }
}

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.viewController = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height - (270 + 39)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        offsetDelegate.offsetChanged(offset: scrollView.contentOffset)
    }
}


class TableViewCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var viewController: ViewController?
    
    static let reuseIdentifier = String(describing: TableViewCell.self)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        layoutMargins = UIEdgeInsets.zero
        selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.reuseIdentifer)
        cv.isPagingEnabled = true
        cv.backgroundColor = .purple
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
}

extension TableViewCell {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        viewController?.menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 500)
        // Hard coded on purpose
    }
    
    func scrollToMenuIndex(_ menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.reuseIdentifer, for: indexPath) as! GalleryCell
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if indexPath.item == 1 {
            cell.backgroundColor = .yellow
        }
        else if indexPath.item == 2 {
            cell.backgroundColor = .blue
        }
        return cell
    }
    
    func setupViews() {
        
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}



