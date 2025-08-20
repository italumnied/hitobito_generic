# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

Group::Alumni.seed_once(:parent_id, name: "Alumni Exemplo Ducemus", street: "Alumni ED", country: "CH", email: "info@alumni-ed.ch") 
PhoneNumber.seed_once(:contactable_id, :contactable_type, :number, contactable_id: Group.root.id, contactable_type: "Group", number: "+41 31 111 11 11", label: :landline)
#PhoneNumber.seed_once(:contactable_id, :contactable_type, :number, contactable_id: Group.root.id, contactable_type: "Group", number: "+41 31 359 72 59", label: :fax)
SocialAccount.seed_once(:contactable_id, :contactable_type, :name, contactable_id: Group.root.id, contactable_type: "Group", name: "https://alumnni-ed.ch", label: :website)