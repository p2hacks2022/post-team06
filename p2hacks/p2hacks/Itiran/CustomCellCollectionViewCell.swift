//
//  CustomCellCollectionViewCell.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/12.
//

import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TagLabel: UILabel!
    
    func setupCell(model: Model){
        NameLabel.text = model.NameLabel
        if let text = model.TagLabel{
            TagLabel.text = text
        }
        
        self.backgroundColor = .lightGray
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
