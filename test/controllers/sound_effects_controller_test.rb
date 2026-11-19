require "test_helper"

class SoundEffectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sound_effect = sound_effects(:one)
  end

  test "should get index" do
    get sound_effects_url
    assert_response :success
  end

  test "should get new" do
    get new_sound_effect_url
    assert_response :success
  end

  test "should create sound_effect" do
    assert_difference("SoundEffect.count") do
      post sound_effects_url, params: { sound_effect: { category: @sound_effect.category, description: @sound_effect.description, duration: @sound_effect.duration, title: @sound_effect.title } }
    end

    assert_redirected_to sound_effect_url(SoundEffect.last)
  end

  test "should show sound_effect" do
    get sound_effect_url(@sound_effect)
    assert_response :success
  end

  test "should get edit" do
    get edit_sound_effect_url(@sound_effect)
    assert_response :success
  end

  test "should update sound_effect" do
    patch sound_effect_url(@sound_effect), params: { sound_effect: { category: @sound_effect.category, description: @sound_effect.description, duration: @sound_effect.duration, title: @sound_effect.title } }
    assert_redirected_to sound_effect_url(@sound_effect)
  end

  test "should destroy sound_effect" do
    assert_difference("SoundEffect.count", -1) do
      delete sound_effect_url(@sound_effect)
    end

    assert_redirected_to sound_effects_url
  end
end
