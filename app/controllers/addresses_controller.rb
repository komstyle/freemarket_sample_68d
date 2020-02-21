class AddressesController < ApplicationController
  
  def edit
  ## 今後マイページの実装で仕様します
  #   @address = Address.find_by(user_id: current_user.id)
  end

  def update
  end

  private
  ## 今後マイページの実装で仕様します
  # def address_params
  #   params.require(:address).permit(:postal_code, :address1, :address2, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id)
  # end
end
