module MessagesHelper
  def read_link(message)
    if message.sender_id == current_user.id
      if message.sender_read
        return "Mark as Un-Read"
      else
        return "Mark as Read"
      end
    end
    if message.recipient_id == current_user.id
      if message.recipient_read
        return "Mark as Un-Read"
      else
        return "Mark as Read"
      end
    end
  end
end
