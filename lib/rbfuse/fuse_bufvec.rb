module RBFuse
  class FuseBufvec < FFI::Struct
    layout(
      :count, :size_t,
      :idx, :size_t,
      :off, :size_t,
      :buf, [FuseBuf, 1]
    )
  end
end

