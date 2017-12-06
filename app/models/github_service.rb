class GithubService

  def self.user_public_data(user_name)
    response = Faraday.get("https://api.github.com/users/#{user_name}")
    JSON.parse(response.body)
  end

  def self.full_name(user_name)
    user_public_data(user_name)["name"]
  end

end
