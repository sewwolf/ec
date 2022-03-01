class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    @user_address = UserAddress.new
  end

  def create
    @user_address = UserAddress.new(user_params)
    if @user_address.valid?
      @user_address.save
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user_address).permit(:email, :password, :password_confirmation, :first_name, :last_name,
                                         :kana_first_name, :kana_last_name, :gender, :telephone_number, :birthday, :postal_code, :area, :municipality, :street_number, :building_name, :service_delivery, :commit)
  end
end
