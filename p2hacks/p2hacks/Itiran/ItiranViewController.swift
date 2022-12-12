//
//  ViewController.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/10.
//

import UIKit

class ItiranViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // goView12ボタン押下時の処理
    @IBAction func button(_ sender: Any) {
            // storyboardのインスタンス取得
            let storyboard: UIStoryboard = UIStoryboard(name: "Post", bundle: nil)
            // 遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "Post") as! PostViewController
            // 画面遷移
            self.present(nextView, animated: true, completion: nil)
        }

}

