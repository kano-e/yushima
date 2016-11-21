module YushimaSchema::Query
  Type = GraphQL::ObjectType.define do
    name 'Query'
    description 'The query root of this schema'

    field :games do
      type Game::Graph::Type.to_list_type
      description 'Game list'
      argument :limit, types.Int
      argument :offset, types.Int
      resolve ->(obj, args, ctx) do
        Game.order(title_en: :asc, title_ja: :asc).
          limit(args['limit'].presence || 30).offset(args['offset'].presence || 0)
      end
    end

    field :game do
      type Game::Graph::Type
      description 'Find a Game by ID'
      argument :id, !types.ID
      resolve ->(obj, args, ctx) { Game.find(args['id']) }
    end

    field :activity_comments do
      type ActivityComment::Graph::Type.to_list_type
      description 'ActivityComment list'
      argument :limit, types.Int
      argument :offset, types.Int
      resolve ->(obj, args, ctx) do
        ActivityComment.order(id: :desc).
          limit(args['limit'].presence || 30).offset(args['offset'].presence || 0)
      end
    end

    field :activity_comment do
      type ActivityComment::Graph::Type
      description 'Find a ActivityComment by ID'
      argument :id, !types.ID
      resolve ->(obj, args, ctx) { ActivityComment.find(args['id']) }
    end
  end
end
