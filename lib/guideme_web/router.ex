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
    live "/boilerplate-docs", BoilerplateDocsLive
    live "/guide", GuideLive
    live "/guide/:id", GuideLive
    live "/guide-example", GuideExampleLive
    live "/create", CreateGuideLive
    live "/all-guides", AllGuidesLive
    live "/make-me-admin", MakeMeAdminLive
    live "/chapters", ChaptersLive
    live "/chapters/list", ChapterLive.Index, :index
    live "/chapters/new", ChapterLive.Index, :new
    live "/chapters/:id/edit", ChapterLive.Index, :edit
    live "/chapters/:id", ChapterLive.Show, :show
    live "/chapters/:id/show/edit", ChapterLive.Show, :edit
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
