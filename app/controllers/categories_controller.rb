class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]

    def new
        @category = Category.new
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)

    end

    def show
        # byebug
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category was successfully created"
            redirect_to @category
        else
            render 'new'
        end
    end

    private
    private

    def category_params
        params.require(:category).permit(:name)        
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admin can perform that action"
            redirect_to categories_path
        end
    end
end