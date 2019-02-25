class Artist < ApplicationRecord
  belongs_to :list
  has_many :songs
end
