+function ($) { "use strict";

  /**
   * The zoom service
   */
  function ZoomService () {
    this._activeZoom            =
    this._initialScrollPosition =
    this._initialTouchPosition  =
    this._touchMoveListener     = null

    this._$document = $(document)
    this._$window   = $(window)
    this._$body     = $(document.body)
  }

  ZoomService.prototype.listen = function () {
    this._$body.on('click', '[data-action="zoom"]', $.proxy(this._zoom, this))
  }

  ZoomService.prototype._zoom = function (e) {
    var target = e.target

    if (!target || target.tagName != 'IMG') return

    if (e.metaKey) return window.open(e.target.src, '_blank')

    if (target.width >= (window.innerWidth - Zoom.OFFSET)) return

    this._activeZoomClose(true)

    this._activeZoom = new Zoom(target)
    this._activeZoom.zoomImage()

    // todo(fat): probably worth throttling this
    this._$window.on('scroll.zoom', $.proxy(this._scrollHandler, this))

    this._$document.on('click.zoom', $.proxy(this._clickHandler, this))
    this._$document.on('keyup.zoom', $.proxy(this._keyHandler, this))
    this._$document.on('touchstart.zoom', $.proxy(this._touchStart, this))

    e.stopPropagation()
  }

  ZoomService.prototype._activeZoomClose = function (forceDispose) {
    if (!this._activeZoom) return

    if (forceDispose) {
      this._activeZoom.dispose()
    } else {
      this._activeZoom.close()
    }

    this._$window.off('.zoom')
    this._$document.off('.zoom')

    this._activeZoom = null
  }

  ZoomService.prototype._scrollHandler = function (e) {
    if (this._initialScrollPosition === null) this._initialScrollPosition = window.scrollY
    var deltaY = this._initialScrollPosition - window.scrollY
    if (Math.abs(deltaY) >= 40) this._activeZoomClose()
  }

  ZoomService.prototype._keyHandler = function (e) {
    if (e.keyCode == 27) this._activeZoomClose()
  }

  ZoomService.prototype._clickHandler = function (e) {
    e.stopPropagation()
    e.preventDefault()
    this._activeZoomClose()
  }

  ZoomService.prototype._touchStart = function (e) {
    this._initialTouchPosition = e.touches[0].pageY
    $(e.target).on('touchmove.zoom', $.proxy(this._touchMove, this))
  }

  ZoomService.prototype._touchMove = function (e) {
    if (Math.abs(e.touches[0].pageY - this._initialTouchPosition) > 10) {
      this._activeZoomClose()
      $(e.target).off('touchmove.zoom')
    }
  }


  /**
   * The zoom object
   */
  function Zoom (img) {
    this._fullHeight      =
    this._fullWidth       =
    this._overlay         =
    this._targetImageWrap = null
    this._targetImageBg = null

    this._targetImage = img

    this._$body = $(document.body)
  }

  Zoom.OFFSET = 80
  Zoom._MAX_WIDTH = 2560
  Zoom._MAX_HEIGHT = 4096

  Zoom.prototype.zoomImage = function () {
    var img = document.createElement('img')
    img.onload = $.proxy(function () {
      this._fullHeight = Number(img.height)
      this._fullWidth = Number(img.width)
      this._zoomOriginal()
    }, this)
    img.src = this._targetImage.src
  }

  Zoom.prototype._zoomOriginal = function () {
    this._targetImageWrap           = document.createElement('div');
    this._targetImageWrap.className = 'zoom-img-wrap';

    this._targetImageBg           = document.createElement('div');
    this._targetImageBg.className = 'zoom-img-bg';

    this._targetImage.parentNode.insertBefore(this._targetImageWrap, this._targetImage,this._targetImageBg);
    this._targetImageWrap.appendChild(this._targetImage)
    this._targetImageWrap.appendChild(this._targetImageBg)

    $(this._targetImage)
      .addClass('zoom-img')
      .attr('data-action', 'zoom-out')

    this._overlay           = document.createElement('div')
    this._overlay.className = 'zoom-overlay'

    document.body.appendChild(this._overlay)

    this._calculateZoom()
    this._triggerAnimation()
  }

  Zoom.prototype._calculateZoom = function () {
    this._targetImage.offsetWidth // repaint before animating

    var originalFullImageWidth  = this._fullWidth
    var originalFullImageHeight = this._fullHeight

    var scrollTop = window.scrollY

    var maxScaleFactor = originalFullImageWidth / this._targetImage.width

    var viewportHeight = (window.innerHeight - Zoom.OFFSET)
    var viewportWidth  = (window.innerWidth - Zoom.OFFSET)

    var imageAspectRatio    = originalFullImageWidth / originalFullImageHeight
    var viewportAspectRatio = viewportWidth / viewportHeight

    if (originalFullImageWidth < viewportWidth && originalFullImageHeight < viewportHeight) {
      this._imgScaleFactor = maxScaleFactor

    } else if (imageAspectRatio < viewportAspectRatio) {
      this._imgScaleFactor = (viewportHeight / originalFullImageHeight) * maxScaleFactor

    } else {
      this._imgScaleFactor = (viewportWidth / originalFullImageWidth) * maxScaleFactor
    }
  }

  Zoom.prototype._triggerAnimation = function () {
    $(this._targetImage).css({transform: 'translate(0,100px)',width:"700px"})
    $(this._targetImageWrap).css({position:"fixed",top:0,left:0,width:"100%",height:"100%"})
    $(this._targetImageBg).css({width:"100%",height:"100%",backgroundColor:"#000",opacity:0.4});
    $('.slimScrollDiv,.scroller').css({'overflow':'initial'});

  }

  Zoom.prototype.close = function () {
    this._$body
      .removeClass('zoom-overlay-open')
      .addClass('zoom-overlay-transitioning')

    $(this._targetImage).css('transform', '')
    $(this._targetImageWrap).css('transform', '')

    $(this._targetImage)
      .one($.support.transition.end, $.proxy(this.dispose, this))
      .emulateTransitionEnd(300)
  }

  Zoom.prototype.dispose = function () {
    if (this._targetImageWrap && this._targetImageWrap.parentNode) {
      $(this._targetImage)
        .removeClass('zoom-img')
        .attr('data-action', 'zoom')
      $('.scroller,slimScrollDiv').css({'overflow':'hidden'});

      this._targetImageWrap.parentNode.replaceChild(this._targetImage, this._targetImageWrap,this._targetImageBg)
      this._overlay.parentNode.removeChild(this._overlay)

      this._$body.removeClass('zoom-overlay-transitioning');
      $('.x_preview').remove();
    }

  }

  new ZoomService().listen()

}(jQuery)
