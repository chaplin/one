class Product < ActiveRecord::Base
  
  default_scope :order => 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  
  
  validates :title, :description, :image_url, :presence => true
  validates :title, :uniqueness => true
  validates :price, :numericality => {:greater_than=> 0}
  validates :image_url, :format=>{
    :with => %r{\.(gif|jpg|png|jpeg)$}i,
    :message => 'must be a URL for gif , png or jpg'
  }
  
  
  
  private
  
  
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
    
    
    
end
