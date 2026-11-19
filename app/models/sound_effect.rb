class SoundEffect < ApplicationRecord
  CATEGORIES = ["Природа", "Урбан", "Sci-Fi"].freeze

  belongs_to :user
end