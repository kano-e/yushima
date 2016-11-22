class YushimaSchema::FetchField < GraphQL::Field
  def initialize(model:, type: nil)
    self.type = type || model::Graph::Type
    @model = model
    self.description = "Find a #{model.name} by ID"
    self.arguments = {
      'id' => GraphQL::Argument.define do
        name 'id'
        type !GraphQL::INT_TYPE
        description "ID for record"
      end,
    }
  end

  def resolve(object, arguments, ctx)
    @model.find(arguments['id'])
  end
end
