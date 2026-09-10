# Homebrew tap for wvfrm

[wvfrm](https://github.com/Cid-Emmerich/wvfrm) is a terminal music player with
visualizers, album art, lyrics and themes.

```sh
brew install Cid-Emmerich/wvfrm/wvfrm
```

That installs wvfrm together with `ffmpeg` (extra audio formats) and
`whisper-cpp` (lyrics). Upgrade with `brew upgrade wvfrm`.

The formula tracks the tagged releases of the main repository; each new
version bumps the `url` and `sha256` in `Formula/wvfrm.rb`.
