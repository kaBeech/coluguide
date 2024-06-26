defmodule Guideme.GuidesTest do
  use Guideme.DataCase

  alias Guideme.Guides

  describe "guides" do
    alias Guideme.Guides.Guide

    import Guideme.GuidesFixtures

    @invalid_attrs %{title: nil, template: nil, chapter: nil, short_title: nil, icon: nil}

    test "list_guides/0 returns all guides" do
      guide = guide_fixture()
      assert Guides.list_guides() == [guide]
    end

    test "get_guide!/1 returns the guide with given id" do
      guide = guide_fixture()
      assert Guides.get_guide!(guide.id) == guide
    end

    test "create_guide/1 with valid data creates a guide" do
      valid_attrs = %{title: "some title", template: "some template", chapter: "some chapter", short_title: "some short_title", icon: "some icon"}

      assert {:ok, %Guide{} = guide} = Guides.create_guide(valid_attrs)
      assert guide.title == "some title"
      assert guide.template == "some template"
      assert guide.chapter == "some chapter"
      assert guide.short_title == "some short_title"
      assert guide.icon == "some icon"
    end

    test "create_guide/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guides.create_guide(@invalid_attrs)
    end

    test "update_guide/2 with valid data updates the guide" do
      guide = guide_fixture()
      update_attrs = %{title: "some updated title", template: "some updated template", chapter: "some updated chapter", short_title: "some updated short_title", icon: "some updated icon"}

      assert {:ok, %Guide{} = guide} = Guides.update_guide(guide, update_attrs)
      assert guide.title == "some updated title"
      assert guide.template == "some updated template"
      assert guide.chapter == "some updated chapter"
      assert guide.short_title == "some updated short_title"
      assert guide.icon == "some updated icon"
    end

    test "update_guide/2 with invalid data returns error changeset" do
      guide = guide_fixture()
      assert {:error, %Ecto.Changeset{}} = Guides.update_guide(guide, @invalid_attrs)
      assert guide == Guides.get_guide!(guide.id)
    end

    test "delete_guide/1 deletes the guide" do
      guide = guide_fixture()
      assert {:ok, %Guide{}} = Guides.delete_guide(guide)
      assert_raise Ecto.NoResultsError, fn -> Guides.get_guide!(guide.id) end
    end

    test "change_guide/1 returns a guide changeset" do
      guide = guide_fixture()
      assert %Ecto.Changeset{} = Guides.change_guide(guide)
    end
  end

  describe "templates" do
    alias Guideme.Guides.Template

    import Guideme.GuidesFixtures

    @invalid_attrs %{name: nil}

    test "list_templates/0 returns all templates" do
      template = template_fixture()
      assert Guides.list_templates() == [template]
    end

    test "get_template!/1 returns the template with given id" do
      template = template_fixture()
      assert Guides.get_template!(template.id) == template
    end

    test "create_template/1 with valid data creates a template" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Template{} = template} = Guides.create_template(valid_attrs)
      assert template.name == "some name"
    end

    test "create_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guides.create_template(@invalid_attrs)
    end

    test "update_template/2 with valid data updates the template" do
      template = template_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Template{} = template} = Guides.update_template(template, update_attrs)
      assert template.name == "some updated name"
    end

    test "update_template/2 with invalid data returns error changeset" do
      template = template_fixture()
      assert {:error, %Ecto.Changeset{}} = Guides.update_template(template, @invalid_attrs)
      assert template == Guides.get_template!(template.id)
    end

    test "delete_template/1 deletes the template" do
      template = template_fixture()
      assert {:ok, %Template{}} = Guides.delete_template(template)
      assert_raise Ecto.NoResultsError, fn -> Guides.get_template!(template.id) end
    end

    test "change_template/1 returns a template changeset" do
      template = template_fixture()
      assert %Ecto.Changeset{} = Guides.change_template(template)
    end
  end
end
