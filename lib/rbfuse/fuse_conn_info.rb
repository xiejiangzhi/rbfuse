module RBFuse
  class FuseConnInfo < FFI::Struct

    # https://github.com/libfuse/libfuse/blob/fuse_2_9_4/include/fuse_common.h#L140
    layout(
      :proto_major, :uint,
      :proto_minor, :uint,
      :async_read, :uint,
      :max_write, :uint,
      :max_readahead, :uint,
      :capable, :uint,
      :want, :uint,
      :max_background, :uint,
      :congestion_threshold, :uint,
      :reserved, [:uint, 23]
    )
  end
end

