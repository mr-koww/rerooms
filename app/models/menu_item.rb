class MenuItem < ApplicationRecord
  validates :name, presence: true

  default_scope -> { order(id: :asc) }

  # State machine
  include AASM

  aasm column: 'state' do
    state :new, initial: true
    state :active, :disabled

    event :activate do
      transitions from: :new, to: :active
    end

    event :disable do
      transitions from: %w[new active], to: :disabled
    end
  end

  # Tree
  has_ancestry counter_cache: true

  def parent_name
    parent&.name # TODO: N+1
  end

  # Ransack
  def self.ransackable_attributes(_auth_object = nil)
    %w[id name state]
  end
end
