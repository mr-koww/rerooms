class MenuItem < ApplicationRecord
  validates :name, presence: true

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
  has_ancestry
end
