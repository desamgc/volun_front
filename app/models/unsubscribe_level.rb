class UnsubscribeLevel < ActiveRecord::Base

  enum kind: [:project, :user]

  def to_s
    kind_i18n
  end
  
end
