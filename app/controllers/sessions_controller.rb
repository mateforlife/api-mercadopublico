# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :validate_company_mail!, only: :create

  def create
    @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def validate_company_mail!
    user_mail = request.env['omniauth.auth'].info.email
    redirect_to login_path if user_mail.split(//).last(ENV['MAIL_COMPANY_DOMAIN'].length).join("") != ENV['MAIL_COMPANY_DOMAIN']
  end
end
