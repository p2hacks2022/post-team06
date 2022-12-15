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
    @IBOutlet weak var SorenaLabel: UILabel!
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var SorenaImage: UIImageView!
    
    
    func setupCell(model: Model){
    func configureCell(model: Model){
        self.NameLabel.text = model.name
        self.TagLabel.text = model.hashtag
        self.backgroundColor = .white
    }
//    func configureCell(model: Model){
//            self.NameLabel.text = model.Name
//            self.TagLabel.text = model.Tag
//            self.backgroundColor = .white
//        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
