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

    # Scratch
    live "/hype", HypeLive

    # Chapters
    live "/chapters/select", ChapterLive.Select

    # Chapter CRUD
    live "/chapters", ChapterLive.Index, :index
    live "/chapters/new", ChapterLive.List, :new
    live "/chapters/:id/edit", ChapterLive.Index, :edit

    live "/chapters/:id", ChapterLive.Show, :show
    live "/chapters/:id/show/edit", ChapterLive.Show, :edit

    # Guides
    live "/guide/:id", GuideLive.Guide

    # Guide CRUD
    live "/guides", GuideLive.Index, :index
    live "/guides/new", GuideLive.Index, :new
    live "/guides/:id/edit", GuideLive.Index, :edit

    live "/guides/:id", GuideLive.Show, :show
    live "/guides/:id/show/edit", GuideLive.Show, :edit

    # Step CRUD
    live "/steps", StepLive.Index, :index
    live "/steps/new", StepLive.Index, :new
    live "/steps/:id/edit", StepLive.Index, :edit

    live "/steps/:id", StepLive.Show, :show
    live "/steps/:id/show/edit", StepLive.Show, :edit

    ### Generated views temporarily here for modeling - will delete later ###

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
