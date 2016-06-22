import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Markdown

-- APP
main : Program Never
main =
  Html.beginnerProgram { model = model, view = view, update = update }


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


-- UPDATE
type Msg = NoOp

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model

description : Model -> String
description model =
  model.description

-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div []
    [Markdown.toHtml [] model.description
    , Markdown.toHtml [] model.snippet
    , Markdown.toHtml [] model.tryYourself]