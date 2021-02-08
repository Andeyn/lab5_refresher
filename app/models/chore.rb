class Chore < ApplicationRecord
    # Relationships
    # -----------------------------
    has_one :task
    has_one :child
    belongs_to :child
    belongs_to :task
  end
  