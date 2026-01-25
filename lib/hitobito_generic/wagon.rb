#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module HitobitoGeneric
  class Wagon < Rails::Engine
    include Wagons::Wagon

    # Set the required application version.
    app_requirement ">= 0"

    # Add a load path for this specific wagon
    # config.autoload_paths += %W( #{config.root}/lib )

    config.to_prepare do
      # extend application classes here
      Group.send :include, Group::Generic
      Person.send :include, Generic::Person

      PeopleController.send :include, Generic::PeopleController

      # Restrict show_details for users with only basic permissions
      HitobitoGeneric::AbilityExtension.apply_to(Ability)

      # Configure table displays to hide address fields for basic users
      ::TableDisplay.register_column(Person, 
                                      ::TableDisplays::PublicColumn,
                                      [:email, :company_name, :gender, :birthday, :title, 
                                       :additional_languages, :commissioning, :profession, :advertising])
    end

    initializer "hitobito_generic.add_settings" do |_app|
      Settings.add_source!(File.join(paths["config"].existent, "settings.yml"))
      Settings.reload!
    end

    def seed_fixtures
      fixtures = root.join("db", "seeds")
      ENV["NO_ENV"] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)]
    end
  end
end
