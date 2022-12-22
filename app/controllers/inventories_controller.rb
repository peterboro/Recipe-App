class InventoriesController < ApplicationController
  # frozen_string_literal: true

  class InventoriesController < ApplicationController
    def index
      @current_user = current_user
      @inventories = Inventory.where(user_id: @current_user.id)
      @inventory = Inventory.new
    end

    def show; end

    def create
      @inventory = Inventory.new
      user = current_user
      temp = params[:inventory]
      description = temp[:description]
      name = temp[:name]
      @inventory.description = description
      @inventory.name = name
      @inventory.user_id = user.id
      @inventory.user_id

      redirect_to(request.env['HTTP_REFERER']) if @inventory.save
    end

    def destroy; end

    def compare; end
  end
end
