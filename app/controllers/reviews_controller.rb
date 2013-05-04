
class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
    @paper = Paper.find(params[:paper_id])
    @reviews = @paper.reviews.all
    @votes = @paper.tally_votes
    @nav_body_content = "reviews/reviews"

    respond_to do |format|
      format.html 
    end
  end

  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @paper = Paper.find(params[:paper_id])
    @review = @paper.reviews.find_or_create_by_user_id(user_id: current_user.id)

    respond_to do |format|
      format.js
    end
  end

  def edit
    @paper = Paper.find(params[:paper_id])
    @review = Review.find(params[:id])
    
    respond_to do |format|
      format.js 
    end
  end
  
  def vote
    @paper = Paper.find(params[:paper_id])
    @review = @paper.reviews.find_or_create_by_user_id(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def create
    @paper = Paper.find(params[:paper_id])
    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        @reviews = @paper.reviews.all
        format.js 
      else
        format.js {render "shared/save_failed"}
      end
    end
  end

  def update
    @paper = Paper.find(params[:paper_id])
    @review = Review.find(params[:id])
    
    respond_to do |format|
      if @review.update_attributes(params[:review])
        @reviews = @paper.reviews.all
        @votes = @paper.tally_votes
        format.js {render "create"}
      else
        format.js {render "shared/save_failed"}
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
    end
  end
end
