defmodule HeaderTutorial do
  use GuidemeWeb, :html
  use Phoenix.Component

  def render_header_tutorial(assigns) do
    ~H"""
    <div class="flex column justifyLeft gap1">
      <div class="flex justifyCenter gap1">
        <span class="link">
          
        </span>
        <span class="link">
          
        </span>
        <span class="link">
          
        </span>
        <span>
          <input type="checkbox" />
        </span>
      </div>
      <h2>
        Please select an option below by clicking an <span class="link">orange file </span>
      </h2>
    </div>
    """
  end
end
