# FFmpeg Strip Metadata

Two small wrapper scripts (macOS/Linux `.sh` and Windows `.bat`) that batch
strip all metadata from every `.mp4` file in the current directory using
[ffmpeg](https://ffmpeg.org/), writing cleaned copies to an output folder
without re-encoding (stream copy).

Useful for stripping embedded device/location/author metadata before sharing
or publishing video files.

## Requirements

- [ffmpeg](https://ffmpeg.org/download.html) installed and on your `PATH`
  - macOS: `brew install ffmpeg`
  - Windows: download a build and add it to `PATH`

## Usage

### macOS / Linux

```bash
cd /path/to/folder/with/mp4s
./strip_metadata.sh
```

Cleaned files are written to `./cleaned/<name>_clean.mp4`.

### Windows

```bat
cd \path\to\folder\with\mp4s
strip_metadata.bat
```

Cleaned files are written to `.\output\<name>_clean.mp4`.

## How it works

Both scripts run, for every `.mp4` in the current directory:

```bash
ffmpeg -i input.mp4 -map 0 -c copy -map_metadata -1 output.mp4
```

`-map_metadata -1` drops all metadata, and `-c copy` avoids re-encoding so it
runs fast with no quality loss.

## License

MIT — see [LICENSE](LICENSE).
