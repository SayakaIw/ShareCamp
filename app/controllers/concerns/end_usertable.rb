module EndUsertables
extend ActiveSupport::Concern

  def end_users
    @end_user = current_end_user
  end

end