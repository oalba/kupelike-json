App.item = App.cable.subscriptions.create "ItemChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if window.fb_user == data["user_id"]
    	alert(data["aviso"])
    $("#"+data["id"]).html(data["votes"] + "<i class='fa fa-heart fa-1x' aria-hidden='true'></i>")
	
