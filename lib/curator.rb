class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def photographs_by_artist
    @artists.reduce({}) do |photos_by_artist, artist|
      photos_by_artist[artist] = @photographs.find_all do |photo|
        photo.artist_id.include?(artist.id)
      end
      photos_by_artist
    end
  end

  def artists_with_multiple_photographs
    multiple_photos = []
    photographs_by_artist.each do |artist, photos|
      if photos.length > 1
        multiple_photos << artist.name
      end
    end
    multiple_photos
  end

  def photographs_taken_by_artist_from(country)
    photos_from = []
    photographs_by_artist.each do |artist, photos|
      if artist.country == country
        photos_from << photos
      end
    end
    photos_from.flatten
  end

end
