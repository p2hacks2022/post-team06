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
    
<<<<<<< HEAD
    
    func setupCell(model: Model){
    func configureCell(model: Model){
        self.NameLabel.text = model.name
        self.TagLabel.text = model.hashtag
=======
    /*func setupCell(model: Model){
        NameLabel.text = model.Name
        if let text = model.Tag{
            TagLabel.text = text
        }
        self.backgroundColor = .white
    }*/
    func setupCell(model: PostJson){
        NameLabel.text = model.name
        if let text = model.hashtag{
            TagLabel.text = text
        }
>>>>>>> 5673d59 (途中)
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
