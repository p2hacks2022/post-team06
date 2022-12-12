//
//  DemoModel.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/12.
//

import Foundation

//struct Model:Codable{
//    let name_id: Int
//    let name: String
//    let tag_main: Int
//    let tag_sub: String
//    let date: Date
//    let explanation: String
//
//}

struct Model {
    let Name: String
    let Tag: String?
    
    static func createModels() -> [Model] {
        return [
            Model(Name: "AAAAAAAAAA", Tag: "aaaaaaaaaa"),
            Model(Name: "BBBBBBBBBB", Tag: "bbbbbbbbbb"),
            Model(Name: "CCCCCCCCCC", Tag: "cccccccccc"),
            Model(Name: "DDDDDDDDDD", Tag: "dddddddddd"),
            Model(Name: "EEEEEEEEEE", Tag: "eeeeeeeeee"),
            Model(Name: "FFFFFFFFFF", Tag: "ffffffffff"),
            Model(Name: "GGGGGGGGGG", Tag: "gggggggggg"),
            Model(Name: "HHHHHHHHHH", Tag: "hhhhhhhhhh"),
            Model(Name: "IIIIIIIIII", Tag: "iiiiiiiiii"),
            Model(Name: "JJJJJJJJJJ", Tag: "jjjjjjjjjj"),
            Model(Name: "KKKKKKKKKK", Tag: "kkkkkkkkkk"),
            Model(Name: "LLLLLLLLLL", Tag: "llllllllll"),
            Model(Name: "MMMMMMMMMM", Tag: "mmmmmmmmmm"),
            Model(Name: "NNNNNNNNNN", Tag: nil),
            Model(Name: "OOOOOOOOOO", Tag: nil),
            Model(Name: "PPPPPPPPPP", Tag: nil),
            Model(Name: "QQQQQQQQQQ", Tag: nil),
            Model(Name: "RRRRRRRRRR", Tag: nil),
            Model(Name: "SSSSSSSSSS", Tag: nil),
            Model(Name: "TTTTTTTTTT", Tag: nil),
            Model(Name: "UUUUUUUUUU", Tag: nil),
            Model(Name: "VVVVVVVVVV", Tag: nil),
            Model(Name: "WWWWWWWWWW", Tag: nil),
            Model(Name: "XXXXXXXXXX", Tag: nil),
            Model(Name: "YYYYYYYYYY", Tag: nil),
            Model(Name: "ZZZZZZZZZZ", Tag: nil),
        ]
    }
}
