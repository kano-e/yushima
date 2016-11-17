QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :game do
    type GameType
    argument :id, !types.ID
    description 'Find a Game by ID'
    resolve ->(obj, args, ctx) { Game.find(args['id']) }
  end
end
