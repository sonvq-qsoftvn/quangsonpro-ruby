class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @posts = @category.post
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path, :notice => "Your category has been saved"
        else
            render "new"
        end
    end

    def category_params
        params.require(:category).permit(:name)
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(category_params)
            redirect_to category_path, :notice => "Your category has been updated"
        else
            render "edit"
        end
    end 

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, :notice => "Your category has been deleted"
    end
end
