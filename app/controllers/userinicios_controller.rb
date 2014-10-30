class UseriniciosController < ApplicationController

before_filter :login_requerido,:usuario?

  def new
  end

  def create
  end

  def destroy
  end

end
