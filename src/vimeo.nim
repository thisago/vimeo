from std/json import parseJson, JsonNode, `{}`, getStr, getInt, items

from pkg/util/forStr import between

type
  VimeoData* = ref object
    videos*: seq[VimeoVideo]
  VimeoVideo* = ref object
    mime*, profile*, url*, cdn*, quality*, id*, origin*: string
    fps*, height*, width*: int

proc getVimeoJson*(html: string): JsonNode =
  ## Get the JSON of the Vimeo page
  result = parseJson html.between("var config = ", "; if")

proc parseVimeo*(node: JsonNode): VimeoData =
  ## Parses the Vimeo page from a JSON
  new result
  for video in node{"request", "files", "progressive"}:
    var vid = new VimeoVideo
    vid.mime = video{"mime"}.getStr
    vid.profile = video{"profile"}.getStr
    vid.url = video{"url"}.getStr
    vid.cdn = video{"cdn"}.getStr
    vid.quality = video{"quality"}.getStr
    vid.id = video{"id"}.getStr
    vid.origin = video{"origin"}.getStr
    vid.fps = video{"fps"}.getInt
    vid.height = video{"height"}.getInt
    vid.width = video{"width"}.getInt
    
    result.videos.add vid

proc parseVimeo*(html: string): VimeoData =
  ## Parses the Vimeo page from HTML
  parseVimeo html.getVimeoJson

when isMainModule:
  from std/httpclient import newHttpClient, close, getContent, newHttpHeaders
  from std/json import `%*`, `%`, `$`

  proc vimeo(url: string; referer = "") =
    ## Downloads the `url` and parses it
    let client = newHttpClient(headers = newHttpHeaders({
      "referer": referer
    }))
    let html = client.getContent url

    echo %*parseVimeo html
    
  import pkg/cligen
  dispatch vimeo
  # dispatch(between, echoResult = true)
