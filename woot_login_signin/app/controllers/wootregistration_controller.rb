class WootregistrationController < Devise::RegistrationsController

  def new
    super
    Rails.logger.debug("****** Pasando por NEW ********")
  end

  def create
    super
    Rails.logger.debug("****** Pasando por CREATE ********")
  end

end
