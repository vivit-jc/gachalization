# encoding: utf-8

class Country < ActiveRecord::Base
  belongs_to :player

  def init
    self.name = init_name
    # 全ての国の座標配列
    countries = Country.all.map{|country| [country.x,country.y]}

    1000.times do 
      x = rand(16)
      y = rand(16)
      unless(countries.include?([x,y]))
        self.x = x
        self.y = y
        self.save
        break
      end

    end
    self.save
  end

  def init_name
    ["大","神聖","第","大いなる","","",""].sample + self.id.to_s + ["番","","",""].sample + ["国","王国","帝国","共和国","騎士領","連邦","公国"].sample
  end

  def distance(opp_country)
    Math::sqrt((self.x - opp_country.x) ** 2 + (self.y - opp_country.y) ** 2)
  end
end
