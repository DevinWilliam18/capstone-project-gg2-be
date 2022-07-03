class GarbageProducersController < ApplicationController
    before_action :set_garbage_producers, only: %i[ show update destroy]

    def index
        @restaurants = GarbageProducer.all

       if params[:param].is_a?(Integer)
            @restaurants = GarbageProducer.by_id_province(params[:param])
       elsif params[:param].is_a?(String)
            @restaurants = GarbageProducer.by_name(params[:param])
       end
       render json: @restaurants
    end

    def show
        render json: @garbage_producer
    end

    def create
        @restaurant = GarbageProducer.new(garbage_producers_params)
        if @restaurant.save
          render json: @restaurant, status: :created
        else
          render error: {error: 'Unable to create garbage_producer.'}, status: 400
        end
    end

    def update
        
        if @garbage_producer.update(garbage_producers_params)
            render json: @garbage_producer
        end
    end

    def destroy
        @garbage_producer.destroy
    end
    
    
    private
        def set_garbage_producers
            @garbage_producer= GarbageProducer.find(params[:id])
        end
        def garbage_producers_params
            params.require(:garbage_producer).permit(:producer_name, :producer_pass, :email_producer, :address, :opening_time, :closing_time, :province_id)
        end
end
