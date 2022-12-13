//
//  DetailViewController.swift
//  p2hacks
//
//  Created by 涌井春那 on 2022/12/12.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var TitleImage: UIImageView!
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
       
        //画面の中心を表す
        let ViewWidth = Float(UIScreen.main.bounds.size.width)
        //アイコンを中心に表示
        let IconWidthGap = (ViewWidth - Float(TitleImage.frame.width)) / 2
        TitleImage.frame = CGRect.init(x: CGFloat(IconWidthGap),
                                       y: TitleImage.frame.minY,
                                       width: TitleImage.frame.width,
                                       height: TitleImage.frame.height)
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
