module ActivityComment::Graph
  Type = GraphQL::ObjectType.define do
    name 'ActivityComment'
    description 'Comment'

    field :id, !types.ID
    field :detail, !types.String
    field :game, Game::Graph::Type
    field :photo, Photo::Graph::Type
  end
end
