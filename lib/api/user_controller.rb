class UsersController < ApplicationController
  respond_to :json

  def show 
	us = User.find(:masinhvien => params[:id])
	if us == nil
		render json: {:result => 0}
	end
	sv = Sinhvien.by_masinhvien(us.masinhvien).by_voted
    if sv == nil or (sv and sv.empty?) then
		render json: {:result => 0}
	else
		render json: {:result => 1}
	end
  end
end