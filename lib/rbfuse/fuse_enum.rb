module RBFuse
  ENUMS = {
    fuse_buf_flags: enum(
      :fuse_buf_is_fd, (1 << 1),
      :fuse_buf_fd_seed, (1 << 2),
      :fuse_buf_fd_retry, (1 << 3)
    )
  }

  module FuseEnum
    RBFuse::ENUMS.each do |key, data|
      self.const_set(key.upcase, data)
    end
  end
end

