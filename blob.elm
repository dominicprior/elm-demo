import Html exposing (Html, text, div)
import Mouse exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
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
        Mouse.moves (\{x, y} -> Position x y)
      , Time.every (second/20) Tick
    ]

-- VIEW

view: Model -> Html a
view model =
    svg [ width "600px" ]
          [ circle [ cx (toString (model.blobX)),
                     cy (toString (model.blobY)),
                     r  "10",
                     fill "#0B79CE" ] []
  ]
