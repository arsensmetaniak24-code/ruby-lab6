class SoundEffect < ApplicationRecord
  CATEGORIES = ["Природа", "Урбан", "Sci-Fi"].freeze

  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?

    unless image.blob.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:image, "має бути формату jpeg, png або webp")
    end

    if image.blob.byte_size > 5.megabytes
      errors.add(:image, "розмір файлу не повинен перевищувати 5 МБ")
    end
  end

end