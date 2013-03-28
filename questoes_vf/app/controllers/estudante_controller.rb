class EstudanteController < ApplicationController
  def index
  	@provas_grid = initialize_grid(Prova)
  end
end
