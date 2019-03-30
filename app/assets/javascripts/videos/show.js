$(document).ready(()=>{
  var options = {hls: {
    withCredentials: true,
    overrideNative: true
  }};
  
  let video = videojs("video-tag", {flash: options, html5: options})
  videojs.options.html5.nativeAudioTracks = false
  videojs.options.html5.nativeVideoTracks = false
  video.ready(()=>{
    video.play()
  })
})