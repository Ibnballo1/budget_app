# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= user.new
    can :read, Entity, public: true

    return unless user.present?
    can :read, Entity, user: user

    return unless user.admin?
    can :manage, Entity
  end
end
