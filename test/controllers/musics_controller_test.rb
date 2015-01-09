require 'test_helper'

class MusicsControllerTest < ActionController::TestCase
  setup do
    @music = musics(:one)
  end

test "should not get index when not logged in" do
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    sign_in users(:jason)
    get :index
    assert_response :success
    assert_not_nil assigns(:musics)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to login_path
  end

test " should render the new page when logged in" do
  sign_in users(:jason)
  get :new
  assert_response :success
end

test "should be logged in to create music" do
  post :create, musics: 
  assert_response :redirect
  assert_redirected_to new_user_session_path
end

  test "should create music when logged in" do
    sign_in users(:jason)
    assert_difference('Music.count') do
      post :create, music: { format: @music.format, length: @music.length, name: @music.name, size: @music.size }
    end

    assert_redirected_to music_path(assigns(:music))
  end

test "should not show music when not logged in" do
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should show music" do
    sign_in users(:jason)
    get :show, id: @music
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:jason)
    get :edit, id: @music
    assert_response :success
  end

  test "should redirect update music when not logged in" do
    patch :update, id: @music, music: { format: @music.format, length: @music.length, name: @music.name, size: @music.size }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should redirect update music when logged in" do
    sign_in users(:jason)
    patch :update, id: @music, music: { format: @music.format, length: @music.length, name: @music.name, size: @music.size }
    assert_redirected_to music_path(assigns(:music))
  end

  test "should destroy music" do
    assert_difference('Music.count', -1) do
      delete :destroy, id: @music
    end

    assert_redirected_to musics_path
  end
end
