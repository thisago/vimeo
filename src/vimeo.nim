from std/json import parseJson, JsonNode, `{}`, getStr, getInt, items
from std/strutils import parseInt, strip, AllChars, Digits

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

proc maxQuality*(data: VimeoData): VimeoVideo =
  ## Gets the max quality stream
  var max: tuple[quality, index: int]
  for i, vid in data.videos:
    let quality = vid.quality.strip(chars = AllChars - Digits).parseInt
    if quality > max.quality:
      max = (quality, i)
  result = data.videos[max.index]

proc get*(data: VimeoData; maxQualityFallback = true; qualities: varargs[string]): VimeoVideo =
  ## Gets the custom quality stream
  new result
  for quality in qualities:
    for vid in data.videos:
      if vid.quality == quality:
        return vid
  result = data.maxQuality

proc get*(data: VimeoData; qualities: varargs[string]): VimeoVideo =
  ## Gets the custom quality stream
  data.get(true, qualities)

when isMainModule:
  from std/httpclient import newHttpClient, close, getContent, newHttpHeaders
  from std/json import `%*`, `%`, `$`

  proc vimeo(url: string; referer = "") =
    ## Downloads the `url` and parses it
    let client = newHttpClient(headers = newHttpHeaders({
      "referer": referer
    }))
    let data = parseVimeo client.getContent url

    echo $(%*{
      "json": %*data,
      "maxQuality": data.maxQuality
    })

  import pkg/cligen
  dispatch vimeo
