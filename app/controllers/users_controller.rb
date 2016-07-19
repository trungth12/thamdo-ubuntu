class UsersController < ApplicationController
  respond_to :json
  
  def index     
    respond_with(@users = User.all)
  end
  def show
  	us = User.where(:masinhvien => params[:id])
	if us.empty?
		render json: {:result => 0}
	else
		puts us.to_s
		user = us[0]
		sv = Sinhvien.by_masinhvien(user.masinhvien).by_voted
		if sv == nil or (sv and sv.empty?) then
			render json: {:result => 0}
		else
			render json: {:result => 1}
		end
	end
  end
end
