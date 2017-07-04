# ## Schema Information
#
# Table name: `activity_comments`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
# **`activity_id`**  | `integer`          | `not null`
# **`game_id`**      | `integer`          |
# **`photo`**        | `string`           |
# **`detail`**       | `string`           |
# **`public_str`**   | `string`           | `not null`
# **`user_id`**      | `string`           |
# **`public`**       | `boolean`          | `default(TRUE), not null`
#
# ### Indexes
#
# * `index_activity_comments_on_activity_id`:
#     * **`activity_id`**
# * `index_activity_comments_on_game_id`:
#     * **`game_id`**
# * `index_activity_comments_on_public_str` (_unique_):
#     * **`public_str`**
# * `index_activity_comments_on_user_id`:
#     * **`user_id`**
#

require 'rails_helper'

RSpec.describe ActivityComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
