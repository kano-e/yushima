module Game::Graph
  Type = GraphQL::ObjectType.define do
    name 'Game'
    description 'A boardgame'

    field :id, !types.ID
    field :title_ja, !types.String
    field :title_en, types.String
    field :min_players, types.Int
    field :max_players, types.Int
    field :min_minutes, types.Int
    field :max_minutes, types.Int
    field :photo, Photo::Graph::Type
  end

  CreateMutation = GraphQL::Relay::Mutation.define do
    name 'CreateGame'

    input_field :title_ja, !types.String
    input_field :title_en, types.String
    input_field :min_players, types.Int
    input_field :max_players, types.Int
    input_field :min_minutes, types.Int
    input_field :max_minutes, types.Int

    return_field :game, Game::Graph::Type

    resolve ->(object, inputs, ctx) {
      op = Game::Create.(game: inputs.to_h, current_user: User.first)

      { game: op.model }
    }
  end
end
