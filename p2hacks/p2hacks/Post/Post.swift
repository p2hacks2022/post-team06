//
//  Post.swift
//  p2hacks
//
//  Created by 涌井春那 on 2022/12/14.
//

import Foundation
import RealmSwift

class Post: Object, Codable {
    @objc dynamic var id = 51
    @objc dynamic var sorena = 0
    @objc dynamic var name = ""
    @objc dynamic var hashtag = ""
    @objc dynamic var hashtagOptional = ""
    @objc dynamic var date = ""
    @objc dynamic var explanation = ""
    @objc dynamic var imageUrl = ""
    // プライマリキーの定義
    override public static func primaryKey() -> String? {
        return "id"
    }
}

/*struct PostJson: Codable {
    let id:String
    let name:String
    let hashtag:String
    let hashtagOptional:String
    let sorena:String
    let date:String
    let explanation:String
}*/
