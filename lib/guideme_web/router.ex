defmodule GuidemeWeb.Router do
  use GuidemeWeb, :router
  use Pow.Phoenix.Router
  use PowAssent.Phoenix.Router

  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {GuidemeWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :auth do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :admin do
    plug GuidemeWeb.EnsureRolePlug, :admin
  end

  pipeline :editor do
    plug GuidemeWeb.EnsureRolePlug, :editor
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :skip_csrf_protection do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  scope "/" do
    pipe_through :skip_csrf_protection

    pow_assent_authorization_post_callback_routes()
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
    pow_assent_routes()
  end

  scope "/", GuidemeWeb do
    pipe_through(:browser)

    get("/", PageController, :home)

    pipe_through(:auth)
    live "/hype", HypeLive

    live "/chapters", ChapterLive.Index
    live "/chapters/new", ChapterLive.New

    live "/chapters/:id/guides/new", GuideLive.New
    live "/guides/:id", GuideLive.Show

    ### Generated views temporarily here for modeling - will delete later ###

    live "/gen/chapters/list", GenChapterLive.Index, :index
    live "/gen/chapters/new", GenChapterLive.Index, :new
    live "/gen/chapters/:id/edit", GenChapterLive.Index, :edit
    live "/gen/chapters/:id", GenChapterLive.Show, :show
    live "/gen/chapters/:id/show/edit", GenChapterLive.Show, :edit

    live "/gen/guides", GenGuideLive.Index, :index
    live "/gen/guides/new", GenGuideLive.Index, :new
    live "/gen/guides/:id/edit", GenGuideLive.Index, :edit
    live "/gen/guides/:id", GenGuideLive.Show, :show
    live "/gen/guides/:id/show/edit", GenGuideLive.Show, :edit

    live "/gen/steps", GenStepLive.Index, :index
    live "/gen/steps/new", GenStepLive.Index, :new
    live "/gen/steps/:id/edit", GenStepLive.Index, :edit

    live "/gen/steps/:id", GenStepLive.Show, :show
    live "/gen/steps/:id/show/edit", GenStepLive.Show, :edit

    live "/gen/step_images", GenStepImageLive.Index, :index
    live "/gen/step_images/new", GenStepImageLive.Index, :new
    live "/gen/step_images/:id/edit", GenStepImageLive.Index, :edit

    live "/gen/step_images/:id", GenStepImageLive.Show, :show
    live "/gen/step_images/:id/show/edit", GenStepImageLive.Show, :edit

    live "/gen/details_links", GenDetailsLinkLive.Index, :index
    live "/gen/details_links/new", GenDetailsLinkLive.Index, :new
    live "/gen/details_links/:id/edit", GenDetailsLinkLive.Index, :edit

    live "/gen/details_links/:id", GenDetailsLinkLive.Show, :show
    live "/gen/details_links/:id/show/edit", GenDetailsLinkLive.Show, :edit

    live "/gen/reviewed_guides", GenReviewedGuideLive.Index, :index
    live "/gen/reviewed_guides/new", GenReviewedGuideLive.Index, :new
    live "/gen/reviewed_guides/:id/edit", GenReviewedGuideLive.Index, :edit

    live "/gen/reviewed_guides/:id", GenReviewedGuideLive.Show, :show
    live "/gen/reviewed_guides/:id/show/edit", GenReviewedGuideLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuidemeWeb do
  #   pipe_through :api
  # end

  scope "/admin" do
    pipe_through([:browser, :auth, :admin])
  end

  scope "/editor" do
    pipe_through([:browser, :auth, :editor])
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:guideme, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: GuidemeWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
