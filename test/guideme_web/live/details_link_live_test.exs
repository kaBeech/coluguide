defmodule GuideMeWeb.DetailsLinkLiveTest do
  use GuideMeWeb.ConnCase

  import Phoenix.LiveViewTest
  import GuideMe.StepsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_details_link(_) do
    details_link = details_link_fixture()
    %{details_link: details_link}
  end

  describe "Index" do
    setup [:create_details_link]

    test "lists all details_links", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/details_links")

      assert html =~ "Listing Details links"
    end

    test "saves new details_link", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/details_links")

      assert index_live |> element("a", "New Details link") |> render_click() =~
               "New Details link"

      assert_patch(index_live, ~p"/details_links/new")

      assert index_live
             |> form("#details_link-form", details_link: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#details_link-form", details_link: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/details_links")

      html = render(index_live)
      assert html =~ "Details link created successfully"
    end

    test "updates details_link in listing", %{conn: conn, details_link: details_link} do
      {:ok, index_live, _html} = live(conn, ~p"/details_links")

      assert index_live |> element("#details_links-#{details_link.id} a", "Edit") |> render_click() =~
               "Edit Details link"

      assert_patch(index_live, ~p"/details_links/#{details_link}/edit")

      assert index_live
             |> form("#details_link-form", details_link: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#details_link-form", details_link: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/details_links")

      html = render(index_live)
      assert html =~ "Details link updated successfully"
    end

    test "deletes details_link in listing", %{conn: conn, details_link: details_link} do
      {:ok, index_live, _html} = live(conn, ~p"/details_links")

      assert index_live |> element("#details_links-#{details_link.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#details_links-#{details_link.id}")
    end
  end

  describe "Show" do
    setup [:create_details_link]

    test "displays details_link", %{conn: conn, details_link: details_link} do
      {:ok, _show_live, html} = live(conn, ~p"/details_links/#{details_link}")

      assert html =~ "Show Details link"
    end

    test "updates details_link within modal", %{conn: conn, details_link: details_link} do
      {:ok, show_live, _html} = live(conn, ~p"/details_links/#{details_link}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Details link"

      assert_patch(show_live, ~p"/details_links/#{details_link}/show/edit")

      assert show_live
             |> form("#details_link-form", details_link: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#details_link-form", details_link: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/details_links/#{details_link}")

      html = render(show_live)
      assert html =~ "Details link updated successfully"
    end
  end
end
