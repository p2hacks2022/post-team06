//
//  DemoModel.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/12.
//

import Foundation

struct Model {
    let NameLabel: String
    let TagLabel: String?
    
    static func createModels() -> [Model] {
        return [
            Model(NameLabel: "AAAAAAAAAA", TagLabel: "aaaaaaaaaa"),
            Model(NameLabel: "BBBBBBBBBB", TagLabel: "bbbbbbbbbb"),
            Model(NameLabel: "CCCCCCCCCC", TagLabel: "cccccccccc"),
            Model(NameLabel: "DDDDDDDDDD", TagLabel: "dddddddddd"),
            Model(NameLabel: "EEEEEEEEEE", TagLabel: "eeeeeeeeee"),
            Model(NameLabel: "FFFFFFFFFF", TagLabel: "ffffffffff"),
            Model(NameLabel: "GGGGGGGGGG", TagLabel: "gggggggggg"),
            Model(NameLabel: "HHHHHHHHHH", TagLabel: "hhhhhhhhhh"),
            Model(NameLabel: "IIIIIIIIII", TagLabel: "iiiiiiiiii"),
            Model(NameLabel: "JJJJJJJJJJ", TagLabel: "jjjjjjjjjj"),
            Model(NameLabel: "KKKKKKKKKK", TagLabel: "kkkkkkkkkk"),
            Model(NameLabel: "LLLLLLLLLL", TagLabel: "llllllllll"),
            Model(NameLabel: "MMMMMMMMMM", TagLabel: "mmmmmmmmmm"),
            Model(NameLabel: "NNNNNNNNNN", TagLabel: nil),
            Model(NameLabel: "OOOOOOOOOO", TagLabel: nil),
            Model(NameLabel: "PPPPPPPPPP", TagLabel: nil),
            Model(NameLabel: "QQQQQQQQQQ", TagLabel: nil),
            Model(NameLabel: "RRRRRRRRRR", TagLabel: nil),
            Model(NameLabel: "SSSSSSSSSS", TagLabel: nil),
            Model(NameLabel: "TTTTTTTTTT", TagLabel: nil),
            Model(NameLabel: "UUUUUUUUUU", TagLabel: nil),
            Model(NameLabel: "VVVVVVVVVV", TagLabel: nil),
            Model(NameLabel: "WWWWWWWWWW", TagLabel: nil),
            Model(NameLabel: "XXXXXXXXXX", TagLabel: nil),
            Model(NameLabel: "YYYYYYYYYY", TagLabel: nil),
            Model(NameLabel: "ZZZZZZZZZZ", TagLabel: nil),
        ]
    }
}
