module RBFuse
  class Statvfs < FFI::Struct

    # http://man7.org/linux/man-pages/man2/statvfs.2.html
    layout(
      :f_bsize, :ulong,
      :f_frsize, :ulong,
      :f_blocks, :fsblkcnt_t,
      :f_bfree, :fsblkcnt_t,
      :f_bavail, :fsblkcnt_t,
      :f_files, :fsblkcnt_t,
      :f_ffree, :fsblkcnt_t,
      :f_ffavail, :fsblkcnt_t,
      :f_fsid, :ulong,
      :f_flag, :ulong,
      :f_fnamemax, :ulong
    )
  end
end

