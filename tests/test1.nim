import std/unittest
from std/json import parseJson

import vimeo

const vimeoPage = """<!DOCTYPE html> <html lang="en"> <head> <meta charset="utf-8"> <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes"> <meta name="robots" content="noindex"> <title>video.mp4 from user Account on Vimeo</title> <style> body, html, .player, .fallback { overflow: hidden; width: 100%; height: 100%; margin: 0; padding: 0; background-color: transparent; } .player.loading { opacity: 0; } </style> <script> !function(){if('PerformanceLongTaskTiming' in window){var g=window.__tti={e:[]}; g.o=new PerformanceObserver(function(l){g.e=g.e.concat(l.getEntries())}); g.o.observe({entryTypes:['longtask']})}}(); </script> <!--[if IE]><script>var cacheBuster = '?' + Math.round((Math.random() * 1000) + new Date().getTime());</script><![endif]--> </head> <body> <div class="vp-placeholder"> <style> .vp-placeholder, .vp-placeholder-thumb, .vp-placeholder-thumb::before, .vp-placeholder-thumb::after { position: absolute; top: 0; bottom: 0; left: 0; right: 0; } .vp-placeholder { visibility: hidden; width: 100%; max-height: 100%; height: calc(1080 / 1920 * 100vw); max-width: calc(1920 / 1080 * 100vh); margin: auto; } .vp-placeholder-carousel { display: none; background-color: #000; position: absolute; left: 0; right: 0; bottom: -60px; height: 60px; } </style> <div class="vp-placeholder-thumb"></div> <div class="vp-placeholder-carousel"></div> <script> (function(document) { var placeholder = document.querySelector('.vp-placeholder'); var placeholderThumb = document.querySelector('.vp-placeholder-thumb'); var videoWidth = parseInt('1920'); var videoHeight = parseInt('1080'); placeholder.style.visibility = 'visible'; }(document)); </script> </div> <div id="player" class="player"></div> <script> (function(document, player) { var config = {"cdn_url":"https://f.vimeocdn.com","vimeo_api_url":"api.vimeo.com","request":{"files":{"dash":{"separate_av":true,"streams":[{"profile":165,"quality":"540p","id":"3ca5c72d-aebb-4420-8f16-86ae82e674b8","fps":29},{"profile":"d0b41bac-2bf2-4310-8113-df764d486192","quality":"240p","id":"1f84003a-9f30-4d25-913b-9e5c9d00ee38","fps":29},{"profile":164,"quality":"360p","id":"72acb323-38d0-45ad-ba8b-1ec6e3177958","fps":29},{"profile":169,"quality":"1080p","id":"5c1dae31-b3e6-4fde-8817-de65d774b38a","fps":29},{"profile":174,"quality":"720p","id":"252d62bb-6012-40d1-9fe5-2634f0aa8f67","fps":29}],"cdns":{"akfire_interconnect_quic":{"url":"https://23vod-adaptive.akamaized.net/exp=1659025580~acl=%2F276d21c0-6cfc-40f2-9427-b29b0a3d8e6e%2F%2A~hmac=d7105e75f477d613fbe4cadf7259051620ac0e15303a1f0bfc2375f5fbe5f1a0/276d21c0-6cfc-40f2-9427-b29b0a3d8e6e/sep/video/3ca5c72d,1f84003a,72acb323,5c1dae31,252d62bb/audio/656d4b9d,7acdfcc6,65573e44/master.json?query_string_ranges=1&base64_init=1","origin":"gcs","avc_url":"https://23vod-adaptive.akamaized.net/exp=1659025580~acl=%2F276d21c0-6cfc-40f2-9427-b29b0a3d8e6e%2F%2A~hmac=d7105e75f477d613fbe4cadf7259051620ac0e15303a1f0bfc2375f5fbe5f1a0/276d21c0-6cfc-40f2-9427-b29b0a3d8e6e/sep/video/3ca5c72d,1f84003a,72acb323,5c1dae31,252d62bb/audio/656d4b9d,7acdfcc6,65573e44/master.json?query_string_ranges=1&base64_init=1"},"fastly_skyfire":{"url":"https://skyfire.vimeocdn.com/1659025580-0xd5003ad7113ce428130aa5300ad00a6574b4e7a5/276d21c0-6cfc-40f2-9427-b29b0a3d8e6e/sep/video/3ca5c72d,1f84003a,72acb323,5c1dae31,252d62bb/audio/656d4b9d,7acdfcc6,65573e44/master.json?query_string_ranges=1&base64_init=1","origin":"gcs","avc_url":"https://skyfire.vimeocdn.com/1659025580-0xd5003ad7113ce428130aa5300ad00a6574b4e7a5/276d21c0-6cfc-40f2-9427-b29b0a3d8e6e/sep/video/3ca5c72d,1f84003a,72acb323,5c1dae31,252d62bb/audio/656d4b9d,7acdfcc6,65573e44/master.json?query_string_ranges=1&base64_init=1"}},"streams_avc":[{"profile":165,"quality":"540p","id":"3ca5c72d-aebb-4420-8f16-86ae82e674b8","fps":29},{"profile":"d0b41bac-2bf2-4310-8113-df764d486192","quality":"240p","id":"1f84003a-9f30-4d25-913b-9e5c9d00ee38","fps":29},{"profile":164,"quality":"360p","id":"72acb323-38d0-45ad-ba8b-1ec6e3177958","fps":29},{"profile":169,"quality":"1080p","id":"5c1dae31-b3e6-4fde-8817-de65d774b38a","fps":29},{"profile":174,"quality":"720p","id":"252d62bb-6012-40d1-9fe5-2634f0aa8f67","fps":29}],"default_cdn":"akfire_interconnect_quic"},"hls":{"separate_av":true,"default_cdn":"akfire_interconnect_quic","cdns":{"akfire_interconnect_quic":{"url":"https://23vod-adaptive.akamaized.net/...","origin":"gcs","avc_url":"https://23vod-adaptive.akamaized.net/..."},"fastly_skyfire":{"url":"https://skyfire.vimeocdn.com/...","origin":"gcs","avc_url":"https://skyfire.vimeocdn.com/..."}}},"progressive":[{"profile":"164","width":640,"mime":"video/mp4","fps":29,"url":"https://vod-progressive.akamaized.net/video.mp4","cdn":"akamai_interconnect","quality":"360p","id":"0000000-0000-0000-0000-000000000000","origin":"gcs","height":360},{"profile":"174","width":1280,"mime":"video/mp4","fps":29,"url":"https://vod-progressive.akamaized.net/video.mp4","cdn":"akamai_interconnect","quality":"720p","id":"0000000-0000-0000-0000-000000000000","origin":"gcs","height":720},{"profile":"165","width":960,"mime":"video/mp4","fps":29,"url":"https://vod-progressive.akamaized.net/video.mp4","cdn":"akamai_interconnect","quality":"540p","id":"0000000-0000-0000-0000-000000000000","origin":"gcs","height":540},{"profile":"169","width":1920,"mime":"video/mp4","fps":29,"url":"https://vod-progressive.akamaized.net/video.mp4","cdn":"akamai_interconnect","quality":"1080p","id":"0000000-0000-0000-0000-000000000000","origin":"gcs","height":1080}]},"lang":"en","sentry":{"url":"https://00000000000000000000000000000000@a000000.ingest.sentry.io/0000000","enabled":false,"debug_enabled":true,"debug_intent":0},"thumb_preview":{"url":"https://videoapi-sprites.vimeocdn.com/...","frame_width":426,"height":2640.0,"width":4686,"frame_height":240,"frames":120,"columns":11},"referrer":"https://example.com","cookie_domain":".vimeo.com","timestamp":0000000000,"gc_debug":{"bucket":"vimeo-player-debug"},"expires":3600,"client":{"ip":"127.0.0.1"},"currency":"USD","session":"00000000000000000000000000000000000000000000000000","cookie":{"volume":1.0,"captions_styles":{"fontFamily":null,"fontSize":null,"fontOpacity":null,"color":null,"windowColor":null,"edgeStyle":null,"bgColor":null,"windowOpacity":null,"bgOpacity":null},"scaling":1,"captions":null,"quality":null,"hd":0},"build":{"backend":"1.48.0","js":"4.7.2"},"urls":{"fresnel_mimir_inputs_url":"https://fresnel-events.vimeocdn.com/add/mimir_inputs","barebone_js":"https://f.vimeocdn.com/p/4.7.2/js/barebone.js","fresnel_chunk_url":"https://fresnel-events.vimeocdn.com/add/chunk_downloads","vuid_js":"https://f.vimeocdn.com/js_opt/modules/utils/vuid.min.js","three_js":"https://f.vimeocdn.com/p/external/three.rvimeo.min.js","test_imp":"https://fresnel.vimeocdn.com/add/player-test-impression","js_base":"https://f.vimeocdn.com/p/4.7.2/js/","fresnel_manifest_url":"https://fresnel-events.vimeocdn.com/add/playback_manifest","fresnel":"https://fresnel.vimeocdn.com/add/player-stats","chromeless_css":"https://f.vimeocdn.com/p/4.7.2/css/chromeless.css","player_telemetry_url":"https://player-telemetry.vimeo.com/player-events","mux_url":"https://f.vimeocdn.com/p/external/mux.js","chromeless_js":"https://f.vimeocdn.com/p/4.7.2/js/chromeless.js","js_vendor_module":"https://f.vimeocdn.com/p/4.7.2/js/vendor.module.js","js_module":"https://f.vimeocdn.com/p/4.7.2/js/player.module.js","js":"https://f.vimeocdn.com/p/4.7.2/js/player.js","css":"https://f.vimeocdn.com/p/4.7.2/css/player.css","proxy":"https://player.vimeo.com/static/proxy.html"},"signature":"00000000000000000000000000000000","flags":{"dnt":0,"preload_video":"metadata_on_hover","plays":1,"partials":1,"autohide_controls":0},"country":"US","file_codecs":{"hevc":{"hdr":[],"sdr":[],"dvh1":[]},"av1":[],"avc":["00000000-0000-0000-0000-000000000000","00000000-0000-0000-0000-000000000000","00000000-0000-0000-0000-000000000000","00000000-0000-0000-0000-000000000000","00000000-0000-0000-0000-000000000000"]},"ab_tests":{"webvr":{"track":false,"data":{},"group":false},"chromecast":{"track":false,"data":{},"group":false},"cmcd":{"track":false,"data":{},"group":false},"llhls_timeout":{"track":true,"data":{},"group":false},"stats_fresnel":{"track":false,"data":{},"group":true}}},"player_url":"player.vimeo.com","video":{"lang":null,"live_event":null,"allow_hd":1,"embed_code":"<iframe title=\"vimeo-player\"src=\"https://player.vimeo.com/video/...\"width=\"640\"height=\"360\"frameborder=\"0\"allowfullscreen><\/iframe>","default_to_hd":0,"fps":29.0,"title":"name.mp4","url":null,"privacy":"disable","owner":{"account_type":"...","name":"...","img":"https://i.vimeocdn.com/portrait/....jpg","url":"https://vimeo.com/...","img_2x":"https://i.vimeocdn.com/portrait/...jpg","id":118728337},"share_url":"https://vimeo.com/...","height":1080,"width":1920,"embed_permission":"whitelist","thumbs":{"1280":"https://i.vimeocdn.com/video/..._1280","960":"https://i.vimeocdn.com/video/..._960","640":"https://i.vimeocdn.com/video/..._640","base":"https://i.vimeocdn.com/video/..."},"version":{"current":null,"available":[{"is_current":1,"id":387537771,"file_id":3178565002}]},"spatial":0,"duration":95,"unlisted_hash":null,"id":688672816,"hd":1},"user":{"team_origin_user_id":0,"liked":0,"account_type":"none","vimeo_api_client_token":null,"vimeo_api_interaction_tokens":null,"team_id":0,"watch_later":0,"owner":0,"id":0,"mod":0,"private_mode_enabled":0,"logged_in":0},"seo":{"upload_date":"0000-00-00 00:00:00","embed_url":"https://player.vimeo.com/video/00000000?h=0000000000","description":"","thumbnail":"https://i.vimeocdn.com/video/0000000000-0000000000000000000000000000000000000000000000000000000000000000-a_000"},"embed":{"autopause":1,"playsinline":1,"settings":{"fullscreen":1,"byline":0,"like":0,"playbar":1,"title":0,"color":0,"speed":1,"watch_later":0,"share":0,"scaling":1,"spatial_compass":0,"collections":0,"portrait":0,"logo":0,"embed":1,"badge":0,"spatial_label":0,"volume":1},"color":"00adef","texttrack":"","on_site":0,"app_id":"122963","muted":0,"dnt":0,"player_id":"","api":null,"editor":false,"context":"embed.main","keyboard":1,"outro":"videos","transparent":1,"log_plays":1,"quality":null,"time":0,"loop":0,"autoplay":1},"view":1,"vimeo_url":"vimeo.com"}; if (!config.request) { return; } if (typeof config.request === 'object' && 'error' in config.request) { if ('html' in config.request) { document.documentElement.innerHTML = config.request.html.replace(/&lt;/g, '<').replace(/&gt;/g, '>'); } return; } var isIframe = (function() { try { return window.self !== window.top; } catch (e) { return true; } }()); if (!isIframe && /twitter/i.test(navigator.userAgent) && config.video.url) { window.location = config.video.url; } if (config.request.lang) { document.documentElement.setAttribute('lang', config.request.lang); } var fullscreenSupport = 'exitFullscreen' in document || 'webkitExitFullscreen' in document || 'webkitCancelFullScreen' in document || 'mozCancelFullScreen' in document || 'msExitFullscreen' in document || 'webkitEnterFullScreen' in document.createElement('video'); var inlineSvgSupport = (function() { var div = document.createElement('div'); div.innerHTML = '<svg/>'; return (div.firstChild && div.firstChild.namespaceURI) === 'http://www.w3.org/2000/svg'; }()); var windowsPhone = /MSIE 9/.test(navigator.userAgent) && /Windows Phone/.test(navigator.userAgent); var IE10 = /IE 10/.test(navigator.userAgent); var usePlayer = fullscreenSupport || IE10 || windowsPhone; var firstScript = document.getElementsByTagName('script')[0]; var script = document.createElement('script'); var jsDone = false; var playerObject = false; if (!inlineSvgSupport) { usePlayer = false; } if (!usePlayer) { var placeholder = document.querySelector('.vp-placeholder'); if (placeholder && placeholder.parentNode) { placeholder.parentNode.removeChild(placeholder); } } if (usePlayer) { player.className = 'player loading'; var startTime = new Date().getTime(); script.src = config.request.urls.js; firstScript.parentNode.insertBefore(script, firstScript); script['onreadystatechange' in script ? 'onreadystatechange' : 'onload'] = function() { if (!jsDone && (!this.readyState || this.readyState === 'loaded' || this.readyState === 'complete')) { jsDone = true; playerObject = new VimeoPlayer(player, config, cssDone || { link: link, startTime: startTime }); } }; var cssDone = false; var link = document.createElement('link'); link.rel = 'stylesheet'; link.href = config.request.urls.css + (typeof cacheBuster === 'undefined' ? '' : cacheBuster); document.getElementsByTagName('head')[0].appendChild(link); link.onload = function() { cssDone = true; }; } else { player.innerHTML = '<div class="fallback"><iframe title="vimeo-player" src="/video/688672816/fallback?js&amp;referrer=' + encodeURIComponent(config.request.referrer) + '" frameborder="0"></iframe></div>'; } if (!config.request.flags.dnt && !config.embed.dnt) { window._vuid = [ ['pid', config.request.session] ]; var vim = document.createElement('script'); vim.async = true; vim.src = config.request.urls.vuid_js; firstScript.parentNode.insertBefore(vim, firstScript); } }(document, document.getElementById('player'))); </script> </body> </html>"""
let parsed = parseVimeo vimeoPage

suite "Vimeo":
  test "Videos":
    for video in parsed.videos:
      check video.profile in ["164", "174", "165", "169"]
      check video.width in [640, 1280, 960, 1920]
      check video.mime == "video/mp4"
      check video.fps == 29
      check video.url == "https://vod-progressive.akamaized.net/video.mp4"
      check video.cdn == "akamai_interconnect"
      check video.quality in ["360p", "720p", "540p", "1080p"]
      check video.id == "0000000-0000-0000-0000-000000000000"
      check video.origin == "gcs"
      check video.height in [360, 720, 540, 1080]
