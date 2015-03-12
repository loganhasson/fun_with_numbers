class SequencesController < ApplicationController
  # Before actions defined on ApplicationController
  before_action :set_sequence
  before_action :check_n
  before_action :set_n

  def show
    seq = @sequence.new(@n)
    render json: { sequence: { name: params[:sequence_name], terms: seq.sequence } }
  end
end
