module RBFuse
  class FuseFileInfo < FFI::Struct

    # https://github.com/libfuse/libfuse/blob/fuse_2_9_4/include/fuse_common.h#L45
    layout(
      :flags, :int,
      :fh_old, :ulong,
      :writepage, :int,
      :direct_io, :uint, 1,
      :keep_cache, :uint, 1,
      :flush, :uint, 1,
      :nonseekable, :uint, 1,
      :flock_release, :uint, 1,
      :padding, :uint, 27,
      :fh, :uint64,
      :lock_owner, :uint64
    )
  end
end

