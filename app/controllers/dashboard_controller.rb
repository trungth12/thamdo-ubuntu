# encoding: utf-8

class DashboardController < ApplicationController
 
  
  before_filter :authenticate_user!
  before_filter :checkrole
  before_filter :current_ip
  before_filter :current_surveys, :only => [:index]
  before_filter :current_survey, :only => [:show]
  before_filter :current_sinhviens, :only => [:show]

  
  around_filter :catch_not_found


  def index
  	  	
  end
  
  def show
    if !@current_survey.has_questions? then 
      redirect_to root_path, :flash => {:notice => "No Question"}
      return
    end
    if @current_sinhviens and !@current_sinhviens.empty? then
      @current_sinhvien = @current_sinhviens.first    
      #flash[:success] = "Bạn đang làm bài thăm dò môn: #{@current_sinhvien.tenmon}"
      redirect_to sinhvien_path(@current_survey, @current_sinhvien) if @current_sinhvien
      return
    end
  end

  protected
  def checkrole
	if current_user.masinhvien.empty? then
		@current_surveys = []
		render :action => index
	end
  end
  def current_ip
  	@current_ip = request.remote_ip || request.env['HTTP_X_FORWARDED_FOR']  || "127.0.0.1"
  end
  def current_surveys
    @current_surveys ||= Survey.all.select {|s| s.is_voted?(current_user) == false}
  end
  helper_method :current_surveys

  def current_survey
    @current_survey ||= Survey.find(params[:id])
  end
  helper_method :current_survey

  def current_sinhviens	
		@current_sinhviens ||= Sinhvien.by_masinhvien(current_user.masinhvien).by_survey(current_survey.id).by_voted  	  		
  end
  helper_method :current_sinhviens

  def catch_not_found
  	 yield
    rescue ActiveRecord::RecordNotFound
  	 redirect_to root_url, :flash => { :error => "Record not found." }
    end
end
