module Downloadable extend ActiveSupport::Concern
  def send_to_user(args = {})
    send_file args[:filepath]
  end
end