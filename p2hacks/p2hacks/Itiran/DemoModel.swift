//
//  DemoModel.swift
//  p2hacks
//
//  Created by Mugi on 2022/12/12.
//

import Foundation

struct Model:Codable{
    let id: Int
    let name: String
    let category: Int
    let hashtag: String
    let sorena: Int
    let date: Date
    let explanation: String
}

//extension Bundle {
//    func decodeJSON<T: Codable>(_ file: String) -> T {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Faild to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
//}
//
//let model: [Model] = Bundle.main.decodeJSON("Data.json")


//struct Model {
//    let Name: String
//    let Tag: String?
//
//    static func createModels() -> [Model] {
//        return [
//            Model(Name: "AAAAAAAAAA", Tag: "aaaaaaaaaa"),
//            Model(Name: "BBBBBBBBBB", Tag: "bbbbbbbbbb"),
//            Model(Name: "CCCCCCCCCC", Tag: "cccccccccc"),
//            Model(Name: "DDDDDDDDDD", Tag: "dddddddddd"),
//        ]
//    }
//}
