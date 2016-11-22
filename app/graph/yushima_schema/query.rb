module YushimaSchema::Query
  Type = GraphQL::ObjectType.define do
    name 'Query'
    description 'The query root of this schema'

    field :games, field: YushimaSchema::ListField.new(model: Game)
    field :game, field: YushimaSchema::FetchField.new(model: Game)
    field :activity_comments, field: YushimaSchema::ListField.new(model: ActivityComment)
    field :activity_comment, field: YushimaSchema::FetchField.new(model: ActivityComment)
  end
end
