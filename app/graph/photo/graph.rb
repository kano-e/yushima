module Photo::Graph
  Type = GraphQL::ObjectType.define do
    name 'Photo'
    field :url, types.String do
      argument :size, SizeEnum

      resolve ->(object, args, ctx) do
        size = args[:size] || :ss

        return object.url(size) if object.present?

        case object.model
        when ActivityComment
          photo = object.model.game&.photo
        when Game
          photo = object.model.activity_comments.where.not(photo: nil).first&.photo
        end

        photo.present? ? photo.url(size) : nil
      end
    end
  end

  SizeEnum = GraphQL::EnumType.define do
    name 'PhotoSize'
    description 'Photo size'

    value('XL', 'fit 1200x1200', value: 'll')
    value('L', 'fit 960x960', value: 'l')
    value('M', 'fit 480x480', value: 'm')
    value('SM', 'fill 480x480 square', value: 'sm')
    value('SS', 'fill 240x240 square', value: 'ss')
  end
end
