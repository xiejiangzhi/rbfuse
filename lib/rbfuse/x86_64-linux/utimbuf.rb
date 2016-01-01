module RBFuse
  class Utimbuf < FFI::Struct
    # http://man7.org/linux/man-pages/man2/utime.2.html
    layout(
      :actime, :time_t,
      :modtime, :time_t
    )
  end
end

