#  Copyright (c) 2012-2019, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module Generic::PeopleController
  extend ActiveSupport::Concern

  included do
    # before_render_form :load_titles
    # before_render_form :load_nationalities

    self.permitted_attrs += [      
      :additional_languages,
      :advertising,
      :title,
      :ahv,
      :commissioning,
      :profession
    ]
    
    before_action :check_export_permission, only: [:index, :show, :show]
  end  
  def show
    # Check if user is trying to export and restrict for basic users
    check_export_permission
    super
  end
  private
  
  def check_export_permission
    # Prevent all exports for users without show_details permission
    export_formats = [:csv, :xlsx, :pdf, :vcf]
    if export_formats.include?(request.format.symbol)
      user_roles = current_user.roles
      user_permissions = user_roles.map(&:permissions).flatten.uniq
      allowed_only = [:group_read, :contact_data]
      is_basic_only = (user_permissions - allowed_only).empty? && user_permissions.any?
      
      if is_basic_only
        # Deny access for basic users trying to export in any format
        head :forbidden
      end
    end
  end

  # def load_titles
  #   @titles = (Person.pluck(:title).compact + %w[Dr Msc]).uniq.sort
  # end

  # def load_nationalities
  #   @nationalities = (Person.pluck(:nationality).compact + %w[Schweiz Deutschland]).uniq.sort
  # end
end

