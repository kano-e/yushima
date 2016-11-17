GameType = GraphQL::ObjectType.define do
  name 'Game'
  description 'A boardgame'

  field :id, !types.ID
  field :title_ja, !types.String
  field :title_en, types.String
  field :min_players, types.Int
  field :max_players, types.Int
  field :min_minutes, types.Int
  field :max_minutes, types.Int
end
