class Openmittsu < Formula
  desc "A cross-platform open source implementation and desktop client for the Threema Messenger App."
  homepage "https://github.com/blizzard4591/openMittsu"
  url "https://github.com/blizzard4591/openMittsu/archive/0.9.11.zip"
  version "0.9.11"
  sha256 "617104cbc9b14a9338acf38b14bada15d042471f4bc554f5ae43c1313acec48c"
  head "https://github.com/blizzard4591/openMittsu.git", :using => :git, :shallow => false

  depends_on :macos => :mavericks
  depends_on "cmake"
  depends_on "libsodium"
  depends_on "qt5"
  depends_on "qrencode"
  depends_on "spdlog"
  depends_on "blizzard4591/homebrew-qt5-sqlcipher/qt5sqlcipher"

  needs :cxx11
  
  def install
    args = %w[
      -DOPENMITTSU_DEBUG=OFF
      -DCMAKE_BUILD_TYPE=RELEASE
    ]

    mktemp do
      system "cmake", buildpath, *(std_cmake_args + args)
      system "make", "install"
    end
  end

  test do
    shell_output("#{bin}/openMittsuTests", 1)
  end
end
