class SpendsController < ApplicationController
  before_action :set_spend, only: [:show, :edit, :update, :destroy]

  # GET /spends
  # GET /spends.json
  def index
    if (current_user.has_role? :admin) && params[:user_id].present?
      user = User.find_by_id(params[:user_id])
      if user.present?
        @spends = user.spends
      else
        flash[:notice] = "Invalid Entry for User"
        redirect_to users_path
      end
    elsif (current_user.has_role? :admin) && !params[:user_id].present?
      flash[:notice] = "Params User_id should be present"
      redirect_to users_path
    else
      @spends = current_user.spends
    end

  end

  # GET /spends/1
  # GET /spends/1.json
  def show
  end

  # GET /spends/new
  def new
    @spend = current_user.spends.build
  end

  # GET /spends/1/edit
  def edit
  end

  # POST /spends
  # POST /spends.json
  def create
    @spend = current_user.spends.build(spend_params)

    respond_to do |format|
      if @spend.save
        format.html { redirect_to @spend, notice: 'Spend was successfully created.' }
        format.json { render :show, status: :created, location: @spend }
      else
        format.html { render :new }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spends/1
  # PATCH/PUT /spends/1.json
  def update
    respond_to do |format|
      if @spend.update(spend_params)
        format.html { redirect_to @spend, notice: 'Spend was successfully updated.' }
        format.json { render :show, status: :ok, location: @spend }
      else
        format.html { render :edit }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spends/1
  # DELETE /spends/1.json
  def destroy
    @spend.destroy
    respond_to do |format|
      format.html { redirect_to spends_url, notice: 'Spend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spend
      @spend = current_user.spends.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spend_params
      params.require(:spend).permit(:spend_for, :spend_amount, :user_id)
    end
end
