defmodule GuidemeWeb.GuideLiveTest do
  use GuidemeWeb.ConnCase

  import Phoenix.LiveViewTest
  import Guideme.GuidesFixtures

  @create_attrs %{category: "some category", icon: "some icon", short_title: "some short_title", title: "some title"}
  @update_attrs %{category: "some updated category", icon: "some updated icon", short_title: "some updated short_title", title: "some updated title"}
  @invalid_attrs %{category: nil, icon: nil, short_title: nil, title: nil}

  defp create_guide(_) do
    guide = guide_fixture()
    %{guide: guide}
  end

  describe "Index" do
    setup [:create_guide]

    test "lists all guides", %{conn: conn, guide: guide} do
      {:ok, _index_live, html} = live(conn, ~p"/guides")

      assert html =~ "Listing Guides"
      assert html =~ guide.category
    end

    test "saves new guide", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/guides")

      assert index_live |> element("a", "New Guide") |> render_click() =~
               "New Guide"

      assert_patch(index_live, ~p"/guides/new")

      assert index_live
             |> form("#guide-form", guide: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#guide-form", guide: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/guides")

      html = render(index_live)
      assert html =~ "Guide created successfully"
      assert html =~ "some category"
    end

    test "updates guide in listing", %{conn: conn, guide: guide} do
      {:ok, index_live, _html} = live(conn, ~p"/guides")

      assert index_live |> element("#guides-#{guide.id} a", "Edit") |> render_click() =~
               "Edit Guide"

      assert_patch(index_live, ~p"/guides/#{guide}/edit")

      assert index_live
             |> form("#guide-form", guide: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#guide-form", guide: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/guides")

      html = render(index_live)
      assert html =~ "Guide updated successfully"
      assert html =~ "some updated category"
    end

    test "deletes guide in listing", %{conn: conn, guide: guide} do
      {:ok, index_live, _html} = live(conn, ~p"/guides")

      assert index_live |> element("#guides-#{guide.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#guides-#{guide.id}")
    end
  end

  describe "Show" do
    setup [:create_guide]

    test "displays guide", %{conn: conn, guide: guide} do
      {:ok, _show_live, html} = live(conn, ~p"/guides/#{guide}")

      assert html =~ "Show Guide"
      assert html =~ guide.category
    end

    test "updates guide within modal", %{conn: conn, guide: guide} do
      {:ok, show_live, _html} = live(conn, ~p"/guides/#{guide}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Guide"

      assert_patch(show_live, ~p"/guides/#{guide}/show/edit")

      assert show_live
             |> form("#guide-form", guide: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#guide-form", guide: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/guides/#{guide}")

      html = render(show_live)
      assert html =~ "Guide updated successfully"
      assert html =~ "some updated category"
    end
  end
end
