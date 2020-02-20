class Openmittsu < Formula
  desc "Cross-platform open source implementation and desktop client for the Threema Messenger App"
  homepage "https://github.com/blizzard4591/openMittsu"
  url "https://github.com/blizzard4591/openMittsu/archive/0.9.14.tar.gz"
  version "0.9.14"
  sha256 "d7bf4bbe7831a06da373fb0172e00d0794ead5564eda017f8dcd8f4f055fc6a9"
  head "https://github.com/blizzard4591/openMittsu.git", :using => :git, :shallow => false

  depends_on "cmake"
  depends_on "libsodium"
  depends_on "qrencode"
  depends_on "blizzard4591/homebrew-qt5-sqlcipher/qt5-sqlcipher"
  depends_on :macos => :mavericks
  depends_on "qt"

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
