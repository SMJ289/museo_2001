require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    @curator = Curator.new

    @photo_1 = Photograph.new({
         id: "1",
         name: "Rue Mouffetard, Paris (Boy with Bottles)",
         artist_id: "1",
         year: "1954"
    })

    @photo_2 = Photograph.new({
         id: "2",
         name: "Moonrise, Hernandez",
         artist_id: "2",
         year: "1941"
    })

    @artist_1 = Artist.new({
        id: "1",
        name: "Henri Cartier-Bresson",
        born: "1908",
        died: "2004",
        country: "France"
    })

    @artist_2 = Artist.new({
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
    })

  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_it_has_attributes
    assert_equal [], @curator.photographs
    assert_equal [], @curator.artists
  end

  def test_it_can_add_photos
    @curator.add_photograph(@photo_1)
    assert_equal [@photo_1], @curator.photographs
    @curator.add_photograph(@photo_2)
    assert_equal [@photo_1, @photo_2], @curator.photographs
  end

  def test_it_can_add_artists

  end


end







# pry(main)> curator.artists
# # => []
#
# pry(main)> artist_1 = Artist.new({
#     id: "1",
#     name: "Henri Cartier-Bresson",
#     born: "1908",
#     died: "2004",
#     country: "France"
# })
# # => #<Artist:0x00007fb3d8b4ed60...>
#
# pry(main)> artist_2 = Artist.new({
#     id: "2",
#     name: "Ansel Adams",
#     born: "1902",
#     died: "1984",
#     country: "United States"
# })
# # => #<Artist:0x00007fb3d90bb4b0...>
#
# pry(main)> curator.add_artist(artist_1)
#
# pry(main)> curator.add_artist(artist_2)
#
# pry(main)> curator.artists
# # => [#<Artist:0x00007fb3d8b4ed60...>, #<Artist:0x00007fb3d90bb4b0...>]
#
# pry(main)> curator.find_artist_by_id("1")
# # => #<Artist:0x00007fb3d8b4ed60...>
