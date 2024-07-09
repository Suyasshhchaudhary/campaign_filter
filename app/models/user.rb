class User < ApplicationRecord
  def self.filter_users_by_campaign_names(campaign_names)
    where(campaign_names.map do |name|
      "JSON_CONTAINS(campaigns_list, '{\"campaign_name\": \"#{name}\"}')"
    end.join(' or '))
  end
end

class User < ApplicationRecord
  def self.filter_users_by_campaign_names(campaign_names)
    return all if campaign_names.blank?

    where(campaign_names.map do |name|
      "JSON_CONTAINS(campaigns_list, '{\"campaign_name\": \"#{name}\"}')"
    end.join(' OR '))
  end
end
