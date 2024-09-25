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

  pipeline :editor_or_admin do
    plug GuidemeWeb.EnsureRolePlug, [:editor, :admin]
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

  live_session :default, on_mount: GuidemeWeb.InitAssigns do
    scope "/", GuidemeWeb do
      pipe_through :browser

      get("/", PageController, :home)
    end
  end

  live_session :authenticated, on_mount: {GuidemeWeb.InitAssigns, :user} do
    scope "/", GuidemeWeb do
      pipe_through [:browser, :auth]

      # Scratch
      live "/hype", HypeLive

      # Chapters
      live "/chapters/select", ChapterLive.Select

      # Guides
      live "/guide/:id", GuideLive.Guide

      pipe_through [:editor_or_admin]

      # CRUD Directory
      live "/crud", CRUDLive

      # Chapter CRUD
      live "/chapters", ChapterLive.Index, :index
      live "/chapters/new", ChapterLive.List, :new
      live "/chapters/:id/edit", ChapterLive.Index, :edit

      live "/chapters/:id", ChapterLive.Show, :show
      live "/chapters/:id/show/edit", ChapterLive.Show, :edit

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

      # Details Link CRUD
      live "/details_links", DetailsLinkLive.Index, :index
      live "/details_links/new", DetailsLinkLive.Index, :new
      live "/details_links/:id/edit", DetailsLinkLive.Index, :edit

      live "/details_links/:id", DetailsLinkLive.Show, :show
      live "/details_links/:id/show/edit", DetailsLinkLive.Show, :edit

      # Step Image CRUD
      live "/step_images", StepImageLive.Index, :index
      live "/step_images/new", StepImageLive.Index, :new
      live "/step_images/:id/edit", StepImageLive.Index, :edit

      live "/step_images/:id", StepImageLive.Show, :show
      live "/step_images/:id/show/edit", StepImageLive.Show, :edit

      # Reviewed Guide CRUD
      live "/reviewed_guides", ReviewedGuideLive.Index, :index
      live "/reviewed_guides/new", ReviewedGuideLive.Index, :new
      live "/reviewed_guides/:id/edit", ReviewedGuideLive.Index, :edit

      live "/reviewed_guides/:id", ReviewedGuideLive.Show, :show
      live "/reviewed_guides/:id/show/edit", ReviewedGuideLive.Show, :edit

      # Image CRUD
      live "/images", ImageLive.Index, :index
      live "/images/new", ImageLive.Index, :new
      live "/images/:id/edit", ImageLive.Index, :edit

      live "/images/:d", ImageLive.Show, :show
      live "/images/:id/show/edit", ImageLive.Show, :edit

      pipe_through [:admin]

      # Hacky Mix-free database seeding
      live "/seed", SeedLive
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuidemeWeb do
  #   pipe_through :api
  # end

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
