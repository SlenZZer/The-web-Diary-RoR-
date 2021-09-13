class DiaryEntryRecordsController < ApplicationController
  before_action :set_diary_entry_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user! , only:[:index, :show]
  before_action :correct_userf, only: [:edit, :destroy ,:destroy]
  # GET /diary_entry_records or /diary_entry_records.json
  def index
    @diary_entry_records = DiaryEntryRecord.all
  end

  # GET /diary_entry_records/1 or /diary_entry_records/1.json
  def show
  end

  # GET /diary_entry_records/new
  def new
    #@diary_entry_record = DiaryEntryRecord.new
    @diary_entry_record = current_user.diary_entry_records.build
  end

  # GET /diary_entry_records/1/edit
  def edit
  end

  # POST /diary_entry_records or /diary_entry_records.json
  def create
    #@diary_entry_record = DiaryEntryRecord.new(diary_entry_record_params)
    @diary_entry_record = current_user.diary_entry_records.build(diary_entry_record_params )

    respond_to do |format|
      if @diary_entry_record.save
        format.html { redirect_to @diary_entry_record, notice: "Diary entry record was successfully created." }
        format.json { render :show, status: :created, location: @diary_entry_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diary_entry_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diary_entry_records/1 or /diary_entry_records/1.json
  def update
    respond_to do |format|
      if @diary_entry_record.update(diary_entry_record_params)
        format.html { redirect_to @diary_entry_record, notice: "Diary entry record was successfully updated." }
        format.json { render :show, status: :ok, location: @diary_entry_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diary_entry_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diary_entry_records/1 or /diary_entry_records/1.json
  def destroy
    @diary_entry_record.destroy
    respond_to do |format|
      format.html { redirect_to diary_entry_records_url, notice: "Diary entry record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_userf
       @diary_entry_record = current_user.diary_entry_records.find_by(id: params[:id])
       redirect_to diary_entry_records_path, notice: " You do not have the permission to do it !! use authorized account. " if @diary_entry_record.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary_entry_record
      @diary_entry_record = DiaryEntryRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diary_entry_record_params
      params.require(:diary_entry_record).permit(:title, :description, :post_time, :datetime, :user_id)
    end
end
