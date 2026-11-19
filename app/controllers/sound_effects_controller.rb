class SoundEffectsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_sound_effect, only: %i[ show edit update destroy ]

  # GET /sound_effects or /sound_effects.json
  def index
    @sound_effects = SoundEffect.includes(:user)
    @sound_effects = @sound_effects.where(category: params[:category]) if params[:category].present?
  end

  # GET /sound_effects/1 or /sound_effects/1.json
  def show
  end

  # GET /sound_effects/new
  def new
    @sound_effect = SoundEffect.new
  end

  # GET /sound_effects/1/edit
  def edit
  end

  # POST /sound_effects or /sound_effects.json

  def create
    @sound_effect = current_user.sound_effects.build(sound_effect_params)

    respond_to do |format|
      if @sound_effect.save
        format.html { redirect_to @sound_effect, notice: "Sound effect was successfully created." }
        format.json { render :show, status: :created, location: @sound_effect }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @sound_effect.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /sound_effects/1 or /sound_effects/1.json
  def update
    respond_to do |format|
      if @sound_effect.update(sound_effect_params)
        format.html { redirect_to @sound_effect, notice: "Sound effect was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @sound_effect }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @sound_effect.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /sound_effects/1 or /sound_effects/1.json
  def destroy
    @sound_effect.destroy!

    respond_to do |format|
      format.html { redirect_to sound_effects_path, notice: "Sound effect was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def destroy_all
    SoundEffect.destroy_all
    redirect_to sound_effects_path, notice: "Усі звукові ефекти видалено", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sound_effect
    @sound_effect = SoundEffect.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def sound_effect_params
    params.expect(sound_effect: [:title, :description, :category, :duration])
  end
end
