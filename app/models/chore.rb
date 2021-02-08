class Chore < ApplicationRecord
      # Relationships
      belongs_to :child
      belongs_to :task
  
      # Validations
  validates_date :due_on    
  validates_presence_of :due_on
      
      
  
      # Scopes
      scope :alphabetical, -> {order("name")}
      scope :chronological, -> {order('due_on, completed')}
      scope :pending, -> {where(completed: false)}
      scope :done, -> {where(completed: true)}
      scope :upcoming, -> {where('due_on >= ?', Date.current)}
      scope :past, -> {where('due_on < ?', Date.current)}
      scope :by_task, -> {joins(:task).order('name')}
      
      def status
          if completed == true
              return "Completed"
          else
              return "Pending"
          end
      end
  
  end