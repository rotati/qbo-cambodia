# frozen_string_literal: true
class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to companies_path and return if user_signed_in?
  end

  def privacy;end
  def end_user_agreement;end
end
