defmodule GuidemeWeb.StepImageLiveTest do
  use GuidemeWeb.ConnCase

  import Phoenix.LiveViewTest
  import Guideme.StepsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_step_image(_) do
    step_image = step_image_fixture()
    %{step_image: step_image}
  end

  describe "Index" do
    setup [:create_step_image]

    test "lists all step_images", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/step_images")

      assert html =~ "Listing Step images"
    end

    test "saves new step_image", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/step_images")

      assert index_live |> element("a", "New Step image") |> render_click() =~
               "New Step image"

      assert_patch(index_live, ~p"/step_images/new")

      assert index_live
             |> form("#step_image-form", step_image: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#step_image-form", step_image: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/step_images")

      html = render(index_live)
      assert html =~ "Step image created successfully"
    end

    test "updates step_image in listing", %{conn: conn, step_image: step_image} do
      {:ok, index_live, _html} = live(conn, ~p"/step_images")

      assert index_live |> element("#step_images-#{step_image.id} a", "Edit") |> render_click() =~
               "Edit Step image"

      assert_patch(index_live, ~p"/step_images/#{step_image}/edit")

      assert index_live
             |> form("#step_image-form", step_image: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#step_image-form", step_image: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/step_images")

      html = render(index_live)
      assert html =~ "Step image updated successfully"
    end

    test "deletes step_image in listing", %{conn: conn, step_image: step_image} do
      {:ok, index_live, _html} = live(conn, ~p"/step_images")

      assert index_live |> element("#step_images-#{step_image.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#step_images-#{step_image.id}")
    end
  end

  describe "Show" do
    setup [:create_step_image]

    test "displays step_image", %{conn: conn, step_image: step_image} do
      {:ok, _show_live, html} = live(conn, ~p"/step_images/#{step_image}")

      assert html =~ "Show Step image"
    end

    test "updates step_image within modal", %{conn: conn, step_image: step_image} do
      {:ok, show_live, _html} = live(conn, ~p"/step_images/#{step_image}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Step image"

      assert_patch(show_live, ~p"/step_images/#{step_image}/show/edit")

      assert show_live
             |> form("#step_image-form", step_image: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#step_image-form", step_image: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/step_images/#{step_image}")

      html = render(show_live)
      assert html =~ "Step image updated successfully"
    end
  end
end
