class GithubService

  def self.user_public_data(user_name)
    response = Faraday.get("https://api.github.com/users/#{user_name}")
    JSON.parse(response.body)
  end

  def self.full_name(user_name)
    user_public_data(user_name)["name"]
  end

  def self.image(user_name)
    user_public_data(user_name)["avatar_url"]
  end

  def self.bio(user_name)
    user_public_data(user_name)["bio"]
  end

  def self.location(user_name)
    user_public_data(user_name)["location"]
  end

  def self.blog(user_name)
    user_public_data(user_name)["blog"]
  end
end
