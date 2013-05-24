class Order < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :description, :end_date, :enrollment, :location,
                  :name, :start_date, :subject, :user_id, :school_id,
                  :price, :billed, :paid, :approved, :clone
  
  # Validations
  validates_presence_of :name, :start_date, :end_date, :subject, :location, :description, :enrollment
  validates :name, uniqueness: true
  
end
