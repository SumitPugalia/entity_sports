defmodule EntitySports.Model.Player do
  @moduledoc """
  Player model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # player id
    field(:pid, :integer)
    # player name
    field(:title, :string)
    # player short name
    field(:short_name, :string)
    # player first name
    field(:first_name, :string)
    # player last name
    field(:last_name, :string)
    # player middle name
    field(:middle_name, :string)
    # player date of birth
    field(:birthdate, :date)
    # player birth place
    field(:birthplace, :string)
    # Country ISO Code
    field(:country, :string)
    # field(:primary_team,	:)	#an array of team details,
    # player logo thumbnail url
    field(:thumb_url, :string)
    # player logo url
    field(:logo_url, :string)
    # player playing role
    field(:playing_role, :string)
    # player batting style
    field(:batting_style, :string)
    # player bowling style
    field(:bowling_style, :string)
    # player fielding position
    field(:fielding_position, :string)
    # match id of last played match
    field(:recent_match, :integer)
    # timestamp of last played match
    field(:recent_appearance, :integer)
    # player fantasy salary or credit rating
    field(:fantasy_player_rating, :string)
    # player nationality
    field(:nationality, :string)
  end

  @fields [
    :pid,
    :title,
    :short_name,
    :first_name,
    :last_name,
    :middle_name,
    :birthdate,
    :birthplace,
    :country,
    :primary_team,
    :thumb_url,
    :logo_url,
    :playing_role,
    :batting_style,
    :bowling_style,
    :fielding_position,
    :recent_match,
    :recent_appearance,
    :fantasy_player_rating,
    :nationality
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
