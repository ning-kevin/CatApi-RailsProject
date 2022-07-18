class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(self.params[:id])
        render :show
    end

    def create
        @cat = Cat.new(cats_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new # This :new means the new.html.erb form. NOT THE NEW METHOD BELOW!
        end
    end

    def new
        # /cats/new
        # show a form to create a new object
        @cat = Cat.new #this is just a dummy object 是为了在最开始没有填写的时候不报错。否则没有object但是用object.name会报错
        render :new
    end

    def edit 
        # /cats/id/edit
        # show a form to edit an existing object
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        @cat = Cat.find(params[:id])
        # @theurl = cat_url(@cat)
        if @cat.update(cats_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    def destroy
        cat = Cat.find(params[:id])
        cat.destroy
        redirect_to cats_url
    end

    private

    def cats_params
        self.params[:cat].permit(:name, :gender)
    end


end