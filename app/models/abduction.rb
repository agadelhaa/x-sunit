class Abduction < ApplicationRecord
  validates :survivor_id, uniqueness: { scope: :abducted_id }
end
