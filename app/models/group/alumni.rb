#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Group::Alumni < Group
  self.layer = true
  self.event_types = [Event, Event::Course]
  self.default_children = [Group::AlumniBoard,
    Group::AlumniContacts,
    Group::AlumniMembers]

  children Group::AlumniBoard,
    Group::AlumniMembers, Group::AlumniContacts

  class Administrator < Role
    self.permissions = [:admin, :layer_and_below_full, :impersonation]
  end

  roles Administrator
end
