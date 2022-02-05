//
//  MusicCollectionViewCell.swift
//  IOS_WEEK3_CollectionView
//
//  Created by 홍희수 on 2022/01/18.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "MusicCollectionViewCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func setData(imageName : String, title : String, subtitle : String) {
        if let image = UIImage(named : imageName) {
            albumImageView.image = image
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
