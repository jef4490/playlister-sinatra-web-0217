class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    no_caps = ["the", "with", "a"]
    name_string = slug.split("-").map{|w|
       if no_caps.include?(w)
        w
       else
         w.capitalize
       end
     }.join(" ")
    # binding.pry
    find_by_name(name_string)
  end

end
