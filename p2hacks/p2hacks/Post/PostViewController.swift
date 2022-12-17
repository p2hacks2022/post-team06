//
//  PostViewController.swift
//  p2hacks
//
//  Created by 涌井春那 on 2022/12/12.
//

import UIKit
import Firebase

var IMAGEURL = NSURL(string: "")

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var batsuButton: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subjectText: UITextField!
    @IBOutlet weak var hashtagText: UITextField!
    @IBOutlet weak var descriptionTextView: PlaceTextView!
    // インスタンス変数
    var DBRef:DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        //インスタンスを作成
        DBRef = Database.database().reference()
        let reference = DBRef.child("postData")
        reference.observe(.value, with: { snapshot in
            for child in snapshot.children {
                let key = (child as AnyObject).key as String
                print(key)//keyを取得
            }
        })

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
    //投稿ボタンが押されたときの動作
    @IBAction func addPostButtonAction(_ sender: Any) {
        let dt = Date()
        let dateFormatter = DateFormatter()
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))

        post.sorena = 0
        post.name = subjectText.text!
        post.hashtag = ""
        post.hashtagOptional = hashtagText.text!
        post.date = dateFormatter.string(from: dt)
        post.explanation = descriptionTextView.text!
        post.imageUrl = (IMAGEURL?.absoluteString)!
        // post.idをどんどん足していく
        if POSTDATA.count != 0{
            post.id = POSTDATA.max(ofProperty: "id")! + 1
        }
        // Realmに書き込み
        try! REALM.write {
            REALM.add(post)
        }
        

        let data = ["name": subjectText.text!,"hashtagOptional":hashtagText.text!,"sorena":String(0),"hashtag":"","date":dateFormatter.string(from: dt),"explanation":descriptionTextView.text!,"imageUrl":(IMAGEURL?.absoluteString)!]
        DBRef.child("postData").childByAutoId().setValue(data)

        subjectText.text = ""
        hashtagText.text = ""
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
