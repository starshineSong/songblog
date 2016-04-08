module V1
module Entities
  class Article < Grape::Entity
    expose :title,document: {type: String,desc: '博客标题'}
    expose :text,document: {type: text,desc: '博客内容'}
  end
end
end