class Edition < ActiveRecord::Base
  #relaciones y validación
  set_table_name "ediciones"
  
  URL = "http://semanaeconomica.com" # "http://semanaeconomica.com"
  URL1 = "http://publica01.semanaeconomica.com"          
  
  has_many :notes, :foreign_key => "edicion_id"
  has_many :articles, :foreign_key => "edicion_id"
  has_many :section_images, :foreign_key => "edicion_id"

  has_many :structures, :foreign_key => "edicion_id"

  accepts_nested_attributes_for :section_images, :articles


  def update_structures

    self.secciones.each do |s|
      structure = Structure.find_or_create_by_seccion_id_and_edicion_id(a.id,self.id)
      structure.page_number = a.page_number
      structure.save    
    end
    
  end

  def seccion_number(seccion)
    s = self.structures.find_by_seccion_id(seccion.id)
    return 0 unless s
    return s.page_number
  end

  has_many :sections, :through => :articles, :order=>"orden", :source => :section, :uniq => true, :conditions=>"articulos.publicado=true and secciones.menu=1", :foreign_key => "edicion_id"

  # def to_param
  #   self.numero.to_s
  # end
  
  def update_complete?
    self.articles.where("page_number IS NULL").all.empty?
  end

  def get_section_image_for(section)
    self.section_images.find_or_create_by_seccion_id(section.id)
  end

  def articulo_de_portada
    self.articulos.find_by_seccion_id_and_publicado(9,true,:order=>"orden")
  end

  def otros_articulos
    self.articulos.find_all_by_seccion_id_and_publicado(4,true,:order=>"orden")
  end

  def entrevistas
    self.articulos.find_all_by_seccion_id_and_publicado(8,true,:order=>"orden")
  end

  def oidos
    self.articulos.find_all_by_seccion_id_and_publicado(13,true,:order=>"orden")
  end

  def coliseo
    self.articulos.find_all_by_seccion_id_and_publicado(42,true,:order=>"orden")
  end

  def entremes
    self.articulos.find_all_by_seccion_id_and_publicado(39,true,:order=>"orden")
  end

  def perfil
    self.articulos.find_all_by_seccion_id_and_publicado(14,true,:order=>"orden")
  end

  def entreparentesis
    self.articulos.find_all_by_seccion_id_and_publicado(38,true,:order=>"orden")
  end

  def agenda
    self.articulos.find_all_by_seccion_id_and_publicado(21,true,:order=>"orden")
  end

  def gzm
    self.articulos.find_all_by_seccion_id_and_publicado(20,true,:order=>"orden")
  end

  def foz
    self.articulos.find_all_by_seccion_id_and_publicado(11,true,:order=>"orden")
  end

  def especial_seccion
    a = self.especial_articulos
    return Seccion.find(a.first.seccion_id) if a and a.size > 0
    nil
  end

  def especial_articulos
    self.articulos.find_all_by_seccion_id_and_publicado(Seccion::ESPECIALES,true,:order=>"orden")
  end

  def jsw
    self.articulos.find_all_by_seccion_id_and_publicado(40,true,:order=>"orden")
  end

  def semana_que_paso
    self.articulos.find_all_by_seccion_id_and_publicado(43,true,:order=>"orden")
  end

  def empresas_al_dia
    self.articulos.find_all_by_seccion_id_and_publicado(7,true,:order=>"orden")
  end

  def dicho
    self.articulos.find_all_by_seccion_id_and_publicado(17,true,:order=>"orden")
  end

  def resaltador_cabecera
    self.articulos.find_all_by_seccion_id_and_publicado(48,true,:order=>"orden")
  end

  def al_suscriptor
    self.articulos.find_all_by_seccion_id_and_publicado(1,true,:order=>"orden")
  end

  def movidas
    self.articulos.find_all_by_seccion_id_and_publicado(12,true,:order=>"orden")
  end

  def nota_del_director
    self.articulos.find_all_by_seccion_id_and_publicado(49,true,:order=>"orden")
  end

  def la_bolsa
    articulos.find_all_by_seccion_id_and_publicado(53,true,:order=>"orden")
  end

  def bussines_beyond
    articulos.find_all_by_seccion_id_and_publicado(54,true,:order=>"orden")
  end

  def breves
    articulos.find_all_by_seccion_id_and_publicado(55,true,:order=>"orden")
  end

  def otros
    articulos.find_all_by_seccion_id_and_publicado(35,true,:order=>"orden")
  end

  def sectores
    self.sectors
  end

  def get_caratula(tam = "")
    unless self.caratula1.blank?
      '/imagenes/ediciones/caricaturas/' + self.caratula1
    else
      '/img/caratula/' + tam +  self.numero.to_s + '.jpg'
    end
  end
  
  def portada(tam = "")
    "#{URL1}/img/caratula/#{tam + self.numero.to_s}.jpg"
  end

  # def get_portada(tam = "")
  #   archivo = '/img/portada/' + tam +  self.numero.to_s + '.jpg'
  #   local = RAILS_ROOT + '/public' + archivo
  #   return archivo if File.exist?(local)
  #   ""
  # end  

  #aqui defino cuándo sale publicada la última edición ingresada, 30 horas despues de su fecha de publicado
  def self.actual
    fecha = Time.zone.now.ago(30.hours).to_s(:db)
    Edicion.find(:first,
    :conditions => ["publicado=? and fecha < ?", true, fecha],
    :order => "fecha desc" )    
  end

  def self.primera
    Edicion.find(:first,
    :conditions => ["publicado=?", true],
    :order => "fecha asc" )
  end

  def self.publicados
    fecha = Time.zone.now.ago(30.hours)
    Edicion.find :all, :select=>"id, numero, fecha",:order=>"numero desc", 
    :conditions => ["publicado=? and fecha < ?", true, fecha]
  end

  #fomrato numero edicion y fecha
  def to_s
    "SE" + numero.to_s + " " + fecha.to_formatted_s(:dia_mes_anio)
  end

end
