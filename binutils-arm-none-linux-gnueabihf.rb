require 'formula'
require 'shellwords'

class BinutilsArmNoneLinuxGnueabihf < Formula
  homepage 'http://www.gnu.org/software/binutils/binutils.html'
  url 'http://ftpmirror.gnu.org/binutils/binutils-2.24.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz'
  sha1 '1b2bc33003f4997d38fadaa276c1f0321329ec56'

  def install
    target='arm-none-linux-gnueabihf'
    sysroot=File.dirname(__FILE__)
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--target=#{target}",
                          "--with-sysroot=#{Shellwords.escape(sysroot)}",
                          "--disable-werror",
                          "--disable-nls", #resolves conflict with language-files with normal binutils
                          "--enable-interwork",
                          "--enable-multilib",
                          "--enable-64-bit-bfd",
                          "--enable-targets=all"
    system "make"
    system "make install"
  end
end
