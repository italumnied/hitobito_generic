# frozen_string_literal: true
# encoding: utf-8

class AddPersonFieldsAdditional < ActiveRecord::Migration[4.2]
  def change
    add_column(:people, :ahv, :string)
    add_column(:people, :commissioning, :string)
  end
end
