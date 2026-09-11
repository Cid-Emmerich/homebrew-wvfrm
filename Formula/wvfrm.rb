class Wvfrm < Formula
  desc "Terminal music player with visualizers, album art, lyrics and themes"
  homepage "https://github.com/Cid-Emmerich/wvfrm"
  url "https://github.com/Cid-Emmerich/wvfrm/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "6cc2aafbb2b7e6b8d970d601da02fe17fba0605dc9dd028ab19eb0bf5b3a1502"
  license "MIT"
  head "https://github.com/Cid-Emmerich/wvfrm.git", branch: "main"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper-cpp"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"wvfrm"), "./cmd/wvfrm"
  end

  test do
    assert_match "wvfrm #{version}", shell_output("#{bin}/wvfrm --version")
    assert_match "matrix", shell_output("#{bin}/wvfrm visualizers")
  end
end
