//
//  CollectionViewTBC.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 15.05.2022.
//36.46

import UIKit

class CollectionViewTBC: UITableViewCell {
    
    static let identifier = "CollectionViewTBC"
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout() //for able to use scroll direction
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
        
    }()
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        collectionView.frame = contentView.bounds
    }
}

extension CollectionViewTBC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBlue
        
        return cell
    }
    
    
    
}