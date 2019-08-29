module Api
    module V1
      class BusinessesController < ApplicationController

        def index
            @businesses = Business.all

            render json: @businesses
        end

        def show
            @business = Business.find(params[:id])

            render json: @business
        end

        def create
            
            puts "I am here #{params[:user_id]}"
            @business = Business.new( business_params )

            if @business.save
                render json: @business, status: :created
            else
                render json: @business.errors, status: :unprocessable_entity
            end
        end

        private

        def business_params
            params.permit(:name, :website, :city, :state, :street, :zipcode, :building_number, :theme, :description, :hours, :long, :lat, :user_id)
        end

      end
    end
  end