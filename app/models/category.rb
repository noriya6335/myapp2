class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  
  self.data = [{id:1, name: "ピルスナー【チェコ】"}, {id:2, name: "アメリカンラガー【アメリカ】"}, {id:3, name: "シュバルツ【ドイツ】"}, {id:4, name: "ボック【ドイツ】"}, {id:5, name: "ドュンケル【ドイツ】"}, {id:6, name: "ウインナー【オーストリア】"},
               {id:7, name: "ドルトムンダー【ドイツ】"}, {id:8, name: "ペールエール【イギリス・アイルランド】"}, {id:9, name: "ポーター【イギリス・アイルランド】"}, {id:10, name: "スコッチエール【イギリス・アイルランド】"}, {id:11, name: "ホワイトエール【ベルギー】"}, {id:12, name: "トラピスト"} ,
               {id:13, name: "アンバーエール【イギリス・アイルランド】"}, {id:14, name: "スタウト【ベルギー・オランダ】"}, {id:15, name: "ＩＰＡ【ベルギー・オランダ】"}, {id:16, name: "レッドエール【ベルギー】"}, {id:17, name: "ケルシュ【ドイツ】"}, {id:18, name: "ヴァイツエン【ドイツ】"},
               {id:19, name: "フルーツランビック【ベルギー】"}, {id:20, name: "グーズランビック【ベルギー】"}, {id:21, name: "その他"}]

end