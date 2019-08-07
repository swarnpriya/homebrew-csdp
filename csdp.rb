require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Csdp < Formula
  homepage 'https://projects.coin-or.org/Csdp'
  url 'http://www.coin-or.org/download/source/Csdp/Csdp-6.1.1.tgz'
  version '6.1.1'
  sha256 '0558a46ac534e846bf866b76a9a44e8a854d84558efa50988ffc092f99a138b9'

  depends_on 'openblas'


  def patches
    "https://gist.github.com/raw/b7c9897279ddd4baa5f3/07d5153f4e8bc2b1231529b51f0986f4ff98d387/Csdp-6.1.1-homebrew.patch"
  end

  def install
    inreplace 'Makefile' do |s| 
      s.change_make_var! "BINDIR", bin
      s.change_make_var! "LIBDIR", lib
      s.change_make_var! "CC", "gcc"
    end

    system "make all"
    system "make install" 
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test Csdp`.
    system "false"
  end
end
