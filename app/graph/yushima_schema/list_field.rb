class YushimaSchema::ListField < GraphQL::Field
  def initialize(model:, type: nil)
    self.type = (type || model::Graph::Type).to_list_type
    @model = model
    self.description = "List of #{model.name}"
    self.arguments = {
      'limit' => GraphQL::Argument.define do
        name 'limit'
        type GraphQL::INT_TYPE
        default_value 30
      end,
      'offset' => GraphQL::Argument.define do
        name 'offset'
        type GraphQL::INT_TYPE
        default_value 0
      end,
    }
  end

  def resolve(object, arguments, ctx)
    @model.default_order.
      limit(validate_limit(arguments['limit'])).
      offset(arguments['offset'])
  end

  def validate_limit(limit)
    [limit, 100].min
  end
end
