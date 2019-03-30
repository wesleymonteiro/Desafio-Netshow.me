$(document).ready(()=>{
  let $videoTag = $("#video-tag")
  let options = {hls: {
    overrideNative: true,
    nativeAudioTracks: false,
    nativeVideoTracks: false
  }}
  
  let video = videojs("video-tag", {flash: options, html5: options})
  video.ready(()=>{
    $.ajax({
      url: $videoTag.data("url"),
      type: "POST"
    })
  })
})