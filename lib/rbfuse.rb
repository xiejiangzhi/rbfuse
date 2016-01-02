require "rbfuse/version"

require 'ffi'

module RBFuse
  extend FFI::Library

  if RUBY_PLATFORM =~ /^x86_64-linux/
    FUSE_LIB = 'libfuse.so.2'
    PLATFORM_NAME = "x86_64-linux"
  elsif RUBY_PLATFORM =~ /^x86_64-darwin/
    FUSE_LIB = 'libosxfuse'
    PLATFORM_NAME = "x86_64-darwin"
  else
    raise "Unsupported platform '#{RUBY_PLATFORM}'"
  end

  ffi_lib FUSE_LIB


  autoload :FuseEnum, 'rbfuse/fuse_enum'

  autoload :Stat, "rbfuse/#{PLATFORM_NAME}/stat"
  autoload :Statvfs, "rbfuse/#{PLATFORM_NAME}/statvfs"
  autoload :Utimbuf, "rbfuse/#{PLATFORM_NAME}/utimbuf"
  autoload :Timespec, "rbfuse/#{PLATFORM_NAME}/timespec"

  autoload :FuseBuf, 'rbfuse/fuse_buf'
  autoload :FuseBufvec, 'rbfuse/fuse_bufvec'
  autoload :FuseFileInfo, 'rbfuse/fuse_file_info'
  autoload :FuseConnInfo, 'rbfuse/fuse_conn_info'
  autoload :FuseOperations, 'rbfuse/fuse_operations'

  require 'rbfuse/fuse_type'


  attach_function(
    :fuse_main_real,
    [:int, :pointer, FuseOperations.ptr, :size_t, :pointer], :int
  )

  def self.fuse_main(argc, argv, fuse_operations, user_data)
    fuse_main_real(argc, argv, fuse_operations, fuse_operations.pointer.size, user_data)
  end
end

