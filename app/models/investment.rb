class Investment < ApplicationRecord
  belongs_to :investor
  belongs_to :entrepreneur
  validates :invested_amount, numericality: { greater_than_or_equal_to: 100 }
end
