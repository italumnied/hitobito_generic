#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module HitobitoGeneric
  module AbilityExtension
    def self.apply_to(ability_class)
      ability_class.prepend(RestrictShowDetails)
    end

    module RestrictShowDetails
      def can?(action, subject, *extra_args)
        # Prevent show_details for users with only group_read and contact_data
        if action == :show_details && subject.is_a?(Person) && user.present?
          user_permissions = user.roles.map(&:permissions).flatten.uniq
          allowed_only = [:group_read, :contact_data]
          is_basic_only = (user_permissions - allowed_only).empty? && user_permissions.any?
          
          return false if is_basic_only
        end

        super(action, subject, *extra_args)
      end
    end
  end
end

require "wagons"
# require 'your_wagon_dependencies'
require "hitobito_generic/wagon"

module HitobitoGeneric
end
