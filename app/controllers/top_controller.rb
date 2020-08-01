class TopController < ApplicationController
  def hello
  end
  def user
    @users=User.all.order(id: "DESC")
  end
end
