module RBFuse
  class Stat < FFI::Struct

    # http://man7.org/linux/man-pages/man2/stat.2.html
    layout(
      :st_dev, :dev_t,
      :st_mode, :mode_t,
      :st_nlink, :nlink_t,
      :st_ino, :ino_t,
      :st_uid, :uid_t,
      :st_gid, :gid_t,
      :st_rdev, :dev_t,
      :st_atimespec, RBFuse::Timespec,
      :st_mtimespec, RBFuse::Timespec,
      :st_ctimespec, RBFuse::Timespec,
      :st_birthtimespec, RBFuse::Timespec,
      :st_size, :off_t,
      :st_blocks, :blkcnt_t,
      :st_blksize, :blksize_t,
      :st_flags, :uint32_t,
      :st_gen, :uint32_t
      # :st_lspare, :int32_t,
      # :st_qspare, [:int64_t, 2]
    )

    # https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man2/unlink.2.html#//apple_ref/doc/man/2/unlink
    # st_mode bits
    S_IFMT = 0170000 # type of file
    S_IFIFO = 0010000 # named pipe (fifo)
    S_IFCHR = 0020000 # character special
    S_IFDIR = 0040000 # directory
    S_IFBLK = 0060000 # block special
    S_IFREG = 0100000 # regular
    S_IFLNK = 0120000 # symbolic link
    S_IFSOCK = 0140000 # socket
    S_IFWHT = 0160000 # whiteout
    S_ISUID = 0004000 # set user id on execution
    S_ISGID = 0002000 # set group id on execution
    S_ISVTX = 0001000 # save swapped text even after use
    S_IRUSR = 0000400 # read permission, owner
    S_IWUSR = 0000200 # write permission, owner
    S_IXUSR = 0000100 # execute/search permission, owner

    def st_atime
      self[:st_atimespec][:tv_sec]
    end

    def st_atime=(val)
      self[:st_atimespec][:tv_sec] = val
    end

    def st_mtime
      self[:st_mtimespec][:tv_sec]
    end

    def st_mtime=(val)
      self[:st_mtimespec][:tv_sec] = val
    end

    def st_ctime
      self[:st_ctimespec][:tv_sec]
    end

    def st_ctime=(val)
      self[:st_ctimespec][:tv_sec] = val
    end
  end
end
