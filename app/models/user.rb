# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`nickname`**    | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`image_url`**   | `text`             |
# **`role`**        | `integer`          | `default(0), not null`
#

class User < ApplicationRecord
  has_many :accounts
  has_many :activity_comments
end
