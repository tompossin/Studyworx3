module Mercury
  module Authentication

    def can_edit?
      authenticate_user!
    end

  end
end
