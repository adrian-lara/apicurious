class GithubUser

  def initialize(user_name)
    @base_service ||= GithubService.new(user_name)
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
