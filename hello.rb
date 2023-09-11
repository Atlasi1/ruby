class User
    attr_reader :name

    def initialize(name, birth_year)
        @name = name
        @birth_year = birth_year
    end

    def self.class_name
        "Its a User class"
    end

    def age
        Time.now.year - @birth_year
    end
end

p User.class_name
me = User.new("Artur", 2003)
p me.age
p me.name