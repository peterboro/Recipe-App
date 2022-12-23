# frozen_string_literal: true

class Devise::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
    # add your custom logic here
    flash[:notice] = "Please check your email for a confirmation link"
    super
  end

  # POST /resource/confirmation
  def create
    # add your custom logic here
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    # add your custom logic here
    super
  end

  protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    # add your custom logic here
    super(resource_name)
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    # add your custom logic here
    super(resource_name, resource)
  end
end
