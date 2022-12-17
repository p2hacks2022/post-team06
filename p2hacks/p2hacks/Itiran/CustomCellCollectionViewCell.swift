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
        SorenaLabel.text = model.sorena
        if let text = model.hashtag{
            //人：１、物事：２、曲：３、言葉：４、食べ物：５
            if(Int(text)==1){
                TagLabel.text = "# 人"
            }
            if(Int(text)==2){
                TagLabel.text = "# 物事"
            }
            if(Int(text)==3){
                TagLabel.text = "# 曲"
            }
            if(Int(text)==4){
                TagLabel.text = "# 言葉"
            }
            if(Int(text)==5){
                TagLabel.text = "# 食べ物"
            }
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
