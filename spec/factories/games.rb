# ## Schema Information
#
# Table name: `games`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `integer`          | `not null, primary key`
# **`created_at`**    | `datetime`         | `not null`
# **`updated_at`**    | `datetime`         | `not null`
# **`title_ja`**      | `string`           | `not null`
# **`title_en`**      | `string`           |
# **`min_players`**   | `integer`          |
# **`max_players`**   | `integer`          |
# **`min_minutes`**   | `integer`          |
# **`max_minutes`**   | `integer`          |
# **`photo`**         | `string`           |
# **`public_str`**    | `string`           | `not null`
# **`at_feedforce`**  | `boolean`          | `default(FALSE), not null`
#
# ### Indexes
#
# * `index_games_on_public_str` (_unique_):
#     * **`public_str`**
# * `index_games_on_title_en`:
#     * **`title_en`**
#

FactoryGirl.define do
  factory :game do
    
  end
end
