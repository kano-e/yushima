module YushimaSchema::Mutation
  Type = GraphQL::ObjectType.define do
    name 'Mutation'
    description 'The mutation root of this schema'

    field :createGame, field: Game::Graph::CreateMutation.field
  end
end
