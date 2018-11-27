class MusicLibraryController
 attr_accessor :path
 
  def initialize(path = './db/mp3s')
    @path = path
    music_object = MusicImporter.new(path)
    music_object.import
    music_object
  end
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.chomp
    while input != 'exit'
      puts "What would you like to do"
      input = gets.chomp
    end 
    input
  end

  def list_songs
   list = Song.all.sort_by {|song| song.name }
  list.each_with_index {|song, index|
    number = index + 1
    puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"  
  }
  list 
    
  end

  def list_artists
    list_of = Artist.all.sort_by {|artist| artist.name}
    list_of.each_with_index {|artist, index| 
      number = index + 1
      puts "#{number}. #{artist.name}"
    }
    list_of
  end

  def list_genres
    list_g = Genre.all.uniq.sort_by {|genre| genre.name}
    list_g.each_with_index {|genre, index|
      number = index + 1
      puts "#{number}. #{genre.name}"
    }
    list_g
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
     
    input = gets.chomp
    if input == nil
      
    else  
      the_artist = Artist.all.find { |artist| artist.name == input}
      if the_artist
        song = Song.all.sort_by {|artist| 
          artist.name = the_artist
        }
        the_artist.song.all.each.with_index(1) {|songs, i|
          puts "#{i}. #{songs.name}"
        }
      end
    end
  
  end

end