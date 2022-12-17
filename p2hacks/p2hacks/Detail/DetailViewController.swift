//
//  DetailViewController.swift
//  p2hacks
//
//  Created by 涌井春那 on 2022/12/12.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var TitleImage: UIImageView! //上のBUZZTEL
    @IBOutlet weak var HeadLabel: UILabel! //上の黒い部分
    @IBOutlet weak var TopImage: UIImageView! //上の写真部分
    @IBOutlet weak var NameLabel: UILabel! //名前ラベル
    
    var selectedImg: UIImage!
    @IBOutlet weak var AddImageButton: UIButton! //写真追加ボタン
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        //画面の中心を表す
        let IconViewWidth = Float(HeadLabel.bounds.size.width)
        //アイコンを中心に表示
        let IconWidthGap = (IconViewWidth - Float(TitleImage.frame.width)) / 2
        TitleImage.frame = CGRect.init(x: CGFloat(IconWidthGap),
                                       y: TitleImage.frame.minY,
                                       width: TitleImage.frame.width,
                                       height: TitleImage.frame.height)
        
        let ViewWidth = Float(UIScreen.main.bounds.size.width)
        //上の写真を中心に表示
        let TopImageWidthGap = (ViewWidth - Float(TopImage.frame.width)) / 2
        TopImage.frame = CGRect.init(x: CGFloat(TopImageWidthGap),
                                       y: TopImage.frame.minY,
                                       width: TopImage.frame.width,
                                       height: TopImage.frame.height)
        //写真追加ボタンを中心に表示
        let AddButtonWidthGap = (ViewWidth - Float(AddImageButton.frame.width)) / 2
        AddImageButton.frame = CGRect.init(x: CGFloat(AddButtonWidthGap),
                                       y: AddImageButton.frame.minY,
                                       width: AddImageButton.frame.width,
                                       height: AddImageButton.frame.height)
        
        //コレクションビューで使用するセルを登録
//        collectionview!.register(UINib(nibName: "CustomCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCellCollectionViewCell")
        
    }
    
    @IBAction func didTapBuckButton(_ sender: Any) {
        self.dismiss(animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
