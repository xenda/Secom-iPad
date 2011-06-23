 class Article < ActiveRecord::Base
    belongs_to :edition, :foreign_key => "edicion_id"
    belongs_to :section, :foreign_key => "seccion_id"
    belongs_to :sector
    
    set_table_name "articulos"

    def sti_name 
      "Articulo"
    end
    has_attached_file :banner, :styles => { :thumb => "53x50#" }

    def ipad_section
case self.seccion_id
        when 43,3,12,1,14,21,7 then 1
        when 9,8,4,38,5 then 2
        when 20,11,42,13,39,54 then 3
      end
     end

  end