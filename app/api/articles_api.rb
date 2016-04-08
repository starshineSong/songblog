
class ArticlesAPI < Grape::API
  format :json

  helper do
=begin
    def ahoy
      @ahoy ||= Ahoy::Tracker.new
    end
=end

    def current_user
      token = headers['Authentication-Token']
      @current_user = User.find_by(authentication_token:token)
    rescue
      error!('401 Unauthorized',401)
    end
    def authenticate!
      error!('401 Unathorized', 401) unless current_user
    end
  end

  desc '取得文章列表',{
      header: {
          "Authtication-Token" =>{
              description: "用户Token",
              required: true
          }
      },
      :entity => Entities::Article
  }

  params do
    requires :id,tepe: String,desc:'用户ID'
  end

  get :getArticlesList do
    "hello article api"
  end

end