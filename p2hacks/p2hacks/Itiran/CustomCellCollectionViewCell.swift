//
//  CustomCellCollectionViewCell.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/12.
//

import UIKit
import Firebase
import FirebaseStorageUI


class CustomCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var NameLabel: UILabel! //バズってる言葉
    @IBOutlet weak var TagLabel: UILabel! //Label
    @IBOutlet weak var SorenaLabel: UILabel! //それなラベル
    @IBOutlet weak var MainImage: UIImageView! //写真
    @IBOutlet weak var SorenaImage: UIImageView!//それな画
    
    //var databaseRef: DatabaseReference!
    override func awakeFromNib() {
        super.awakeFromNib()
        fetchData()
    }
    
        func fetchData(){

            let fetchDataRef = Database.database().reference()

            fetchDataRef.child("postData").observe(.childAdded){(snapShot) in

                let snapShotData = snapShot.value as AnyObject

                let name = snapShotData.value(forKeyPath: "name")
               // let count = snapShotData.value(forKeyPath: "sorena")
                print(name)
                self.NameLabel.text = String(format: "%s", name as! String)
                //self.TagLabel.text = String(format: "%s", count as! String)

                //self.timeLabel.text = record_time as? String

            }
        }
        
        
//        func collectionView(_ collectionView: UICollectionView,
//                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//            // Cell はストーリーボードで設定したセルのID
//            let testCell:UICollectionViewCell =
//            collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellCollectionViewCell",
//                                               for: indexPath)
//            // Tag番号を使ってImageViewのインスタンス生成
//            let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
//            // 画像配列の番号で指定された要素の名前の画像をUIImageとする
//            let cellImage = UIImage(named: photos[indexPath.row])
//            // UIImageをUIImageViewのimageとして設定
//            imageView.image = cellImage
//            
//            // Tag番号を使ってLabelのインスタンス生成
//            let label = testCell.contentView.viewWithTag(2) as! UILabel
//            //label.text = photos[indexPath.row]
//            
//            return testCell
//        }
        
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
            self.backgroundColor = .white
        }
    
            
            
//            override func awakeFromNib() {
//                super.awakeFromNib()
//                // Initialization code
//            }
//        }
//    }

}
