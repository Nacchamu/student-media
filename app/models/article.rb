class Article < ApplicationRecord
  # usersテーブルとのアソシエーションです
  belongs_to :user

  # thumbnail登録時の設定です
  mount_uploader :thumbnail, ThumbnailUploader
end
