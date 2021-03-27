namespace :get_statuses do
  task perform: :environment do
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

  def calc_ratio(women, men)
    if men != 0
      (women / men.to_f * 100).round
    else
      0
    end
  end
end
