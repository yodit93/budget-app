class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, :all, author_id: user.id
  end
end
