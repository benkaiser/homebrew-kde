require 'formula'

class Qca < Formula
  url 'http://delta.affinix.com/download/qca/2.0/qca-2.0.3.tar.bz2'
  homepage 'http://delta.affinix.com/qca/'
  md5 'fc15bd4da22b8096c51fcfe52d2fa309'
  sha1 '9c868b05b81dce172c41b813de4de68554154c60'

  depends_on 'qt'

  # Fix for clang adhering strictly to standard, see http://clang.llvm.org/compatibility.html#dep_lookup_bases
  # See upstream report: https://bugs.kde.org/show_bug.cgi?id=307470
  def patches
    {:p3 =>
      'http://websvn.kde.org/trunk/kdesupport/qca/src/botantools/botan/botan/secmem.h?r1=1273508&r2=1273507&pathrev=1273508&view=patch'
    }
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-tests"
    system "make install"
  end
end
