class SequenceTermsController < ApplicationController
  before_action :set_sequence
  before_action :check_n
  before_action :set_n

  def show
    seq = @sequence.new(@n)
    render json: { sequence: { name: params[:sequence_name], nth_term: seq.sequence.last }}
  end
end
