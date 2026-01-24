# frozen_string_literal: true
# encoding: utf-8

class AddProfessionToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column(:people, :profession, :string)
  end
end
