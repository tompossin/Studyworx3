class PapersController < ApplicationController
  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @papers }
    end
  end
  
  def writers_desk
    @papers = Paper.where("user_id = ?",current_user.id)
    @nav_body_content = "papers/writers_tools"
  end
  
  def write
    @paper = Paper.find(params[:id])
    
  end
  
  def show
    @paper = Paper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paper }
    end
  end

  # GET /papers/new
  # GET /papers/new.json
  def new
    @paper = Paper.new(user_id: current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paper }
    end
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(params[:paper])

    respond_to do |format|
      if @paper.save
        format.html { redirect_to writers_desk_path, notice: 'Paper was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /papers/1
  # PUT /papers/1.json
  def update
    @paper = Paper.find(params[:id])
    
    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        @autopreview = @paper
        format.html { redirect_to writers_desk_path, notice: 'Paper was successfully updated.' }
        format.js do
          if params[:autopreview] ==  "1"
            render "shared/autopreview"
          else
            render "shared/save_success"
          end 
        end
      else
        format.html { render action: "edit" }
        format.js { render "shared/save_failed"}
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to writers_desk_url }
    end
  end
  
  def endnote
    @endnote = Endnote.find_or_create_by_paper_id(params[:paper_id])
    respond_to do |format|
      format.js 
    end
  end
  
  def update_endnote
    @endnote = Endnote.find(params[:endnote_id])
    respond_to do |format|
      if @endnote.update_attributes(params[:endnote])
        format.js {render "shared/save_success"}
      else
        format.js {render "shared/save_failed"}
      end
    end
  end
  
end
