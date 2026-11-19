class CreateSoundEffects < ActiveRecord::Migration[8.1]
  def change
    create_table :sound_effects do |t|
      t.string :title
      t.text :description
      t.string :category
      t.decimal :duration

      t.timestamps
    end
  end
end
