class AddUserToSoundEffects < ActiveRecord::Migration[8.1]
  def change
    add_reference :sound_effects, :user, null: false, foreign_key: true
  end
end
