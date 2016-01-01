module RBFuse
  callback :fuse_fill_dir_t, [:pointer, :string, Stat.ptr, :off_t], :int
end

