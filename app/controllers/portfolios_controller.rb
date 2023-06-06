class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def angular
    @angular_portfilios = Portfolio.angular
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_path,notice: "Portfolio was successfully destroyed." }
    end
  end

  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

end
