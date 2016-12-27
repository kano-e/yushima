# ## Schema Information
#
# Table name: `activities`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`day`**         | `date`             | `not null`
# **`detail`**      | `string`           |
#
# ### Indexes
#
# * `index_activities_on_day` (_unique_):
#     * **`day`**
#

FactoryGirl.define do
  factory :activity do
    day "2016-09-20"
  end
end
