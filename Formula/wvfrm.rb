class Wvfrm < Formula
  desc "Terminal music player with visualizers, album art, lyrics and themes"
  homepage "https://github.com/Cid-Emmerich/wvfrm"
  url "https://github.com/Cid-Emmerich/wvfrm/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "00020949ef23cd1d92c7d84ab6c0f71479d791a324e268dfaf80e81d711642ec"
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
