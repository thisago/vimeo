# Vimeo

This is a simple Vimeo page parser to get the video download URL

Not all data is extracted from page, but the most important is the download, later I add the missing data

## Usage

### CLI

```
$ vimeo -u "VIMEO URL" -r "Site that embed Vimeo video was (if video is restricted to a page)"
```

### Lib

```nim
import std/httpclient
import pkg/vimeo

let
  client = newHttpClient(headers = newHttpHeaders({
    "referer": "Site that embed Vimeo video was (if video is restricted to a page)"
  }))
  html = client.getContent "VIMEO URL"
  
let vimeoData = parseVimeo html 

echo vimeoData.url # shows the raw media url
```

## License

MIT
