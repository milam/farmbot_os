alias Farmbot.Sync.Database.Device
alias Farmbot.Sync.Database.Peripheral
alias Farmbot.Sync.Database.RegimenItem
alias Farmbot.Sync.Database.Regimen
alias Farmbot.Sync.Database.Sequence
alias Farmbot.Sync.Database.ToolBay
alias Farmbot.Sync.Database.ToolSlot
alias Farmbot.Sync.Database.Tool
alias Farmbot.Sync.Database.User

defmodule Farmbot.Sync.Helpers do
  use Amnesia
  use Device
  use Peripheral
  use RegimenItem
  use Regimen
  use Sequence
  use ToolBay
  use ToolSlot
  use Tool
  use User

  @doc """
    Gets a device by id
  """
  def get_device(find_id) do
    Amnesia.transaction do
      Device.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a peripheral by id
  """
  def get_peripheral(find_id) do
    Amnesia.transaction do
      Peripheral.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a regimen_item by id
  """
  def get_regimen_item(find_id) do
    Amnesia.transaction do
      RegimenItem.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a regimen by id
  """
  def get_regimen(find_id) do
    Amnesia.transaction do
      Regimen.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a sequence by id
  """
  def get_sequence(find_id) do
    Amnesia.transaction do
      Sequence.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a tool_bay by id
  """
  def get_tool_bay(find_id) do
    Amnesia.transaction do
      ToolBay.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a tool_slot by id
  """
  def get_tool_slot(find_id) do
    Amnesia.transaction do
      ToolSlot.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a tool by id
  """
  def get_tool(find_id) do
    Amnesia.transaction do
      Tool.where id == find_id
    end
    |> parse_selection
  end

  @doc """
    Gets a user by id
  """
  def get_user(find_id) do
    Amnesia.transaction do
      User.where id == find_id
    end
    |> parse_selection
  end

  defp parse_selection(nil), do: nil
  defp parse_selection(selection) do
    f = Amnesia.Selection.values(selection)
    if Enum.count(f) == 1 do
      List.first(f)
    else
      f
    end
  end
end
