# frozen_string_literal: true
# encoding: utf-8

class RemoveNationality < ActiveRecord::Migration[6.1]
  def change
    # reversible do |dir|
    #   dir.up { execute("UPDATE people SET language = COALESCE(correspondence_language, 'de')") }
    #   dir.down { execute("UPDATE people SET correspondence_language = language") }
    # end
    remove_column :people, :nationality, :string
  end
end
