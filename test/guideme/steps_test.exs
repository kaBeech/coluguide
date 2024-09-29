defmodule GuideMe.StepsTest do
  use GuideMe.DataCase

  alias GuideMe.Steps

  describe "steps" do
    alias GuideMe.Steps.Step

    import GuideMe.StepsFixtures

    @invalid_attrs %{full_text: nil, external_link: nil}

    test "list_steps/0 returns all steps" do
      step = step_fixture()
      assert Steps.list_steps() == [step]
    end

    test "get_step!/1 returns the step with given id" do
      step = step_fixture()
      assert Steps.get_step!(step.id) == step
    end

    test "create_step/1 with valid data creates a step" do
      valid_attrs = %{full_text: "some full_text", external_link: "some external_link"}

      assert {:ok, %Step{} = step} = Steps.create_step(valid_attrs)
      assert step.full_text == "some full_text"
      assert step.external_link == "some external_link"
    end

    test "create_step/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Steps.create_step(@invalid_attrs)
    end

    test "update_step/2 with valid data updates the step" do
      step = step_fixture()
      update_attrs = %{full_text: "some updated full_text", external_link: "some updated external_link"}

      assert {:ok, %Step{} = step} = Steps.update_step(step, update_attrs)
      assert step.full_text == "some updated full_text"
      assert step.external_link == "some updated external_link"
    end

    test "update_step/2 with invalid data returns error changeset" do
      step = step_fixture()
      assert {:error, %Ecto.Changeset{}} = Steps.update_step(step, @invalid_attrs)
      assert step == Steps.get_step!(step.id)
    end

    test "delete_step/1 deletes the step" do
      step = step_fixture()
      assert {:ok, %Step{}} = Steps.delete_step(step)
      assert_raise Ecto.NoResultsError, fn -> Steps.get_step!(step.id) end
    end

    test "change_step/1 returns a step changeset" do
      step = step_fixture()
      assert %Ecto.Changeset{} = Steps.change_step(step)
    end
  end

  describe "step_images" do
    alias GuideMe.Steps.StepImage

    import GuideMe.StepsFixtures

    @invalid_attrs %{src: nil, alt: nil}

    test "list_step_images/0 returns all step_images" do
      step_image = step_image_fixture()
      assert Steps.list_step_images() == [step_image]
    end

    test "get_step_image!/1 returns the step_image with given id" do
      step_image = step_image_fixture()
      assert Steps.get_step_image!(step_image.id) == step_image
    end

    test "create_step_image/1 with valid data creates a step_image" do
      valid_attrs = %{src: "some src", alt: "some alt"}

      assert {:ok, %StepImage{} = step_image} = Steps.create_step_image(valid_attrs)
      assert step_image.src == "some src"
      assert step_image.alt == "some alt"
    end

    test "create_step_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Steps.create_step_image(@invalid_attrs)
    end

    test "update_step_image/2 with valid data updates the step_image" do
      step_image = step_image_fixture()
      update_attrs = %{src: "some updated src", alt: "some updated alt"}

      assert {:ok, %StepImage{} = step_image} = Steps.update_step_image(step_image, update_attrs)
      assert step_image.src == "some updated src"
      assert step_image.alt == "some updated alt"
    end

    test "update_step_image/2 with invalid data returns error changeset" do
      step_image = step_image_fixture()
      assert {:error, %Ecto.Changeset{}} = Steps.update_step_image(step_image, @invalid_attrs)
      assert step_image == Steps.get_step_image!(step_image.id)
    end

    test "delete_step_image/1 deletes the step_image" do
      step_image = step_image_fixture()
      assert {:ok, %StepImage{}} = Steps.delete_step_image(step_image)
      assert_raise Ecto.NoResultsError, fn -> Steps.get_step_image!(step_image.id) end
    end

    test "change_step_image/1 returns a step_image changeset" do
      step_image = step_image_fixture()
      assert %Ecto.Changeset{} = Steps.change_step_image(step_image)
    end
  end

  describe "details_links" do
    alias GuideMe.Steps.DetailsLink

    import GuideMe.StepsFixtures

    @invalid_attrs %{}

    test "list_details_links/0 returns all details_links" do
      details_link = details_link_fixture()
      assert Steps.list_details_links() == [details_link]
    end

    test "get_details_link!/1 returns the details_link with given id" do
      details_link = details_link_fixture()
      assert Steps.get_details_link!(details_link.id) == details_link
    end

    test "create_details_link/1 with valid data creates a details_link" do
      valid_attrs = %{}

      assert {:ok, %DetailsLink{} = details_link} = Steps.create_details_link(valid_attrs)
    end

    test "create_details_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Steps.create_details_link(@invalid_attrs)
    end

    test "update_details_link/2 with valid data updates the details_link" do
      details_link = details_link_fixture()
      update_attrs = %{}

      assert {:ok, %DetailsLink{} = details_link} = Steps.update_details_link(details_link, update_attrs)
    end

    test "update_details_link/2 with invalid data returns error changeset" do
      details_link = details_link_fixture()
      assert {:error, %Ecto.Changeset{}} = Steps.update_details_link(details_link, @invalid_attrs)
      assert details_link == Steps.get_details_link!(details_link.id)
    end

    test "delete_details_link/1 deletes the details_link" do
      details_link = details_link_fixture()
      assert {:ok, %DetailsLink{}} = Steps.delete_details_link(details_link)
      assert_raise Ecto.NoResultsError, fn -> Steps.get_details_link!(details_link.id) end
    end

    test "change_details_link/1 returns a details_link changeset" do
      details_link = details_link_fixture()
      assert %Ecto.Changeset{} = Steps.change_details_link(details_link)
    end
  end
end
