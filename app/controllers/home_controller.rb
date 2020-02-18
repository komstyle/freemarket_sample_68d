class HomeController < ApplicationController

  def index
    @parent_categories = Category.where(ancestry: nil)
  end

end
