defmodule GuideMeWeb.ReviewedGuideLiveTest do
  use GuideMeWeb.ConnCase

  import Phoenix.LiveViewTest
  import GuideMe.ReviewRecordsFixtures

  @create_attrs %{reviewed_at: "2024-06-21"}
  @update_attrs %{reviewed_at: "2024-06-22"}
  @invalid_attrs %{reviewed_at: nil}

  defp create_reviewed_guide(_) do
    reviewed_guide = reviewed_guide_fixture()
    %{reviewed_guide: reviewed_guide}
  end

  describe "Index" do
    setup [:create_reviewed_guide]

    test "lists all reviewed_guides", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/reviewed_guides")

      assert html =~ "Listing Reviewed guides"
    end

    test "saves new reviewed_guide", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/reviewed_guides")

      assert index_live |> element("a", "New Reviewed guide") |> render_click() =~
               "New Reviewed guide"

      assert_patch(index_live, ~p"/reviewed_guides/new")

      assert index_live
             |> form("#reviewed_guide-form", reviewed_guide: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#reviewed_guide-form", reviewed_guide: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/reviewed_guides")

      html = render(index_live)
      assert html =~ "Reviewed guide created successfully"
    end

    test "updates reviewed_guide in listing", %{conn: conn, reviewed_guide: reviewed_guide} do
      {:ok, index_live, _html} = live(conn, ~p"/reviewed_guides")

      assert index_live |> element("#reviewed_guides-#{reviewed_guide.id} a", "Edit") |> render_click() =~
               "Edit Reviewed guide"

      assert_patch(index_live, ~p"/reviewed_guides/#{reviewed_guide}/edit")

      assert index_live
             |> form("#reviewed_guide-form", reviewed_guide: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#reviewed_guide-form", reviewed_guide: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/reviewed_guides")

      html = render(index_live)
      assert html =~ "Reviewed guide updated successfully"
    end

    test "deletes reviewed_guide in listing", %{conn: conn, reviewed_guide: reviewed_guide} do
      {:ok, index_live, _html} = live(conn, ~p"/reviewed_guides")

      assert index_live |> element("#reviewed_guides-#{reviewed_guide.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#reviewed_guides-#{reviewed_guide.id}")
    end
  end

  describe "Show" do
    setup [:create_reviewed_guide]

    test "displays reviewed_guide", %{conn: conn, reviewed_guide: reviewed_guide} do
      {:ok, _show_live, html} = live(conn, ~p"/reviewed_guides/#{reviewed_guide}")

      assert html =~ "Show Reviewed guide"
    end

    test "updates reviewed_guide within modal", %{conn: conn, reviewed_guide: reviewed_guide} do
      {:ok, show_live, _html} = live(conn, ~p"/reviewed_guides/#{reviewed_guide}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Reviewed guide"

      assert_patch(show_live, ~p"/reviewed_guides/#{reviewed_guide}/show/edit")

      assert show_live
             |> form("#reviewed_guide-form", reviewed_guide: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#reviewed_guide-form", reviewed_guide: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/reviewed_guides/#{reviewed_guide}")

      html = render(show_live)
      assert html =~ "Reviewed guide updated successfully"
    end
  end
end
