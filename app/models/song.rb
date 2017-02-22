class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    no_caps = ["the", "with", "a", "to"]
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
