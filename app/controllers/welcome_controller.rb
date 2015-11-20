class WelcomeController < ApplicationController
  before_filter :authenticate_user!, only: '%w my_test profile'
  layout 'landing', only: :index

  def index

  end

  def my_test
    @model_tests = current_user.model_tests
  end

  def profile
    @user = current_user
  end

end
