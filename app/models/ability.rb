class Ability
  include CanCan::Ability

  
  def initialize(user)
    alias_action :course_sems, :to => :read
    
    if user.present? and user.admin?
      can :manage, :all
    elsif user.present? and user.faculty?
      can :manage, [Result]
      can :read, [Course]
    elsif user.present? and user.student?
      can :read, [Result, Course]
    end

  end
end
