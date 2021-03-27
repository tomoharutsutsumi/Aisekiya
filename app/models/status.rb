class Status < ApplicationRecord
  # SAPPORO = { id: 0, name: '札幌' }
  # SENDAI = { id: 1, name: '仙台' }
  # OMIYA = { id: 2, name: '大宮' }
  # SHINJUKU = { id: 3, name: '新宿' }
  # SHIBUYA_HONTEN = { id:4, name: '渋谷本店' }
  # SHIBUYA_EKIMAE = { id: 5, name: '渋谷駅前' }
  # MACHIDA = { id: 6, name: '町田' }
  # YOKOHAMA = { id: 7, name: '横浜' }
  # SHIZUOKA = { id: 8, name: '静岡' }
  # NAGOYA_SAKAE = { id: 9, name: '名古屋栄' }
  # NAGOYA_NISIKI = { id: 10, name: '名古屋錦' }
  # KYOTO = { id: 11, name: '京都' }
  # CHAYAMACHI = { id: 12, name: '茶屋町' }
  # UMEDA = { id: 13, name: '梅田' }
  # SHINSAIBASHI = { id: 14, name: '心斎橋' }
  # NAMBA = { id: 15, name: '難波' }
  # KOBE = { id: 16, name: '神戸' }
  # HIROSHIMA = { id: 17, name: '広島' }
  # KOKURA = { id: 17, name: '小倉' }
  # FUKUOKA = { id: 18, name: '福岡' }
  # KUMAMOTO = { id: 19, name: '熊本' }
  # MIYAZAKI = { id: 20, name: '宮崎' }
  # KAGOSHIMA = { id: 21, name: '鹿児島' }
  # OKINAWA = { id: 22, name: '沖縄' }
  # SHOP_NAMES = [SAPPORO, SENDAI, OMIYA, SHINJUKU, SHIBUYA_HONTEN, SHIBUYA_EKIMAE, MACHIDA, 
  #               YOKOHAMA, SHIZUOKA, NAGOYA, KYOTO, CHAYAMACHI, UMEDA, SHINSAIBASHI, NAMBA, 
  #               KOBE, HIROSHIMA, KOKURA, FUKUOKA, KUMAMOTO, MIYAZAKI, KAGOSHIMA, OKINAWA].freeze


  def get_info
    doc = Nokogiri::HTML(URI.open("https://oriental-lounge.com/"))
    woman_nums = []
    man_nums = []
    shop_names = []
    doc.css('.woman').each do |n|
      woman_nums << n.content.to_i
    end
    doc.css('.man').each do |n|
      man_nums << n.content.to_i
    end
    doc.css('.en').each do |n|
      shop_names << n.content
    end
    shop_names.each_with_index do |n, i|
      Status.create(number_of_women: woman_nums[i], number_of_men: man_nums[i], 
                    ratio: calc_ratio(woman_nums[i], man_nums[i]), shop_name:shop_names[i])
    end
  end

  private

  ransacker :created_at do
    Arel.sql('date(created_at)')
  end

  def calc_ratio(women, men)
    if men != 0
      (women / men.to_f * 100).round
    else
      0
    end
  end
end
