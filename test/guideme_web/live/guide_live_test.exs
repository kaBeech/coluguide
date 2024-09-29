defmodule GuideMeWeb.GuideLiveTest do
  use GuideMeWeb.ConnCase

  import Phoenix.LiveViewTest
  import GuideMe.GuidesFixtures

  @create_attrs %{template: "some template", icon: "some icon", name: "some name", title: "some title"}
  @update_attrs %{template: "some updated template", icon: "some updated icon", name: "some updated name", title: "some updated title"}
  @invalid_attrs %{template: nil, icon: nil, name: nil, title: nil}

  defp create_guide(_) do
    guide = guide_fixture()
    %{guide: guide}
  end

  describe "Index" do
    setup [:create_guide]

    test "lists all guides", %{conn: conn, guide: guide} do
      {:ok, _index_live, html} = live(conn, ~p"/guides")

      assert html =~ "Listing Guides"
      assert html =~ guide.template
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
      assert html =~ "some template"
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
      assert html =~ "some updated template"
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
      assert html =~ guide.template
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
      assert html =~ "some updated template"
    end
  end
end
