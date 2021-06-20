class GeneratorsController < ApplicationController
  def index
    @generators = Generator.all
  end

  def show
    @generator = Generator.find(params[:id])
  end

  def new
    @generator = Generator.new
  end

  def create
    @generator = Generator.new(generator_params)

    if @generator.save
      redirect_to(@generator)
    else
      render(:new)
    end
  end

  def edit
    @generator = Generator.find(params[:id])
  end

  def update
    @generator = Generator.find(params[:id])

    if @generator.update(generator_params)
      redirect_to(@generator)
    else
      render :edit
    end
  end

  def destroy
    @generator = Generator.find(params[:id])
    @generator.destroy

    redirect_to generators_path
  end

  private
    def generator_params
      params.require(:generator).permit(:name, :tag_list)
    end
end
