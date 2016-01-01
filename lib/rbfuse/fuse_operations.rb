module RBFuse
  class FuseOperations < FFI::Struct
    # https://github.com/libfuse/libfuse/blob/fuse_2_9_4/include/fuse.h#L88
    layout(
      :getattr, callback([:string, :pointer], :int),
      :readlink, callback([:string, :string, :size_t], :int),
      :getdir, callback([:string, :string, :uint], :int), # define types
      :mknod, callback([:string, :mode_t, :dev_t], :int),
      :mkdir, callback([:string, :mode_t], :int),
      :unlink, callback([:string], :int),
      :rmdir, callback([:string], :int),
      :symlink, callback([:string, :string], :int),
      :rename, callback([:string, :string], :int),
      :link, callback([:string, :string], :int),
      :chmod, callback([:string, :mode_t], :int),
      :chown, callback([:string, :uid_t, :gid_t], :int),
      :truncate, callback([:string, :off_t], :int),
      :utime, callback([:string, Utimbuf.ptr], :int),
      :open, callback([:string, FuseFileInfo.ptr], :int),
      :read, callback([:string, :pointer, :size_t, :off_t, FuseFileInfo.ptr], :int),
      :write, callback([:string, :pointer, :size_t, :off_t, FuseFileInfo.ptr], :int),
      :statfs, callback([:string, Statvfs.ptr], :int),
      :flush, callback([:string, FuseFileInfo.ptr], :int),
      :release, callback([:string, FuseFileInfo.ptr], :int),
      :fsync, callback([:string, :int, FuseFileInfo.ptr], :int),
      :setxattr, callback([:string, :string, :string, :size_t, :int], :int),
      :getxattr, callback([:string, :string, :string, :size_t], :int),
      :listxattr, callback([:string, :string, :size_t], :int),
      :removexattr, callback([:string, :string], :int),
      :opendir, callback([:string, FuseFileInfo.ptr], :int),
      :readdir, callback([:string, :pointer, :fuse_fill_dir_t, :off_t, FuseFileInfo.ptr], :int),
      :releasedir, callback([:string, FuseFileInfo.ptr], :int),
      :fsyncdir, callback([:string, :int, FuseFileInfo.ptr], :int),
      :init, callback([FuseConnInfo.ptr], :void),
      :destroy, callback([:pointer], :void),
      :access, callback([:string, :int], :int),
      :create, callback([:string, :mode_t, FuseFileInfo.ptr], :int),
      :ftruncate, callback([:string, :off_t, FuseFileInfo.ptr], :int),
      :fgetattr, callback([:string, Stat.ptr, FuseFileInfo.ptr], :int),
      # :lock, callback([:string, FuseFileInfo.ptr, :int, Flock.ptr], :int),
      :lock, callback([:string, FuseFileInfo.ptr, :int, :pointer], :int),
      # :utimens, callback([:string, Timespec.ptr], :int),
      :utimens, callback([:string, :pointer], :int),
      :bmap, callback([:string, :size_t, :uint64], :int),

      :flag_nullpath_ok, :uint, 1,
      :flag_nopath, :uint, 1,
      :flag_utime_omit_ok, :uint, 1,
      :flag_reserved, :uint, 29,

      :ioctl, callback([:string, :int, :pointer, FuseFileInfo.ptr, :uint, :pointer], :int),
      # :poll, callback([:string, FuseFileInfo.ptr, FusePollhandle.ptr, :uint], :int),
      :poll, callback([:string, FuseFileInfo.ptr, :pointer, :uint], :int),
      :write_buf, callback([:string, FuseBufvec.ptr, :off_t, FuseFileInfo.ptr], :int),
      :read_buf, callback([:string, :pointer, :size_t, :off_t, FuseFileInfo.ptr], :int),
      :flock, callback([:string, FuseFileInfo.ptr, :int], :int),
      :fallocate, callback([:string, :int, :off_t, :off_t, FuseFileInfo.ptr], :int)
    )
  end
end

