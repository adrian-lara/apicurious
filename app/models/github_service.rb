class GithubService

  def self.full_name(user_name)
    response = Faraday.get("https://api.github.com/users/#{user_name}")
    raw_data = JSON.parse(response.body)
    raw_data["name"]
  end

end
