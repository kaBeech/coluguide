defmodule GuidemeWeb.GuideLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guide: nil)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex textBigger justifyCenter gap1">
      <span class="link" onMouseEnter={} onMouseLeave={}>
        
      </span>
      <span class="link" onMouseEnter={} onMouseLeave={}>
        
      </span>
      <span class="link" onMouseEnter={} onMouseLeave={}>
        
      </span>
      <span>
        <input type="checkbox" onMouseEnter={} onMouseLeave={} />
      </span>
    </div>
    <h2>
      Please select an option below by clicking an <span class="link">orange file </span>
    </h2>
    """
  end

  # def render(assigns) do
  #   ~H"""
  #   <div class="flex textBigger justifyCenter gap1">
  #     <span class="link" onMouseEnter={showExternalLink} onMouseLeave={hideExternalLink}>
  #       
  #     </span>
  #     <span class="link" onMouseEnter={showImage} onMouseLeave={hideImage}>
  #       
  #     </span>
  #     <span class="link" onMouseEnter={showFile} onMouseLeave={hideFile}>
  #       
  #     </span>
  #     <span>
  #       <input type="checkbox" onMouseEnter={showCheckbox} onMouseLeave={hideCheckbox} />
  #     </span>
  #   </div>
  #   <h2>
  #     Please select an option below by clicking an <span class="link">orange file </span>
  #   </h2>
  #   """
  # end
  #
  # def hideIconWrapper(hiderFunction) do
  #   :timer.sleep(4000)
  #   hiderFunction.("true")
  # end
  #
  # def showIconWrapper(showerFunction) do
  #   setExternalLinkHidden("true")
  #   setImageHidden("true")
  #   setFileHidden("true")
  #   setCheckboxHidden("true")
  #   :timer.sleep(4000)
  #   showerFunction.("false")
  # end
  #
  # def showExternalLink do
  #   showIconWrapper(&setExternalLinkHidden/1)
  # end
  #
  # def hideExternalLink do
  #   hideIconWrapper(&setExternalLinkHidden/1)
  # end
  #
  # def showImage do
  #   showIconWrapper(&setImageHidden/1)
  # end
  #
  # def hideImage do
  #   hideIconWrapper(&setImageHidden/1)
  # end
  #
  # def showFile do
  #   showIconWrapper(&setFileHidden/1)
  # end
  #
  # def hideFile do
  #   hideIconWrapper(&setFileHidden/1)
  # end
  #
  # def showCheckbox do
  #   showIconWrapper(&setCheckboxHidden/1)
  # end
  #
  # def hideCheckbox do
  #   hideIconWrapper(&setCheckboxHidden/1)
  # end
  #
  # def setExternalLinkHidden(hidden, socket) do
  #   {:noreply, assign(socket, externalLinkHidden: hidden)}
  # end
  #
  # def setImageHidden(hidden, socket) do
  #   {:noreply, assign(socket, imageHidden: hidden)}
  # end
  #
  # def setFileHidden(hidden, socket) do
  #   {:noreply, assign(socket, fileHidden: hidden)}
  # end
  #
  # def setCheckboxHidden(hidden, socket) do
  #   {:noreply, assign(socket, checkboxHidden: hidden)}
  # end
  #
  # def handle_event("showExternalLink", _value, socket) do
  #   setExternalLinkHidden("false", socket)
  # end
  #
  # def handle_event("hideExternalLink", _value, socket) do
  #   setExternalLinkHidden("true", socket)
  # end
  #
  # def handle_event("showImage", _value, socket) do
  #   setImageHidden("false", socket)
  # end
  #
  # def handle_event("hideImage", _value, socket) do
  #   setImageHidden("true", socket)
  # end
  #
  # def handle_event("showFile", _value, socket) do
  #   setFileHidden("false", socket)
  # end
  #
  # def handle_event("hideFile", _value, socket) do
  #   setFileHidden("true", socket)
  # end
  #
  # def handle_event("showCheckbox", _value, socket) do
  #   setCheckboxHidden("false", socket)
  # end
  #
  # def handle_event("hideCheckbox", _value, socket) do
  #   setCheckboxHidden("true", socket)
  # end
  #
  # def handle_info(:timeout, socket) do
  #   setExternalLinkHidden("true", socket)
  #   setImageHidden("true", socket)
  #   setFileHidden("true", socket)
  #   setCheckboxHidden("true", socket)
  #   {:noreply, socket}
  # end
end
