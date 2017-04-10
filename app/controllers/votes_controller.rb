class VotesController < ApplicationController
  def action
    aviso = ""
    response = params[:response]
    client_id = response[:id]
    item_id = params[:item_id]
    action = params[:button]
    today = Time.now.strftime("%Y-%m-%d")
    if Client.exists?(client_id)
      if Vote.where(client_id: client_id, item_id: item_id, date: today).exists?
        item = Item.find(item_id)
        case action
        when "like"
          # Delete the vote and show prompt
          if Vote.where(client_id: client_id, item_id: item_id, date: today, aviso: true).exists?
            aviso = "Vote deleted successfully!\nYou WILL NOT be noticed when the cider is bottled!"
          else
            aviso = "Vote deleted successfully!"
          end
          Vote.where(client_id: client_id, item_id: item_id, date: today).destroy_all
          item.decrement!("votes_count", 1)
        when "aviso"
          if Vote.where(client_id: client_id, item_id: item_id, date: today, aviso: true).exists?
            # Cange aviso = false and show prompt
            Vote.where(client_id: client_id, item_id: item_id).update_all(aviso: false)
            aviso = "You WILL NOT be noticed when the cider is bottled!"
          else
            # Cange aviso = true and show prompt
            Vote.where(client_id: client_id, item_id: item_id).update_all(aviso: false)
            Vote.where(client_id: client_id, item_id: item_id, date: today).first.update_attribute(:aviso, true)
            aviso = "You will be noticed when the cider is bottled!"
          end
        end
        ActionCable.server.broadcast('items_channel', id: item.id, votes: item.votes_count, user_id: client_id, aviso: aviso)
      else
        insert(item_id, client_id, today, action)
      end
    else
      name = response[:name]
      address = response[:location][:name]
      born_date = response[:birthday]
      gender = response[:gender]
      email = response[:email]
      # Create the client
      Client.create(id: client_id, name: name, address: address, born_date: born_date, gender: gender, email: email)
      insert(item_id, client_id, today, action)
    end
  end

  def insert(item_id, client_id, today, action)
    case action
    when "like"
      # Insert the vote with aviso = false and show prompt
      Vote.create(item_id: item_id, client_id: client_id, date: today, aviso: false)
      aviso = "Vote added successfully!"
    when "aviso"
      # Insert the vote with aviso = true and show prompt
      Vote.create(item_id: item_id, client_id: client_id, date: today, aviso: true)
      aviso = "Vote added successfully!\nYou will be noticed when the cider is bottled!"
    end
    item = Item.find(item_id)
    item.increment!("votes_count", 1)
    ActionCable.server.broadcast('items_channel', id: item.id, votes: item.votes_count, user_id: client_id, aviso: aviso)
  end
end
