class ClientsController < ApplicationController
  def create
    # puts "\n\n\n\n\n\n\n\n\n\nHa llegado a create\n\n\n\n\n\n\n\n\n\n"
    @client = Client.new(client_params)
    @client.save
  end

  # def update
  #   @client = Client.find(params[:id])

  #   if @client.update(client_params)
  #     redirect_to admin_client_path(@client)
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @client = Client.find(params[:id])
  #   @client.destroy

  #   redirect_to admin_clients_path
  #   index
  # end

  private

    def client_params
      params.require(:client).permit(:id, :name, :address, :born_date, :gender, :email)
    end
end
