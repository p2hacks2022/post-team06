//
//  ViewController.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/10.
//

import UIKit

class ItiranViewController: UIViewController {
    @IBOutlet weak var TitleImage: UIImageView!
    @IBOutlet weak var collectionview: UICollectionView! //collectionview
    @IBOutlet weak var PostButton: UIButton!
    
    //一覧画面から投稿画面への遷移
    @IBAction func PostButton(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = UIStoryboard(name: "Post", bundle: nil)
        // 遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Post") as! PostViewController
        // 画面遷移
        self.present(nextView, animated: true, completion: nil)
    }
    
   let models = Model.createModels()
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
    
        // Segue 準備
        func prepare(for segue: UIStoryboardSegue, sender: Any!) {
                if (segue.identifier == "toDetail") {
                    let detailVC: DetailViewController = (segue.destination as? DetailViewController)!
                }
            }
        
        //collectionviewから何かの値を取得して遷移
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // [indexPath.row] から画像名を探し、UImage を設定
            selectedImage = UIImage(named: photos[indexPath.row])
            if selectedImage != nil {
                // SubViewController へ遷移するために Segue を呼び出す
                performSegue(withIdentifier: "toSubViewController",sender: nil)
            }
        }
             
        
        collectionview.dataSource = self
        
        //画面の中心を表す
        let ViewWidth = Float(UIScreen.main.bounds.size.width)
        //アイコンを中心に表示
        let IconWidthGap = (ViewWidth - Float(TitleImage.frame.width)) / 2
        TitleImage.frame = CGRect.init(x: CGFloat(IconWidthGap),
                                      y: TitleImage.frame.minY,
                                      width: TitleImage.frame.width,
                                      height: TitleImage.frame.height)
        

        //コレクションビューで使用するセルを登録
        collectionview!.register(UINib(nibName: "CustomCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCellCollectionViewCell")

        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionview.frame.width, height: 159)
        layout.minimumLineSpacing = 0
    
        
        collectionview.collectionViewLayout = layout
    }
}

extension ItiranViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //セルオブジェクトを取り出し、セルにモデルオブジェクトを渡して設定を行う
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CustomCellCollectionViewCell", for: indexPath)
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5

        if let cell = cell as? CustomCellCollectionViewCell {
            cell.setupCell(model: models[indexPath.row])
        }
        return cell
        
    }
}

