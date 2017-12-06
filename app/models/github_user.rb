class GithubUser

  attr_reader :user_name

  def initialize(user_name)
    @user_name = user_name
  end

  def full_name
    GithubService.full_name(user_name)
  end

  def image_url
    GithubService.image(user_name)
  end

  def bio
    GithubService.bio(user_name)
  end

  def blog_link
    GithubService.blog(user_name)
  end
end
