//
//  Post.swift
//  p2hacks
//
//  Created by 涌井春那 on 2022/12/14.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var id = 1
    @objc dynamic var sorena = 0
    @objc dynamic var name = ""
    @objc dynamic var hashtag = ""
    @objc dynamic var hashtagOptional = ""
    @objc dynamic var date = ""
    @objc dynamic var descriptionString = ""
    @objc dynamic var imageUrl = ""
}
