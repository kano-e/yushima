class QueriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    query_string = params[:query]
    query_variables = ensure_hash(params[:variables])
    result = YushimaSchema.execute(query_string, variables: query_variables)
    render json: result
  end

  private

  def ensure_hash(query_variables)
    return {} if query_variables.blank?
    return JSON.parse(query_variables) if query_variables.is_a?(String)
    query_variables
  end
end
