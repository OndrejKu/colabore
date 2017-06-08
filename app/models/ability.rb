class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user
      can :read, Volunteer
      can :read, Organization
      can :manage, Volunteer, user_id: user.id
      can :manage, Organization, user_id: user.id
    end
  end
end