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
        return "#{self.first_name} #{self.last_name}"
    end
    
    def points_earned
      self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
    end   
    
    #scopes
    scope :alphabetical, -> { order('last_name, first_name') }
    scope :active, -> { where(active: true) }
    
  end
  