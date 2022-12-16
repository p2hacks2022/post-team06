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

struct PostJson {
    let id:String
    let name:String
    let hashtag:String?
    let hashtagOptional:String
    let sorena:String
    let date:String
    let explanation:String
    static func createModels() -> [PostJson] {
        return [
            PostJson(id: "1", name: "平成フラミンゴ", hashtag: "1", hashtagOptional: "YouTuber", sorena: "529", date: "2.02212E+13", explanation: "女性2人組のYouTuber")
            ,PostJson(id: "2", name: "IVE", hashtag: "1", hashtagOptional: "韓国", sorena: "112", date: "2.02212E+13", explanation: "韓国の6人組女性アイドルグループ"),
            PostJson(id: "3", name: "なにわ男子", hashtag: "1", hashtagOptional: "ジャニーズ", sorena: "331", date: "2.02212E+13", explanation: "日本の7人組男性アイドルグループ"),
            PostJson(id: "4", name: "Saucy Dog", hashtag: "1", hashtagOptional: "", sorena: "752", date: "2.02212E+13", explanation: "日本のスリーピースロックバンド"),
            PostJson(id: "5", name: "コムドット", hashtag: "1", hashtagOptional: "YouTuber", sorena: "711", date: "2.02212E+13", explanation: "日本の東京都に拠点を置く、5人組のYouTuber"),
            PostJson(id: "6", name: "なえなの", hashtag: "1", hashtagOptional: "", sorena: "815", date: "2.02212E+13", explanation: "日本の女性インフルエンサー"),
            PostJson(id: "7", name: "aespa", hashtag: "1", hashtagOptional: "韓国", sorena: "339", date: "2.02212E+13", explanation: "韓国の4人組多国籍女性アイドルグループ"),
            PostJson(id: "8", name: "高橋史哉", hashtag: "1", hashtagOptional: "", sorena: "651", date: "2.02212E+13", explanation: "日本の俳優"),
            PostJson(id: "9", name: "浅見めい", hashtag: "1", hashtagOptional: "YouTuber", sorena: "556", date: "2.02212E+13", explanation: "日本の女性YouTuberで「くれいじーまねっと」のメンバーの一人"),
            PostJson(id: "10", name: "Ado", hashtag: "1", hashtagOptional: "", sorena: "217", date: "2.02212E+13", explanation: "日本の歌手"),
            PostJson(id: "11", name: "放課後カラオケ", hashtag: "2", hashtagOptional: "青春", sorena: "197", date: "2.02212E+13", explanation: "放課後に友達などとカラオケに行くこと"),
            PostJson(id: "12", name: "チグハグダンス", hashtag: "2", hashtagOptional: "TikTok", sorena: "632", date: "2.02212E+12", explanation: "THE SUPER FRUITのデビューシングル「チグハグ」の楽曲に合わせて踊るダンスのこと"),
            PostJson(id: "13", name: "ios16のロック画面カスタマイズ", hashtag: "2", hashtagOptional: "iPhone", sorena: "492", date: "2.02212E+11", explanation: "2022年9月13日にリリースされた最新バージョン「iOS 16」でロック画面がカスタマイズできるようになった"),
            PostJson(id: "14", name: "サウナ", hashtag: "2", hashtagOptional: "", sorena: "203", date: "2.02212E+14", explanation: "「サ道」というドラマが再放送されたことで、若者の間でサウナが人気となった"),
            PostJson(id: "15", name: "ひろゆきメーカー", hashtag: "2", hashtagOptional: "", sorena: "844", date: "2.02212E+13", explanation: "専用ウェブサイトから、好きな文章等を入力することで、ひろゆき氏が話しているような動画コンテンツを手軽に作成できるジェネレーターサービス"),
            PostJson(id: "16", name: "推し活", hashtag: "2", hashtagOptional: "", sorena: "306", date: "2.02212E+14", explanation: "アイドルやキャラクターなどの「推し」、いわゆるご贔屓を愛でたり応援したりする「推しを様々な形で応援する活動」のこと"),
            PostJson(id: "17", name: "AIフィルタ", hashtag: "2", hashtagOptional: "TikTok", sorena: "923", date: "2.02212E+13", explanation: "TikTokの機能で、使うと漫画で描いたような画像になる"),
            PostJson(id: "18", name: "スプラトゥーン3", hashtag: "2", hashtagOptional: "Swich", sorena: "471", date: "2.02212E+13", explanation: "Nintendo Swich用の2022年9月9日に発売されたゲーム"),
            PostJson(id: "19", name: "肩掛けスマホケース", hashtag: "2", hashtagOptional: "", sorena: "617", date: "2.02212E+13", explanation: "ショルダータイプのスマホケース"),
            PostJson(id: "20", name: "アームウォーム", hashtag: "2", hashtagOptional: "おしゃれ", sorena: "929", date: "2.02212E+13", explanation: "肘下あたりの腕から手までを覆う筒状のもの。韓国アイドルが積極的に取り入れたことから、若い世代を中心にブームが起きた"),
            PostJson(id: "21", name: "カヌレ", hashtag: "5", hashtagOptional: "スイーツ", sorena: "935", date: "2.02211E+11", explanation: "フランスのボルドー地方の修道院で作られた伝統的な焼き菓子"),
            PostJson(id: "22", name: "焼き芋ブリュレフラペチーノ", hashtag: "5", hashtagOptional: "スタバ", sorena: "184", date: "2.02211E+13", explanation: "スターバックスが9月21日に発売したフラペチーノで、さつまいもをスターバックス流にアレンジしたドリンクのこと"),
            PostJson(id: "23", name: "韓国ワッフル", hashtag: "5", hashtagOptional: "スイーツ", sorena: "824", date: "2.02211E+13", explanation: "韓国のワッフルで見た目が可愛らしいのが特徴"),
            PostJson(id: "24", name: "ヤクルト1000", hashtag: "5", hashtagOptional: "", sorena: "441", date: "2.02211E+13", explanation: "生きて腸内まで到達する「乳酸菌 シロタ株」がヤクルト史上最高密度の１本（100ml）に1000億個入った、乳製品乳酸菌飲料"),
            PostJson(id: "25", name: "JKケーキ", hashtag: "5", hashtagOptional: "おしゃれ", sorena: "231", date: "2.02211E+13", explanation: "女子高生の中で人気の、お菓子やキャンドルなど様々な小物でケーキを飾り、JK風なケーキを作ること"),
            PostJson(id: "26", name: "地球グミ", hashtag: "5", hashtagOptional: "", sorena: "155", date: "2.02212E+13", explanation: "地球の見た目をしたグミ"),
            PostJson(id: "27", name: "トゥンカロン", hashtag: "5", hashtagOptional: "スイーツ", sorena: "305", date: "2.02212E+13", explanation: "韓国のマカロンで見た目がとても可愛らしい"),
            PostJson(id: "28", name: "セルインケーキ", hashtag: "5", hashtagOptional: "スイーツ", sorena: "364", date: "2.02212E+13", explanation: "バースデーケーキ・誕生日ケーキ"),
            PostJson(id: "29", name: "わらび餅ドリンク", hashtag: "5", hashtagOptional: "スイーツ", sorena: "517", date: "2.02211E+13", explanation: "ストローで飲めるわらび餅とドリンクが入った飲み物"),
            PostJson(id: "30", name: "マリトッツォ", hashtag: "5", hashtagOptional: "スイーツ", sorena: "375", date: "2.02211E+13", explanation: "イタリア発祥のパンに大量のクリームを挟んだ伝統的なお菓子"),
            PostJson(id: "31", name: "チグハグダンス", hashtag: "4", hashtagOptional: "TikTok", sorena: "626", date: "2.02211E+13", explanation: "THE SUPER FRUITの曲"),
            PostJson(id: "32", name: "知らんけど", hashtag: "4", hashtagOptional: "方言", sorena: "738", date: "2.02211E+13", explanation: "関西弁あるいは特に大阪弁の中で、「自分の見解に責任は持てない」旨を言い添える意味合いで用いられる言い回し"),
            PostJson(id: "33", name: "シャバい", hashtag: "4", hashtagOptional: "", sorena: "170", date: "2.02211E+13", explanation: "ひ弱、根性なし、冴えない、といった様子を表現する俗な言い方"),
            PostJson(id: "34", name: "それな", hashtag: "4", hashtagOptional: "", sorena: "667", date: "2.02211E+13", explanation: "SNSや会話で相手の発言や意見に対して、「まさに！」と相づちを打つときに使われる若者言葉"),
            PostJson(id: "35", name: "まぎか", hashtag: "4", hashtagOptional: "", sorena: "696", date: "2.02211E+13", explanation: "”平成フラミンゴ”の2人が発した本当や真剣という意味の”まじか”が変化した流行語"),
            PostJson(id: "36", name: "限界オタク", hashtag: "4", hashtagOptional: "", sorena: "357", date: "2.02211E+13", explanation: "行動や言動の気持ち悪さや痛々しさが許容量の限界を超えたオタクを指す言葉"),
        ]
    }
}

//,PostJson(id: "1", name: "平成フラミンゴ", hashtag: "1", hashtagOptional: "YouTuber", sorena: "529", date: "2.02212E+13", explanation: "女性2人組のYouTuber")

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
