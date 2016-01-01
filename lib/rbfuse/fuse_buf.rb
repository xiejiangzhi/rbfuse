module RBFuse
  class FuseBuf < FFI::Struct

    layout(
      :size, :size_t,
      :fuse_buf_flags, RBFuse::FuseEnum::FUSE_BUF_FLAGS,
      :mem, :pointer,
      :fd, :int,
      :pos, :off_t
    )
  end
end

