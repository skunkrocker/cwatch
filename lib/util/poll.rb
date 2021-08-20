module Poll

  def poll delay = 30
    while true
      result = yield
      return result if result
      sleep delay
    end
    msg ||= "polling failed "
    raise msg
  end

  module_function :poll
end