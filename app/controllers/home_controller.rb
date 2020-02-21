class HomeController < ApplicationController

  def index

    @parent_categories = Category.where(ancestry: nil)
    @items_category = Item.includes(:user).where(stock_status:"1",category_id:"1").order("created_at DESC")
    @items_brand = Item.includes(:user).where(stock_status:"1",brand_id:"1",).order("created_at DESC")

  end

end