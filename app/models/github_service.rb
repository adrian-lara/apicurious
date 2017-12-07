class GithubService

  attr_reader :user_basic_data

  def initialize(user)
    @conn = Faraday.new(url: "https://api.github.com/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
    @user_basic_data ||= get_public_data(user)
  end

  def full_name
    user_basic_data["name"]
  end

  def image_url
    user_basic_data["avatar_url"]
  end

  def bio
    user_basic_data["bio"]
  end

  def location
    user_basic_data["location"]
  end

  def blog_url
    user_basic_data["blog"]
  end

  private

    attr_reader :conn

    def get_public_data(user)
      response = conn.get '/user' do |req|
        req.headers['Authorization'] = "token #{user.token}"
      end
      JSON.parse(response.body)
    end
end
