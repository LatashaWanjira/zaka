class Investment < ApplicationRecord
  belongs_to :investor
  belongs_to :entrepreneur
end
