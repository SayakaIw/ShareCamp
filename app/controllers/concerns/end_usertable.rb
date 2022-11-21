module EndUsertables
extend ActiveSupport::Concern

  def end_user
    @end_user = current_end_user
  end

end