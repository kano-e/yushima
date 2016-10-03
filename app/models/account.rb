# ## Schema Information
#
# Table name: `accounts`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
# **`provider`**     | `string`           | `not null`
# **`uid`**          | `string`           | `not null`
# **`user_id`**      | `integer`          |
# **`credentials`**  | `json`             |
# **`info`**         | `json`             |
#
# ### Indexes
#
# * `index_accounts_on_provider_and_uid` (_unique_):
#     * **`provider`**
#     * **`uid`**
# * `index_accounts_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `accounts_belongs_to_users`:
#     * **`user_id => users.id`**
#

class Account < ApplicationRecord
  belongs_to :user
end
