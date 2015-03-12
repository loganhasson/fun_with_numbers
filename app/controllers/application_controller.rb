class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_sequence
    begin
      # Turn the :sequence_name param into the appropriate constant
      @sequence = "Sequence::#{params[:sequence_name].gsub('-','_').camelize}".constantize
    rescue NameError # Will rescue from unrecognized constants
      render json: { message: "Unrecognized sequence: #{params[:sequence_name]}" }, status: 422 and return
    end
  end

  def check_n
    if !(params[:n].to_i.to_s == params[:n])
      # Only allow integers
      render json: { message: 'n must be a valid integer' }, status: 422 and return
    elsif params[:n].start_with?('-')
      # Only allow positive integers
      render json: { message: 'n must be greater than or equal to zero' }, status: 422 and return
    end
  end

  def set_n
    @n = params[:n].to_i
  end
end
