class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :edit, :update ]
  def index
    @reviews = Review.all
  end

  def show
  end

  def edit
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
    if @review.save
      redirect_to reviews_path
    else
      flash[:alert] = "#{@review.errors.full_messages.join ", "}"
      redirect_to new_review_path
    end
  end

  def update
    if @review.update review_params
      redirect_to review_path(@review)
    else
      redirect_to edit_review_path(@review)
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :body)
    end

    def set_review
      @review = Review.find params["id"]
    end
end
