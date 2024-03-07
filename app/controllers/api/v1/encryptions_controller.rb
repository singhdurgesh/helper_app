class Api::V1::EncryptionsController < ApplicationController
  protect_from_forgery with: :null_session

  def cashfree
    signature = CashfreeEncryptionService.call(client_id: params[:client_id], public_key: params[:public_key])

    render json: { signature: signature }
  end

  private

  def cashfree_params
    params.permit(:client_id, :public_key)
  end
end
