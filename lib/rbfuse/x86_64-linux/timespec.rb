module RBFuse
  class Timespec < FFI::Struct
    layout(
      :tv_sec, :time_t,
      :tv_nsec, :long
    )
  end
end

