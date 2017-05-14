-- This program is for experimenting with floating text boxes.
-- At the moment, it just shows some static text.

import Html exposing (..)
import Html.Attributes exposing (..)
import Mouse exposing (..)
--import Svg exposing (..)
--import Svg.Attributes exposing (..)
import Time exposing (Time, second)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = {
    blobX : Int
  , blobY : Int
  , mouseX : Int
  , mouseY : Int
}

init : (Model, Cmd Msg)
init = (Model 0 0 0 0, Cmd.none)

-- UPDATE

type Msg
  = Position Int Int
  | Tick Time

update: Msg -> Model -> (Model, Cmd a)
update msg model =
  case msg of
    Position x y -> ({model | mouseX = x, mouseY = y} , Cmd.none)
    Tick t ->
      ({model | blobX = (3 * model.blobX + model.mouseX) // 4,
                blobY = (3 * model.blobY + model.mouseY) // 4 },
       Cmd.none)

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Sub.batch [
      --   Mouse.moves (\{x, y} -> Position x y)
      -- , Time.every (second/20) Tick
    ]

-- VIEW

view : Model -> Html a
view model = div [] [
  f 100 100 "map" 300 "purple",
  f 204 114 ":: (a -> b) -> [a] -> [b]" 200 "black",
  f 102 160 "map _ [ ] = [ ]" 200 "black",
  f 102 205 "map f (x:xs) = f x : map f xs" 200 "black"
  ]


f : Int -> Int -> String -> Int -> String -> Html a
f x y txt n col =
  let
    txt_ = txt
  in
    span [fstyle x y n col] [text txt_]

fstyle : Int -> Int -> Int -> String -> Attribute a
fstyle x y n col =
  style [
    ("left", pix x),
    ("top", pix y),
    ("color", col),
    ("font-size", toString n ++ "%"),
    ("font-family", "arial"),
    ("position", "absolute")]

pix : Int -> String
pix n = toString n ++ "px"


-- playing around with some styles.
div1 =
    div [
      style [
        ("height", "90px"),
        ("font-family", "verdana"),
        ("color", "red"),
        ("border", "10px solid powderblue"),
        ("font-size", "300%") ] ]
    [
      Html.text "hi",
      span [
        style [
          ("border", "10px solid pink"),
          ("padding", "20px"),
          ("margin", "20px"),
          ("top", "200px"),
          ("left", "200px"),
          ("position", "absolute")] ]
      [
        Html.text "he" ],
      Html.text "ho" ]
