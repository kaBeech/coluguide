defmodule HeaderTutorial do
  use GuidemeWeb, :html
  use Phoenix.Component

  def render_header_tutorial(assigns) do
    ~H"""
    <div class="flex column justifyLeft gap1">
      <div class="flex justifyCenter gap1 textAccent">
        <p class="navTut textAccent">
          <span class="link">
            
          </span>
          <span class="hidden marginTop1">
            View a relevent external website by clicking an <span class="link">orange link </span>
          </span>
        </p>
        <p class="navTut textAccent">
          <span class="link">
            
          </span>
          <span class="hidden marginTop1">
            View an explanatory image by clicking an <span class="link">orange picture </span>
          </span>
        </p>
        <p class="navTut textAccent">
          <span class="link">
            
          </span>
          <span class="hidden marginTop1">
            Get more details by clicking an <span class="link">orange file </span>
          </span>
        </p>
        <p class="navTut textAccent">
          <span>
            <input type="checkbox" />
          </span>
          <span class="hidden marginTop1">
            Click a <input type="checkbox" /> checkbox to track your progress
          </span>
        </p>
      </div>
    </div>
    """
  end
end
