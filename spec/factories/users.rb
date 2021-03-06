# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                  | Type               | Attributes
# --------------------- | ------------------ | ---------------------------
# **`id`**              | `integer`          | `not null, primary key`
# **`nickname`**        | `string`           |
# **`created_at`**      | `datetime`         | `not null`
# **`updated_at`**      | `datetime`         | `not null`
# **`image_url`**       | `text`             |
# **`role`**            | `integer`          | `default("user"), not null`
# **`socialplus_uid`**  | `string`           | `not null`
#
# ### Indexes
#
# * `index_users_on_socialplus_uid`:
#     * **`socialplus_uid`**
#

FactoryGirl.define do
  factory :user do
    
  end
end
