class Ability
  include CanCan::Ability

  
  def initialize(user)
    user ||= User.new #guest user

    alias_action :course_sems, :to => :read
    alias_action :download, :to => :read
    alias_action :manage_gallery, :to => :create
    alias_action :upload_gallery, :to => :create
    
    if user.present? and user.admin?
      can :manage, :all
    elsif user.present? and user.faculty?
      can :manage, [Result]
      can :read, [Course, HowTo]
    elsif user.present? and user.student?
      can :read, [Result, Course, HowTo]
    else
      can :read, [Document]
      can :create, [Feedback]
    end

  end
end
