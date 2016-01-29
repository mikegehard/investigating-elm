module Main where

import StartApp.Simple
import Signal exposing (Signal)
import Html exposing (Html, Attribute)
import Html.Attributes exposing (..)

-- Elm StartApp boilerplate
main : Signal Html
main =
  StartApp.Simple.start { model = initialModel, update = update, view = view }


-- Model
type alias Model = Board

type alias Board = List Row

type alias Row = List Tile

type alias Tile = Int


initialModel : Model
initialModel =
  [
    [0, 1 ,2]
    , [3, 4, 5]
    , [6, 7, 8]
  ]

-- Update
type Action = NoOp


update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  let
    displayTile tile =
      Html.td
        [class "tile"]
        [tile |> toString |> Html.text]

    displayRow row =
      Html.tr
        []
        (List.map displayTile row)
  in
    Html.table
      []
      (List.map displayRow model)
