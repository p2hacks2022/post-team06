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
<<<<<<< HEAD
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
=======
>>>>>>> 2f986fa (とりあえず)
=======
    let photos = ["1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","","46","47","48","49","50"]
    
    func collectionView(_ collectionView: UICollectionView,
             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
     
            // Cell はストーリーボードで設定したセルのID
            let testCell:UICollectionViewCell =
                collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellCollectionViewCell",
                for: indexPath)
        // Tag番号を使ってImageViewのインスタンス生成
                let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
                // 画像配列の番号で指定された要素の名前の画像をUIImageとする
                let cellImage = UIImage(named: photos[indexPath.row])
                // UIImageをUIImageViewのimageとして設定
                imageView.image = cellImage

            // Tag番号を使ってLabelのインスタンス生成
            let label = testCell.contentView.viewWithTag(2) as! UILabel
            label.text = photos[indexPath.row]
     
            return testCell
        }
    
>>>>>>> 87e0797 (途中)
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
