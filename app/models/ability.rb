class Ability
  include CanCan::Ability

  
  def initialize(user)
    user ||= User.new #guest user

    alias_action :course_sems, :to => :read
    alias_action :download, :to => :read
    alias_action :manage_gallery, :to => :create
    alias_action :upload_gallery, :to => :create
    
    if user.admin?
      can :manage, :all
    elsif user.faculty?
      can :manage, [Result]
      can :read, [Course, HowTo,Exam,Calendar]
    elsif user.student?
      can :read, [Result, Course, HowTo,Exam,Calendar]
    else
      can :read, [Document,HowTo,Exam,Calendar]
      can :create, [Feedback]
    end

  end
end
