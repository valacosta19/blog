class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy] #o except: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    #@article = Article.find(params[:id]) como esto lo declare en el before action, show ahora puede quedar como una accion vacia pero TENGO QUE DECLARARLA
    #el id aca es un simbolo, a diferencia de en las rutas que es un comodin
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])
    @article.update(title: params[:article][:title], content: params[:article] [:content])
    #los parametros vienen de "article" que es nombre del modelo y de title que es el controlador de las vista.
    redirect_to @article
  end

  def new
    @article = Article.new 
    #crea un articulo nuevo vacio. La variable de instancia permite ser accedida desde la vista que llama a la accion new. Busca una vista "new" y va a permitir que usemos la variable
    @article.title = 'Demo' #esto llena el input con la palabra "demo"
  end

  def create #guarda lo que recibimos del formulario que muestra new
      @article = Article.create(title: params[:article][:title], content: params[:article][:content])
      # crea un nuevo registro en la tabla articulo con el titulo que me viene por parametros desde el control que esta new.html.erb. 
      render json: @article #me muestra un json de lo que me trae de la base de datos en formato json
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def find_article
    @article = Article.find(params[:id])
  end

end