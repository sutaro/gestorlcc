class IniciosController < ApplicationController

before_filter :login_requerido, :admin?

  def new
  end

  def create
  end

  def destroy
  end

end
