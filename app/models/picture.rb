class Picture < ActiveRecord::Base
  
  belongs_to :user

  validates :user_id, presence: true

  
  
  validates :description, length: { maximum: 140 }

  default_scope -> { order('pictures.created_at DESC') }

  has_attached_file :asset, styles: {
    large: "800x800>", medium: "300x200>", small: "260x180>", thumb: "80x80#"
  }

  def to_s
  	caption? ? caption : "Picture"	
  end
end
