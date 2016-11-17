MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'The mutation root of this schema'

  field :createGame, field: CreateGameMutation.field
end
