class PortfoliosController < ApplicationController
  before_action :set_portfolio, only:[:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolios = Portfolio.all
    @page_title = "My Portfolios"
  end

  def angular
    @angular_portfilios = Portfolio.angular
  end

  def show; end

  def new
    @portfolio = Portfolio.new
    @portfolio.technologies.build
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
    3.times { @portfolio.technologies.build }
  end

  def update

    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_path,notice: "Portfolio was successfully destroyed." }
    end
  end

  def update_positions
    params[:portfolio_ids].each_with_index do |portfolio_id, index|
      Portfolio.find(portfolio_id).update(position: index + 1)
    end

    respond_to do |format|
      format.js { render js: 'console.log("Positions updated!");' }
    end
  end


  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name])
  end

end
