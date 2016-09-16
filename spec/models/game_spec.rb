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
#

require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
