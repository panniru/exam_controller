class Ability
  include CanCan::Ability

  
  def initialize(user)
    alias_action :course_sems, :to => :read
    
    if user.admin?
      can :manage, :all
    end
  end
end
