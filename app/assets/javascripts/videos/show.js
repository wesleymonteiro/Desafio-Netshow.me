$(document).ready(()=>{
  let $videoTag = $("#video-tag")
  if ($videoTag.length > 0) {
    $(document).on('turbolinks:load', ()=>{
      video = videojs("video-tag")
      video.on('play', ()=>{
        if (video.currentTime() == 0)
          $.ajax({
            url: $videoTag.data("url"),
            type: "POST"
          })
      })
    })
    $(document).on('turbolinks:before-visit', ()=>{
      video = videojs("video-tag")
      video.dispose()
    })
  }
})
