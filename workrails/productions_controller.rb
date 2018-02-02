class ProductionsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	def index
		@products=Production.all
	end

	def show
	end

	def new 
		@product=Production.new
	end

	def edit
	end

	
	def create
		@product=Production.new(product_params)
		respond_to do |p|
			if @product.save
				p.html {redirect_to @product, notice: 'Product created'}
				p.json {render :show,status: :created, location: @student}
			else
				p.html{render :new}
				p.json{render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |p|
			if @product.update(product_params)
				p.html {redirect_to @product, notice: 'Product updated'}
				p.json {render :show,status: :created, location: @student}
			else
				p.html{render :new}
				p.json{render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@product.destroy
		respond_to do |p|
			p.html {redirect_to productions_url, notice: 'product info destroyed'}
			p.json {head :no_content}
		end
	end

	private

	def set_product
		@product=Production.find(params[:id])
	end

	def product_params
		params.require(:production).permit(:name, :identity, :price, :category)
	end
end
