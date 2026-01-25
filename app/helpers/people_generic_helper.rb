#  Copyright (c) 2012-2019, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module PeopleGenericHelper
  def format_person_advertising(person)
    person.advertising_label
  end

  def link_to_address(person)
    # Only show address map link if user has show_details permission
    return unless can?(:show_details, person)
    
    if [person.address, person.zip_code, person.town].all?(&:present?)
      link_to(icon("map-marker-alt", class: "fa-2x"), person_address_url(person), target: "_blank",
        rel: "noopener")
    end
  end
  
  def can_export_details?
    # Check if user has show_details permission
    user_roles = current_user.roles
    user_permissions = user_roles.map(&:permissions).flatten.uniq
    allowed_only = [:group_read, :contact_data]
    is_basic_only = (user_permissions - allowed_only).empty? && user_permissions.any?
    
    !is_basic_only
  end
end

