class MedicalCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '矯正' },
    { id: 3, name: 'HV' },
    { id: 4, name: '鍼' },
    { id: 5, name: 'MA' },
    { id: 6, name: 'プリペイド' },
    { id: 7, name: '自費' },
    { id: 8, name: '楽トレ' },
    { id: 9, name: '頭痛' },
    { id: 10, name: 'めまい・耳鳴り・難聴' },
    { id: 11, name: '神経痛・シビレ' },
    { id: 12, name: '肩こり' },
    { id: 13, name: '五十肩・四十肩' },
    { id: 14, name: '関節痛(四肢)' },
    { id: 15, name: '猫背矯正' },
    { id: 16, name: '産後骨盤矯正' },
    { id: 17, name: '筋トレ' },
    { id: 18, name: 'AGA' }
  ]
 
   include ActiveHash::Associations
   has_many :users
 
  end