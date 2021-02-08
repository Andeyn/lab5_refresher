class Child < ApplicationRecord
    # Relationships
    # -----------------------------
    has_many :chores
    has_many :tasks, through: :chores
  
    #validates
    validates_presence_of :first_name
    validates_presence_of :last_name
  
    #methods
    def name
        return "#{first_name} #{last_name}" #last_name+" "+
    end
  
    #scopes
    scope :alphabetical, -> { order('last_name, first_name') }
    scope :active, -> { where(active: true) }
  end
  