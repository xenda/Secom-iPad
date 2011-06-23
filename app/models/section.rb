class Section < ActiveRecord::Base
   has_many :notes, :foreign_key => "seccion_id"
   has_many :articles, :foreign_key => "seccion_id"
   # has_many :structures
   set_table_name "secciones"
   #secciones especiales
   ESPECIALES = [5,6,19]
   #secciones de secom
   TIPOS = %w{ secom impresa }

   def ipad_section
     case self.id
       when 43,3,12,1,14,21,7 then 1
       when 9,8,4,38,5 then 2
       when 20,11,42,13,39,54 then 3
     end
    end

   def to_s
     nombre
   end

   def articles_for_edition(edition)
    self.articles.find_all_by_edicion_id(edition.id)
   end


 end