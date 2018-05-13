class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []
  
  def initialize(species)
    @species = species
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
    @@all << self
  end
  
  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end
  
  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end
  
  def play_with_cats
    cats = @pets[:cats]
    cats.each{ |cat| cat.mood = "happy" }
  end
  
  def walk_dogs
    dogs = @pets[:dogs]
    dogs.each{ |dog| dog.mood = "happy" }
  end
  
  def feed_fish
    fishes = @pets[:fishes]
    fishes.each{ |fish| fish.mood = "happy" }
  end
  
  def sell_pets
    @pets.each do |kind_of_pet, individual_pets|
      individual_pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
  end
  
  def say_species
    "I am a #{@species}."  
  end
  
  def list_pets
    fish_count = @pets[:fishes].count
    dog_count = @pets[:dogs].count
    cat_count = @pets[:cats].count
    
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
  
  # Class Methods
  def self.all 
    @@all
  end
  
  def self.count
    @@all.size
  end
  
  def self.reset_all
    @@all.clear
  end
end