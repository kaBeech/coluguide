defmodule HeaderTutorial do
  use GuidemeWeb, :html
  use Phoenix.Component

  def render_header_tutorial(assigns) do
    ~H"""
    <div class="flex column justifyLeft gap1">
      <div class="flex justifyCenter gap1 textAccent navTutContainer">
        <p class="navTut textAccent">
          <span class="link">
            
          </span>
          <span class="hidden marginTop3">
            View a relevent external website by clicking an <span class="link">orange link </span>
          </span>
        </p>
        <p class="navTut textAccent">
          <span class="link">
            
          </span>
          <span class="hidden marginTop3">
            View an explanatory image by clicking an <span class="link">orange picture </span>
          </span>
        </p>
        <p class="navTut textAccent">
          <span class="link">
            
          </span>
          <span class="hidden marginTop3">
            Get more details by clicking an <span class="link">orange file </span>
          </span>
        </p>
        <p class="navTut textAccent">
          <span>
            <input type="checkbox" />
          </span>
          <span class="hidden marginTop3">
            Click a <input type="checkbox" /> checkbox to track your progress
          </span>
        </p>
        <span class="hoverHidden marginTop3 marginBottom1">
          View hints by hovering over an <span class="link">orange icon</span> above
        </span>
      </div>
    </div>
    """
  end
end
