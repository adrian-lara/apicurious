class GithubService

  attr_reader :user_public_data

  def initialize(user_name)
    @user_public_data ||= get_public_data(user_name)
  end

  def full_name
    user_public_data["name"]
  end

  def image_url
    user_public_data["avatar_url"]
  end

  def bio
    user_public_data["bio"]
  end

  def location
    user_public_data["location"]
  end

  def blog_url
    user_public_data["blog"]
  end

  private

    def get_public_data(user_name)
      response = Faraday.get("https://api.github.com/users/#{user_name}")
      JSON.parse(response.body)
    end
end
