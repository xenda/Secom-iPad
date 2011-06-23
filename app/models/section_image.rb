class SectionImage < ActiveRecord::Base
  
  belongs_to :articulo, :foreign_key => "articulo_id"
  belongs_to :seccion, :foreign_key => "seccion_id"
  
  has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "190x125#" }
  
end
