import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Markdown
import Port exposing (..)

-- APP
main : Program Never
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model = Koan

type alias Koan =
  {description: String
  , snippet : String
  , tryYourself : String
  }
model : Model
model =
  {description = """
# About Let
The let keyword is one of the most fundamental parts of F#.
You'll use it in almost every line of F# code you write, so
let's get to know it well! (no pun intended)
  """
  , snippet = """
```fsharp
// Let Binds A Name To A Value
let x = 50
```
  """
  , tryYourself = """
Bind `y` to `20`
  """
  }

init : (Model, Cmd Msg)
init =
  (model, Cmd.none)

-- UPDATE
type Msg = NoOp | CM String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)
    CM str ->
      (model, enableCodeMirror "test")

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div []
    [Markdown.toHtml [] model.description
    , Markdown.toHtml [] model.snippet
    , Markdown.toHtml [] model.tryYourself
    , textarea [id "test", onInput CM] [text model.snippet]]