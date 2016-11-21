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

    field :activity_comments do
      type ActivityComment::Graph::Type.to_list_type
      argument :limit, types.Int
      argument :offset, types.Int

      resolve ->(object, args, ctx) do
        object.activity_comments.order(id: :desc).
          limit(args['limit'].presence || 30).offset(args['offset'].presence || 0)
      end
    end
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
      game_params = inputs.to_h
      game_params[:photo] = ctx[:file]
      op = Game::Create.(game: game_params, current_user: ctx[:current_user])

      { game: op.model }
    }
  end
end
