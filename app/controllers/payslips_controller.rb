class PayslipsController < ApplicationController
  # GET /payslips
  # GET /payslips.json
  def index
    @payslips = Payslip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payslips }
    end
  end

  # GET /payslips/1
  # GET /payslips/1.json
  def show
    @payslip = Payslip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payslip }
    end
  end

  # GET /payslips/new
  # GET /payslips/new.json
  def new
    @payslip = Payslip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payslip }
    end
  end

  # GET /payslips/1/edit
  def edit
    @payslip = Payslip.find(params[:id])
  end

  # POST /payslips
  # POST /payslips.json
  def create
    @payslip = Payslip.new(params[:payslip])

    respond_to do |format|
      if @payslip.save
        format.html { redirect_to @payslip, notice: 'Payslip was successfully created.' }
        format.json { render json: @payslip, status: :created, location: @payslip }
      else
        format.html { render action: "new" }
        format.json { render json: @payslip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payslips/1
  # PUT /payslips/1.json
  def update
    @payslip = Payslip.find(params[:id])

    respond_to do |format|
      if @payslip.update_attributes(params[:payslip])
        format.html { redirect_to @payslip, notice: 'Payslip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payslip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payslips/1
  # DELETE /payslips/1.json
  def destroy
    @payslip = Payslip.find(params[:id])
    @payslip.destroy

    respond_to do |format|
      format.html { redirect_to payslips_url }
      format.json { head :no_content }
    end
  end
end
