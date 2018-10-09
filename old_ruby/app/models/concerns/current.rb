module Current
  # makes current user available in models (mainly needed for invite function)
  thread_mattr_accessor :user
end