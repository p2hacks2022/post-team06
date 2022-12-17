//
//  ViewController.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/10.
//

import UIKit
import RealmSwift

class ItiranViewController: UIViewController {
    @IBOutlet weak var TitleImage: UIImageView!
    @IBOutlet weak var collectionview: UICollectionView! //collectionview
    @IBOutlet weak var SearchBar: UISearchBar! //検索バー
    @IBOutlet weak var TopButton: UIButton! //トップボタン
    @IBOutlet weak var WordButton: UIButton! //言葉ボタン
    @IBOutlet weak var PeopleButton: UIButton! //人ボタン
    @IBOutlet weak var MusicButton: UIButton! //音楽ボタン
    @IBOutlet weak var ThingButton: UIButton! //物事ボタン
    
    @IBAction func PostButton(_ sender: Any) {
        // storyboardのインスタンス取得
        let postStoryboard: UIStoryboard = UIStoryboard(name: "Post", bundle: nil)
        // 遷移先ViewControllerのインスタンス取得
        let postView = postStoryboard.instantiateViewController(withIdentifier: "Post") as! PostViewController
        // 画面遷移
        self.present(postView, animated: true, completion: nil)
    }
    @IBOutlet weak var PostButton: UIButton!
    
    let models = Model.createModels()
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        //POSTDATAに入っているデータの確認用
        print("🟥全てのデータ\(POSTDATA)")
        
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

//searchbar ios13以降の仕様
extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        } else {
            return value(forKey: "searchField") as? UITextField
        }
    }
    
}


extension ItiranViewController: UICollectionViewDataSource {
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     let userData = realm.objects(User.self)
     return userData.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
     let userData = realm.objects(User.self)
     print(userData[0].name)
     print(userData[1].name)
     print(userData[0].age)
     print(userData[1].age)
     cell.textLabel!.text = "\(userData[indexPath.row].name)さん"
     cell.detailTextLabel!.text = String("\(userData[indexPath.row].age)歳")
     return cell
     }*/
    /*func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        
    }*/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     let userData = REALM.objects(Post.self)
     return userData.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     //セルオブジェクトを取り出し、セルにモデルオブジェクトを渡して設定を行う
     let cell: CustomCellCollectionViewCell = collectionview.dequeueReusableCell(withReuseIdentifier: "CustomCellCollectionViewCell", for: indexPath) as! CustomCellCollectionViewCell
     let userData = REALM.objects(Post.self)
     cell.layer.borderColor = UIColor.lightGray.cgColor
     cell.layer.borderWidth = 0.5
     cell.NameLabel!.text = "\(userData[indexPath.row].name)"
     cell.TagLabel!.text = "\(userData[indexPath.row].hashtagOptional)"
     return cell
     }
    
}

