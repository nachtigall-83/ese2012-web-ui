module Trading

  class Item

    @@items = Array.new
    attr_accessor :name, :price, :owner, :active

    def self.all
      @@items
    end

    def self.by_name(name)
      @@items.detect {|item| item.name == name }
    end

    #factory method
    def self.named(name, price, owner)
      item = self.new
      item.name = name
      item.price = price
      item.owner = owner
      item
    end

    #initialize
    def initialize
      self.status = false
    end

    def to_s
      "#{name}, #{price}"
    end

  end
end