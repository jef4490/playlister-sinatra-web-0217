class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

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
