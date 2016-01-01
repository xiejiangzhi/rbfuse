module RBFuse
  class Stat < FFI::Struct

    # http://man7.org/linux/man-pages/man2/stat.2.html
    layout(
      :st_dev, :dev_t,
      :st_ino, :ino_t,
      :st_mode, :mode_t,
      :st_nlink, :nlink_t,
      :st_uid, :uid_t,
      :st_gid, :gid_t,
      :st_rdev, :dev_t,
      :st_size, :off_t,
      :st_blksize, :blksize_t,
      :st_blocks, :blkcnt_t,

      :st_atimespec, RBFuse::Timespec,
      :st_mtimespec, RBFuse::Timespec,
      :st_ctimespec, RBFuse::Timespec
    )

    # http://man7.org/linux/man-pages/man2/stat.2.html
    # st_mode file type
    S_IFMT = 0170000 # bit mask for the file type bit field
    S_IFSOCK = 0140000 # socket
    S_IFLNK = 0120000 # symbolic link
    S_IFREG = 0100000 # regular file
    S_IFBLK = 0060000 # block device
    S_IFDIR = 0040000 # directory
    S_IFCHR = 0020000 # character device
    S_IFIFO = 0010000 # FIFO

    # st_mode file mode
    S_ISUID = 04000 # set-user-ID bit
    S_ISGID = 02000 # set-group-ID bit (see below)
    S_ISVTX = 01000 # sticky bit (see below)
    S_IRWXU = 00700 # owner has read, write, and execute permission
    S_IRUSR = 00400 # owner has read permission
    S_IWUSR = 00200 # owner has write permission
    S_IXUSR = 00100 # owner has execute permission
    S_IRWXG = 00070 # group has read, write, and execute permission
    S_IRGRP = 00040 # group has read permission
    S_IWGRP = 00020 # group has write permission
    S_IXGRP = 00010 # group has execute permission
    S_IRWXO = 00007 # others (not in group) have read, write, and execute permission
    S_IROTH = 00004 # others have read permission
    S_IWOTH = 00002 # others have write permission
    S_IXOTH = 00001 # others have execute permission



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
