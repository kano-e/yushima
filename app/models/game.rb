# ## Schema Information
#
# Table name: `games`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
# **`title_ja`**     | `string`           | `not null`
# **`title_en`**     | `string`           |
# **`min_players`**  | `integer`          |
# **`max_players`**  | `integer`          |
# **`min_minutes`**  | `integer`          |
# **`max_minutes`**  | `integer`          |
# **`photo`**        | `string`           |
# **`public_str`**   | `string`           | `not null`
#
# ### Indexes
#
# * `index_games_on_public_str` (_unique_):
#     * **`public_str`**
# * `index_games_on_title_en`:
#     * **`title_en`**
#

class Game < ApplicationRecord
  has_many :activity_comments

  attr_accessor :photo_cache

  mount_uploader :photo, PhotoUploader

  scope :default_order, -> { order(title_en: :asc, title_ja: :asc) }
end
