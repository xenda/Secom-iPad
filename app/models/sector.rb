class Sector < ActiveRecord::Base
  has_many :articles, :foreign_key => "sector_id"
  has_many :notes, :foreign_key => "sector_id"
  set_table_name "sectors"
  #estos sectores NO son sectores :)
  MALOS = [116,146,145,87,136,20,41,63,143]

  def to_s
    self.nombre
  end

end