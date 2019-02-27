class Person < ApplicationRecord
    #Associations

    #validations
    validates :age, numericality: {less_than_or_equal_to: 150, greater_than_or_equal_to: 18}
    validates :alive inclusion: {in: %w(true, false), message: "%{value} is invalid"}
    validates :name, :age, :gender, :alive, presence
    validates :name, uniqueness: true
    validates :hair_color, :eye_color, allow_blank: true
    #methods

    # instance method
    before_create :set_alive

    def set_alive
        self.alive = true
    end

    # class method
    def self.order_age
        order:(:age)
    end

end
