class PagesController < ApplicationController
  # GET /about
  def about
    # Кількість звуків у кожній категорії: { "Природа" => 3, "Урбан" => 1, ... }
    # group + count робить один SQL-запит: SELECT category, COUNT(*) ... GROUP BY category
    @category_counts = SoundEffect.group(:category).count
    @total_count = SoundEffect.count
  end
end
