//
//  SoptTableViewCell.swift
//  IOS_WEEK3
//
//  Created by 홍희수 on 2022/01/18.
//

import UIKit

class SoptTableViewCell: UITableViewCell {

    static let identifier : String = "SoptTableViewCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(imageName : String, title : String, subtitle : String) {
        if let image = UIImage(named: imageName)
        {
            iconImageView.image = image
        }
        titleLabel.text = title
        subTitleLabel.text = subtitle
    }

}
