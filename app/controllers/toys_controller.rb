class ToysController < ApplicationController
    def index
        render json: Cat.find(params[:cat_id]).toys
    end

    def show
        @cat = Toy.find(self.params[:id])
        render :show
    end

    def create
        # catid = Cat.find(params[:toy][:cat_id]).id
        @toy = Toy.new(toy_params)
        # @catid = self.params[:cat_id]
        @cat = Cat.find(params[:toy][:cat_id])

        if @toy.save
            redirect_to cat_url(@cat)
        else
            # render :new
            render :new
        end
    end

    def new
        @cat = Cat.find(params[:cat_id])
        @toy = Toy.new
        render :new
    end

    def edit

    end

    def destroy
        toy = Toy.find(params[:id])
        toy.destroy
        render json: toy
    end

    def update
        toy = Toy.find(params[:id])
        if toy.update(toy_params) 
            render json: toy
        else
            render json: toy.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    
    def toy_params
        self.params[:toy].permit(:name, :style, :cat_id, :find_cat_id)
    end

    def find_cat_id
        Cat.find(params[:toy][:cat_id]).id
    end

end