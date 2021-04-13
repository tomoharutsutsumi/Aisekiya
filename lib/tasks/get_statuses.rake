namespace :get_statuses do
  task perform: :environment do
    doc = Nokogiri::HTML(URI.open("https://oriental-lounge.com/"))
    doc.css('.woman').zip(doc.css('.man'), doc.css('.en')) do |w, m, e|
      city = City.find_or_create_by(name: e.content)
      city.statuses.create(number_of_women: w.content.to_i, number_of_men: m.content.to_i, 
                           ratio: calc_ratio(w.content.to_i, m.content.to_i))
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
