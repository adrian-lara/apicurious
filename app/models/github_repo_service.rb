class GithubRepoService

  def self.retrieve_all(user)
    response = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers["Authorization"] = "token #{user.token}"
    end

    JSON.parse(response.body)
  end

end
