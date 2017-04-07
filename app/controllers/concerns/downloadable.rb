module Downloadable extend ActiveSupport::Concern

  def send_to_user(args={})
    #send_file args[:filepath]

    send_file(File.join("#{Rails.root}/public/images", "1.pdf"))
  end

end