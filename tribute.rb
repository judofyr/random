require 'raw-tribute'

Song.new(:tribute) do
  greatest = true
  best = true
  tribute!
  
  :long.ago("#{@me} and my brother #{@kyle} here,...") do
    @road = Road.new(:long, :lonesome)
    @we.hitchhiked!(@road)
    
    suddenly!
    @demon.shined!(:in => @road.middle)
    @demon.said "Play the best song in the world, or I'll eat your souls."
    
    @we.looked(:at => 'each other')
    @we.said "Okay."
    @we.played("the first thing that came to our heads") do
      "The Best Song in the World"
    end
    
    look(:into => @my.eyes)
    1 + 1 == 2
    2 + 1 == 3
    destiny = true
    
    every(100_000.years || :so) do
      @sun.doth(:shine) && @moon.doth(:glow) && @grass.doth(:grow)
    end
    
    !need(:to => :say) do
      @beast == :stunned!
      @beast == :done!
    end
    
    @beast.asked(@us, "(snort) Be you angels?")
    @we.said "Nay. We are but men."
    rock!
    
    self != "The Greatest Song in the World"
    just(:tribute)
    !@we.remember("The Greatest Song in the World")
    tribute(:to => "The Greatest Song in the World")
    
    peculiar(:thing) {%q{
      the song we sang on that fateful night it didn't actually sound
      anything like this song!
    }}
    
    just(:tribute)
    @you.believe!(@me) && @I.wish("you were there")
    fuck!
  end
end

