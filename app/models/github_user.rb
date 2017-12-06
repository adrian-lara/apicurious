class GithubUser

  attr_reader :user_name

  def initialize(user_name)
    @user_name = user_name
  end

  def full_name
    GithubService.full_name(user_name)
  end

end
