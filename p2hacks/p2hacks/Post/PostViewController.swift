//
//  PostViewController.swift
//  p2hacks
//
//  Created by 涌井春那 on 2022/12/12.
//


/*
 //ラジオボタンを配置する
 func set_radiobutton(num:Int){
 let button = UIButton()
 let center = Int(UIScreen.main.bounds.size.width / 2)  //中央の位置
 let y = 170+45*num  //ボタン同士が重ならないようyを調整
 button.setImage(uncheckedImage, for: UIControl.State.normal)
 button.addTarget(self, action: #selector(butttonClicked(_:)), for: UIControl.Event.touchUpInside)
 button.frame = CGRect(x: center - 120,
 y: y,
 width: 40,
 height: 40)
 button.tag = num
 self.view.addSubview(button)
 }
 
 //押されたボタンの画像をcheck_on.pngに変える
 @objc func butttonClicked(_ sender: UIButton) {
 ChangeToUnchecked(num: CheckedButtonTag)
 let button = sender
 button.setImage(checkedImage, for: UIControl.State.normal)
 CheckedButtonTag = button.tag  //check_on.pngになっているボタンのtagを更新
 }
 
 //すでにcheck_on.pngになっているボタンの画像をcheck_off.pngに変える
 func ChangeToUnchecked(num:Int){
 for v in view.subviews {
 if let v = v as? UIButton, v.tag == num {
 v.setImage(uncheckedImage, for: UIControl.State.normal)
 }
 }
 }
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 for i in 0..<NumberOfButtons {
 set_radiobutton(num: i)
 }
 }
 */

import UIKit
import Firebase
import FirebaseStorageUI

var IMAGEURL = NSURL(string: "")

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var batsuButton: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: PlaceTextView!
    @IBOutlet weak var subjectText: PlaceTextView!
    
    @IBOutlet weak var kotobaButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var humanButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var thingButton: UIButton!
    var NumberOfButtons: Int = 5  //ボタンの数
    var CheckedButtonTag = 0  //チェックされているボタンのタグ
    // インスタンス変数
    var DBRef:DatabaseReference!
    var kotobaFlag: Bool = false
    var humanFlag: Bool = false
    var musicFlag: Bool = false
    var foodFlag: Bool = false
    var thingFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kotobaButton.backgroundColor = .lightGray
        humanButton.backgroundColor = .lightGray
        musicButton.backgroundColor = .lightGray
        foodButton.backgroundColor = .lightGray
        thingButton.backgroundColor = .lightGray
        //画面の中心を表す
        let ViewWidth = Float(UIScreen.main.bounds.size.width)
        //アイコンを中心に表示
        let IconWidthGap = (ViewWidth - Float(postButton.frame.width)) / 2
        postButton.frame = CGRect.init(x: CGFloat(IconWidthGap),
                                       y: postButton.frame.minY,
                                       width: postButton.frame.width,
                                       height: postButton.frame.height)
        
        //インスタンスを作成
        DBRef = Database.database().reference()
        let reference = DBRef.child("postData")
        reference.observe(.value, with: { snapshot in
            for child in snapshot.children {
                let key = (child as AnyObject).key as String
                print(key)//keyを取得
            }
        })
        //ここから
        //storageのURLを参照
//        let storageref = Storage.storage().reference(forURL: "gs://p2hacks-8da7c.appspot.com").child("1.png")
//        //画像をセット
//        imageView.sd_setImage(with: storageref)
        //表示ここまで
        
        //imageViewにタップ判定をつけるためのもの
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(imageViewTapped(_:))))
        //バツボタンにタップ判定をつけるためのもの
        batsuButton.isUserInteractionEnabled = true
        batsuButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(batsuButtonTapped(_:))))
        //textViewにplaceHolderを設定
        descriptionTextView.placeHolder = "説明を入力してください。"
        // Do any additional setup after loading the view.
    }
    //imageViewがタップされた時の動作
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        //画像フォルダが見えるようになる
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
        self.present(picker, animated: true)
    }
    fileprivate func upload(_ date:Date) {
        let currentTimeStampInSecond = UInt64(floor(date.timeIntervalSince1970 * 1000))
        let storageRef = Storage.storage().reference().child("images").child("\(currentTimeStampInSecond).jpg")
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        if let uploadData = self.imageView.image?.jpegData(compressionQuality: 0.9) {
            storageRef.putData(uploadData, metadata: metaData) { (metadata , error) in
                if error != nil {
                    print("error: \(String(describing: error?.localizedDescription))")
                }
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print("error: \(String(describing: error?.localizedDescription))")
                    }
                    print("url: \(String(describing: url?.absoluteString))")
                })
            }
        }
    }
    //言葉ボタンが押されたとき
    @IBAction func chooseKotobaButton(_ sender: Any) {
        if kotobaFlag == false {
            //ONにする時に走らせたい処理
            print("言葉")
            kotobaFlag = true
            humanFlag = false
            thingFlag = false
            musicFlag = false
            foodFlag = false
            kotobaButton.backgroundColor = UIColor(red:0.82, green:0, blue:1, alpha:1.0)
            //UIButtonを無効化
            humanButton.isEnabled = false
            musicButton.isEnabled = false
            thingButton.isEnabled = false
            foodButton.isEnabled = false
        } else if kotobaFlag == true {
            //OFFにする時に走らせたい処理
            print("言葉なし")
            kotobaFlag = false
            kotobaButton.backgroundColor = .lightGray
            //UIButtonを有効化
            humanButton.isEnabled = true
            musicButton.isEnabled = true
            thingButton.isEnabled = true
            foodButton.isEnabled = true
        }
    }
    @IBAction func chooseHumanButton(_ sender: Any) {
        if humanFlag == false {
            //ONにする時に走らせたい処理
            print("人")
            humanFlag = true
            kotobaFlag = false
            thingFlag = false
            musicFlag = false
            foodFlag = false
            humanButton.backgroundColor = UIColor(red:0.82, green:0, blue:1, alpha:1.0)
            //UIButtonを無効化
            kotobaButton.isEnabled = false
            musicButton.isEnabled = false
            thingButton.isEnabled = false
            foodButton.isEnabled = false
        } else if humanFlag == true {
            //OFFにする時に走らせたい処理
            print("人なし")
            humanFlag = false
            humanButton.backgroundColor = .lightGray
            //UIButtonを無効化
            kotobaButton.isEnabled = true
            musicButton.isEnabled = true
            thingButton.isEnabled = true
            foodButton.isEnabled = true
        }
    }
    
    @IBAction func chooseMusicButton(_ sender: Any) {
        if musicFlag == false {
            //ONにする時に走らせたい処理
            print("曲")
            musicFlag = true
            kotobaFlag = false
            humanFlag = false
            thingFlag = false
            foodFlag = false
            musicButton.backgroundColor = UIColor(red:0.82, green:0, blue:1, alpha:1.0)
            //UIButtonを無効化
            humanButton.isEnabled = false
            kotobaButton.isEnabled = false
            thingButton.isEnabled = false
            foodButton.isEnabled = false
            
        } else if musicFlag == true {
            //OFFにする時に走らせたい処理
            print("曲なし")
            musicFlag = false
            musicButton.backgroundColor = .lightGray
            //UIButtonを無効化
            humanButton.isEnabled = true
            kotobaButton.isEnabled = true
            thingButton.isEnabled = true
            foodButton.isEnabled = true
        }
    }
    @IBAction func chooseFoodButton(_ sender: Any) {
        if foodFlag == false {
            //ONにする時に走らせたい処理
            print("食べ物")
            foodFlag = true
            musicFlag = false
            kotobaFlag = false
            humanFlag = false
            thingFlag = false
            foodButton.backgroundColor = UIColor(red:0.82, green:0, blue:1, alpha:1.0)
            //UIButtonを無効化
            humanButton.isEnabled = false
            kotobaButton.isEnabled = false
            thingButton.isEnabled = false
            musicButton.isEnabled = false
        } else if foodFlag == true {
            //OFFにする時に走らせたい処理
            print("食べ物")
            foodFlag = false
            foodButton.backgroundColor = .lightGray
            humanButton.isEnabled = true
            kotobaButton.isEnabled = true
            thingButton.isEnabled = true
            musicButton.isEnabled = true
        }
    }
    @IBAction func chooseThingButton(_ sender: Any) {
        if thingFlag == false {
            //ONにする時に走らせたい処理
            print("もの")
            thingFlag = true
            kotobaFlag = false
            humanFlag = false
            musicFlag = false
            foodFlag = false
            thingButton.backgroundColor = UIColor(red:0.82, green:0, blue:1, alpha:1.0)
            //UIButtonを無効化
            humanButton.isEnabled = false
            kotobaButton.isEnabled = false
            musicButton.isEnabled = false
            foodButton.isEnabled = false
        } else if thingFlag == true {
            //OFFにする時に走らせたい処理
            print("ものなし")
            thingFlag = false
            thingButton.backgroundColor = .lightGray
            //UIButtonを無効化
            humanButton.isEnabled = true
            kotobaButton.isEnabled = true
            musicButton.isEnabled = true
            foodButton.isEnabled = true
        }
    }
    //投稿ボタンが押されたときの動作
    @IBAction func addPostButtonAction(_ sender: Any) {
        let dt = Date()
        let dateFormatter = DateFormatter()
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))

        
        //        post.sorena = 0
        //        post.name = subjectText.text!
        //        post.hashtag = ""
        //        post.hashtagOptional = hashtagText.text!
        //        post.date = dateFormatter.string(from: dt)
        //        post.explanation = descriptionTextView.text!
        //        post.imageUrl = (IMAGEURL?.absoluteString)!
        //        // post.idをどんどん足していく
        //        if POSTDATA.count != 0{
        //            post.id = POSTDATA.max(ofProperty: "id")! + 1
        //}
        //        // Realmに書き込み
        //        try! REALM.write {
        //            REALM.add(post)
        //        }
        var flag:Int = 0
        if(kotobaFlag == true){
            flag = 1
        }
        if(humanFlag == true){
            flag = 2
        }
        if(thingFlag == true){
            flag = 3
            
        }
        if(musicFlag == true){
            flag = 4
        }
        if(foodFlag == true){
            flag = 5
        }
        let data = ["name": subjectText.text!,"hashtagOptional":"","sorena":String(0),"hashtag":String(flag),"date":dateFormatter.string(from: dt),"explanation":descriptionTextView.text!,"imageUrl":(IMAGEURL?.absoluteString)!]
        //DBRef.child("postData").childByAutoId().setValue(data)
        DBRef.child("postData/\(UInt64(floor(dt.timeIntervalSince1970 * 1000)))").setValue(data)
        upload(dt)
        subjectText.text = ""
        descriptionTextView.text = ""
        // storyboardのインスタンス取得
        let itiranStoryboard: UIStoryboard = UIStoryboard(name: "Itiran", bundle: nil)
        // 遷移先ViewControllerのインスタンス取得
        let ItiranView = itiranStoryboard.instantiateViewController(withIdentifier: "Itiran") as! ItiranViewController
        // フルスクリーンにする
        ItiranView.modalPresentationStyle = .fullScreen
        
        let naviVc = UINavigationController(rootViewController: ItiranView)
        
        // 画面遷移
        self.present(naviVc, animated: false, completion: nil)
    }
    //バツボタンがタップされた時の戻る動作
    @objc func batsuButtonTapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    //UIImagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        if info[UIImagePickerController.InfoKey.originalImage] != nil {
            // 画像のパスを取得
            IMAGEURL = info[UIImagePickerController.InfoKey.referenceURL] as? NSURL
        }
        self.dismiss(animated: true)
    }
    //canselButtonを設定
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    //画面をタップしたらキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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

//TextViewにplaceholderを入れるための拡張
final class PlaceTextView: UITextView {
    
    var placeHolder: String = "" {
        willSet {
            self.placeHolderLabel.text = newValue
            self.placeHolderLabel.sizeToFit()
        }
    }
    
    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = self.font
        label.textColor = .gray
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textDidChanged),
                                               name: UITextView.textDidChangeNotification,
                                               object: nil)
        
        NSLayoutConstraint.activate([
            placeHolderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            placeHolderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 7),
            placeHolderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            placeHolderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5)
        ])
        
    }
    
    @objc private func textDidChanged() {
        let shouldHidden = self.placeHolder.isEmpty || !self.text.isEmpty
        self.placeHolderLabel.alpha = shouldHidden ? 0 : 1
    }
    
}
