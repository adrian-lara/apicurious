class GithubUser

  attr_reader :user_name, :repos

  def initialize(user)
    @user_name = user.user_name
    @base_service ||= GithubService.new(user)
    @repos ||= GithubRepo.retrieve_all(user)
  end

  def full_name
    base_service.full_name
  end

  def image_url
    base_service.image_url
  end

  def location
    base_service.location
  end

  def bio
    base_service.bio
  end

  def blog_url
    base_service.blog_url
  end

  private

    attr_reader :base_service
end
