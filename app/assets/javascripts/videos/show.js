$(document).ready(()=>{
  let $videoTag = $("#video-tag")
  if ($videoTag.length > 0) {
    let options = {hls: {
      overrideNative: true,
      nativeAudioTracks: false,
      nativeVideoTracks: false
    }}
    
    let video = videojs("video-tag", {flash: options, html5: options})
    video.on('play', function(){
      $.ajax({
        url: $videoTag.data("url"),
        type: "POST"
      })
    })
  
    $(document).on('turbolinks:load', ()=>{
      video = videojs("video-tag")
    })
    $(document).on('turbolinks:before-visit', ()=>{
      video = videojs("video-tag")
      video.dispose()
    })
  }
})
