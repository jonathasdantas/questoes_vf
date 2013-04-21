class User < ActiveRecord::Base
  attr_accessible :email, :login, :name, :token, :uid
  has_one :aluno

  def self.create_with_omniauth(auth)
    create! do |user|
      aluno = Aluno.new
      aluno.redu_id = auth["uid"]

      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.login = auth["info"]["login"]
      user.email = auth["info"]["email"]
      user.token = auth["credentials"]["token"]
      user.aluno = aluno
    end
  end
end
