module Main exposing (..)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { game : Maybe Game
    , homeTeam : Maybe Team
    , awayTeam : Maybe Team
    , innings : List Innings
    }

type alias Innings =
    { team : Team
    , overs : List Over
    }

type alias Game =
    { overs : Int
    , innings : Int
    }

type alias Team =
    { name : String
    , abr : String
    , players : List String
    }

type alias Player =
    { name : String
    }

type alias Over =
    { balls : List Ball
    , bowling : Team
    , batting : Team
    , bowler : Player
    }

type alias Ball = 
    { ball : Int 
    , batter : Player
    , runs : Int 
    , wide : Bool
    , foul : Bool
    , wicket : Wicket 
    }

type alias Wicket = 
    { bowler : Player
    , batter : Player
    , method : WicketType
    }

type WicketType
    = Bowled 
    | Caught
    | LBW
    | RunOut
    | Stumped
    | Retired
    | Other String 

type Msg
    = LoadPage

initModel : Model
initModel =
    { game = Nothing
    , homeTeam = Nothing
    , awayTeam = Nothing
    , innings = []
    }


view : Model -> Html msg
view model =
    div []
        [ button [] [ text "-" ]
        , text "HO"
        , button [] [ text "+" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }
