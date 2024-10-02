defmodule ColuguideWeb.StepLiveTest do
  use ColuguideWeb.ConnCase

  import Phoenix.LiveViewTest
  import Coluguide.StepsFixtures

  @create_attrs %{external_link: "some external_link", full_text: "some full_text"}
  @update_attrs %{external_link: "some updated external_link", full_text: "some updated full_text"}
  @invalid_attrs %{external_link: nil, full_text: nil}

  defp create_step(_) do
    step = step_fixture()
    %{step: step}
  end

  describe "Index" do
    setup [:create_step]

    test "lists all steps", %{conn: conn, step: step} do
      {:ok, _index_live, html} = live(conn, ~p"/steps")

      assert html =~ "Listing Steps"
      assert html =~ step.external_link
    end

    test "saves new step", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/steps")

      assert index_live |> element("a", "New Step") |> render_click() =~
               "New Step"

      assert_patch(index_live, ~p"/steps/new")

      assert index_live
             |> form("#step-form", step: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#step-form", step: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/steps")

      html = render(index_live)
      assert html =~ "Step created successfully"
      assert html =~ "some external_link"
    end

    test "updates step in listing", %{conn: conn, step: step} do
      {:ok, index_live, _html} = live(conn, ~p"/steps")

      assert index_live |> element("#steps-#{step.id} a", "Edit") |> render_click() =~
               "Edit Step"

      assert_patch(index_live, ~p"/steps/#{step}/edit")

      assert index_live
             |> form("#step-form", step: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#step-form", step: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/steps")

      html = render(index_live)
      assert html =~ "Step updated successfully"
      assert html =~ "some updated external_link"
    end

    test "deletes step in listing", %{conn: conn, step: step} do
      {:ok, index_live, _html} = live(conn, ~p"/steps")

      assert index_live |> element("#steps-#{step.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#steps-#{step.id}")
    end
  end

  describe "Show" do
    setup [:create_step]

    test "displays step", %{conn: conn, step: step} do
      {:ok, _show_live, html} = live(conn, ~p"/steps/#{step}")

      assert html =~ "Show Step"
      assert html =~ step.external_link
    end

    test "updates step within modal", %{conn: conn, step: step} do
      {:ok, show_live, _html} = live(conn, ~p"/steps/#{step}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Step"

      assert_patch(show_live, ~p"/steps/#{step}/show/edit")

      assert show_live
             |> form("#step-form", step: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#step-form", step: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/steps/#{step}")

      html = render(show_live)
      assert html =~ "Step updated successfully"
      assert html =~ "some updated external_link"
    end
  end
end
