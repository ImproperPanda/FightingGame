
=begin
I borrowed the majority of this code and modified portions in order to better 
understand creating, initializing and callig objects. Credit goes to user 
ArtemisAthena456 from the SoloLearn app. It was a lot of fun and I plan to
modify it a lot more
=end

name = "Wesley" #Will convert to a 'gets.chomp' when able to do so
puts "Welcome, #{name}"

class Player
    
    attr_accessor :name, :health, :power
    
    def initialize (name, health, power)
        @name = name
        @health = health
        @power = power
    end
    
    #This defines if the plaer is alive. If health is less than 0, they're dead
    def is_alive
        @health > 0
    end
    
    #this defines the attacking actions of the player and their opponet
    def hit(opponent)
        opponent.health -= self.power
    end
    
    #This is the readout of the both the player and opponents health & power
    def to_s
        if @health < 0
            @health = 0
        end
        "\n#{name.upcase}: Health: #{@health}, Power: #{@power}"
    end
    
end

def fight( player_1, player_2 )
    while player_1.is_alive && player_2.is_alive
        player_1.hit(player_2)
        player_2.hit(player_1)
    
        show_info( player_1, player_2 )
    end

    if player_1.is_alive
        puts "#{player_2.name} has been knocked out!"
        puts "#{player_1.name} have won!"
        puts "Congratulations!!"
    elsif player_2.is_alive
        puts "#{player_1.name} have been knocked out!"
        puts "**#{player_2.name} has won!"
        puts "Better luck next time!"
    else
        puts "**It's a TIE. Weird!**"
    end
end

def show_info(*p)
    p.each { |x| puts x }
end

#initializing both players, giving them random HEALTH and POWER stats
puts "PLAYERS INFO\n"
player_1 = Player.new("YOU", rand(10..100), rand(5..20))
player_2 = Player.new("COMPUTER", rand(10..100), rand(5..20))

#show PlAYER Stats
puts player_1.to_s, player_2.to_s
#show PLAYER info
puts "\nAlright, let's fight if out!\n"
fight( player_1, player_2 )
