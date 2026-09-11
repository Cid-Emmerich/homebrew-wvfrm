class Wvfrm < Formula
  desc "Terminal music player with visualizers, album art, lyrics and themes"
  homepage "https://github.com/Cid-Emmerich/wvfrm"
  url "https://github.com/Cid-Emmerich/wvfrm/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "45ba411f8e1249a1dba77136496f7dfa21c54469e6bf0d213bdf34dbd7419760"
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
