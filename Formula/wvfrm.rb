class Wvfrm < Formula
  desc "Terminal music player with visualizers, album art, lyrics and themes"
  homepage "https://github.com/Cid-Emmerich/wvfrm"
  url "https://github.com/Cid-Emmerich/wvfrm/archive/refs/tags/v1.1.5.tar.gz"
  sha256 "d9818c648ccf8470b5e76f8c469b6a0903c7a640b082500ab1413b98e6f4d7c2"
  license "MIT"
  head "https://github.com/Cid-Emmerich/wvfrm.git", branch: "main"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper.cpp"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"wvfrm"), "./cmd/wvfrm"
  end

  test do
    assert_match "wvfrm #{version}", shell_output("#{bin}/wvfrm --version")
    assert_match "matrix", shell_output("#{bin}/wvfrm visualizers")
  end
end
