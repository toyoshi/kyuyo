class PayslipsController < ApplicationController
  include ActionView::Helpers::NumberHelper

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

  def pdf
    @payslip = Payslip.find(params[:id])

    reports = ThinReports::Report.new layout: File.join(Rails.root , 'app', 'reports', 'basic')
    reports.start_new_page do |page|
      page.item(:name).value(@payslip.name)
      page.item(:payslip_date).value(@payslip.payslip_date.strftime("%Y年%m月"))

      %w(work_from work_to).each do |key|
        page.item(key.to_sym).value(@payslip.send(key).strftime("%Y年%m月%d日"))
      end

      %w(working_days working_time).each do |key|
        page.item(key.to_sym).value(@payslip.send(key))
      end

      %w(basic_pay transportation_expenses income_tax allowanance_amount deduction_amount balance).each do |key|
        page.item(key.to_sym).value("#{number_with_delimiter(@payslip.send(key))}円")
      end
    end

    send_data reports.generate, filename: "payslip#{@payslip.id}",
      type: 'application/pdf', disposition: 'attachment'
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
