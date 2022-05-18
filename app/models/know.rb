class Know < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'インターネット' },
    { id: 3, name: 'ゆうちゃん先生のブログ' },
    { id: 4, name: '雑誌' },
    { id: 5, name: 'YouTube' },
    { id: 6, name: 'インスタグラム' },
    { id: 7, name: '友人' },
    { id: 8, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :users
 
  end