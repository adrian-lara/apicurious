class User < ApplicationRecord

  def self.return_by_omniauth(auth_data)
    user = find_or_create_by(uid: auth_data.uid)
    user.update(user_name: auth_data.info.nickname,
                token: auth_data.credentials.token
               )
    user
  end

  def full_name
    GithubService.full_name(user_name)
  end

end
