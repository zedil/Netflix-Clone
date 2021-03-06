//
//  TitleCVC.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 22.05.2022.
//

import UIKit
import SDWebImage

class TitleCVC: UICollectionViewCell {
    static let identifier = "TitleCVC"
    
    private let posterImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    //dbden dönen resimleri ekrana basılabillir hale getirdik
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
    
    
    
}
