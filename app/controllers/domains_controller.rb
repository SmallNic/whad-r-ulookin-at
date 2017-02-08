class DomainsController < ApplicationController

  before_action :require_login
  before_action :set_domain, only: [:show, :edit, :update, :destroy]

  def index
    @domains = current_user.domains
  end

  def show
  end

  def new
    @domain = Domain.new
  end

  def edit
  end

  def create
    @domain = Domain.new(user:current_user)
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to @domain, notice: 'Domain was successfully created.' }
        format.json { render :show, status: :created, location: @domain }
      else
        format.html { render :new }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to @domain, notice: 'Domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain }
      else
        format.html { render :edit }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @domain.destroy
    respond_to do |format|
      format.html { redirect_to domains_url, notice: 'Domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_domain
    @domain = Domain.find(params[:id])
  end

  def domain_params
    params.require(:domain).permit(:name, :user_id,)
  end


end
