class Openmittsu < Formula
  desc "A cross-platform open source implementation and desktop client for the Threema Messenger App."
  homepage "https://github.com/blizzard4591/openMittsu"
  url "https://github.com/blizzard4591/openMittsu/archive/0.9.10.zip"
  version "0.9.10"
  sha256 "44a0973cd9d392a8c89f990e49c8a6a4e27157468c869a17e267e7852f80e799"
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
