PhotoType = GraphQL::ObjectType.define do
  name 'Photo'
  field :url, types.String do
    argument :size, PhotoSizeEnum

    resolve ->(object, args, ctx) do
      size = args[:size] || :ss

      if object.present?
        object.url(size)
      elsif comment = object.model.activity_comments.where.not(photo: nil).first
        comment.photo.url(size)
      else
        nil
      end
    end
  end
end

PhotoSizeEnum = GraphQL::EnumType.define do
  name 'PhotoSize'
  description 'Photo size'

  value('XL', 'fit 1200x1200', value: 'll')
  value('L', 'fit 960x960', value: 'l')
  value('M', 'fit 480x480', value: 'm')
  value('SM', 'fill 480x480 square', value: 'sm')
  value('SS', 'fill 240x240 square', value: 'ss')
end
