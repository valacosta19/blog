class HomeController < ApplicationController
  before_action :authenticate_user! #lo define devise. dice que si hay un usuario deja que se muestre la vista, si no la hay lo que hace es redireccionar a la autenticación
  def index
  end
end
