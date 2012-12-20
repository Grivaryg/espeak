class SpeaksController < ApplicationController
  include ESpeak
  # GET /speaks
  # GET /speaks.json
  def index
    @speaks = Speak.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @speaks }
    end
  end

  # GET /speaks/1
  # GET /speaks/1.json
  def show
    @speak = Speak.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @speak }
    end
  end

  # GET /speaks/new
  # GET /speaks/new.json
  def new
    @speak = Speak.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @speak }
    end
  end

  # GET /speaks/1/edit
  def edit
    @speak = Speak.find(params[:id])
  end

  # POST /speaks
  # POST /speaks.json
  def create

    @speak = Speak.new(params[:speak])

    respond_to do |format|
      if @speak.save
         espeak("#{Rails.root}/public/Music/#{@speak.title}.mp3", :text => @speak.content, :voice => "en", :pitch => 90, :speed => 120)
        format.html { redirect_to @speak, notice: 'Speak was successfully created.' }
        format.json { render json: @speak, status: :created, location: @speak }
      else
        format.html { render action: "new" }
        format.json { render json: @speak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /speaks/1
  # PUT /speaks/1.json
  def update
    @speak = Speak.find(params[:id])

    respond_to do |format|
      if @speak.update_attributes(params[:speak])
        format.html { redirect_to @speak, notice: 'Speak was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @speak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speaks/1
  # DELETE /speaks/1.json
  def destroy
    @speak = Speak.find(params[:id])
    @speak.destroy

    respond_to do |format|
      format.html { redirect_to speaks_url }
      format.json { head :no_content }
    end
  end
end
