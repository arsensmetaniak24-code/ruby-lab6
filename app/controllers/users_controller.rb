class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  # GET /users/1 — сторінка профілю користувача
  def show
    @sound_effects = @user.sound_effects.with_attached_image.order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params.expect(:id))
  end
end
