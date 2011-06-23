class Nota < Article

  belongs_to :edition, :foreign_key => "edicion_id"
  
end