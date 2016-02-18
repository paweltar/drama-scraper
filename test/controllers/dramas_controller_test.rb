require 'test_helper'

class DramasControllerTest < ActionController::TestCase
  setup do
    @drama = dramas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dramas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drama" do
    assert_difference('Drama.count') do
      post :create, drama: { broadcasted_at: @drama.broadcasted_at, description: @drama.description, img: @drama.img, subbed: @drama.subbed, title: @drama.title, url: @drama.url }
    end

    assert_redirected_to drama_path(assigns(:drama))
  end

  test "should show drama" do
    get :show, id: @drama
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drama
    assert_response :success
  end

  test "should update drama" do
    patch :update, id: @drama, drama: { broadcasted_at: @drama.broadcasted_at, description: @drama.description, img: @drama.img, subbed: @drama.subbed, title: @drama.title, url: @drama.url }
    assert_redirected_to drama_path(assigns(:drama))
  end

  test "should destroy drama" do
    assert_difference('Drama.count', -1) do
      delete :destroy, id: @drama
    end

    assert_redirected_to dramas_path
  end
end
