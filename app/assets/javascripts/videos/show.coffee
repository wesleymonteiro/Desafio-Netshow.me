$(document).ready ->
  if $("#video-tag").length > 0
    options = hls:
      overrideNative: true
      nativeAudioTracks: false
      nativeVideoTracks: false

    video = videojs('video-tag',
      flash: options
      html5: options)
    video.on 'play', ->
      if video.currentTime() == 0
        $.ajax
          url: $('#video-tag').data('url')
          type: 'POST'