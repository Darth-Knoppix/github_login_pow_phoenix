defmodule GhLogin.MemStore do
  use Agent

  @name __MODULE__

  @doc """
  Starts a new bucket.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  """
  def get(key) do
    Agent.get(@name, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(key, value) do
    Agent.update(@name, &Map.put(&1, key, value))
  end

  def list do
    Agent.get(@name, &Map.values/1)
  end
end
