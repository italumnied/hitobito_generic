#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Group::AlumniMembers < Group::Members
  children Group::AlumniMembers

  class ActiveMember < Role::ActiveMember
  end

  self.standard_role = ActiveMember
  roles ActiveMember
end
