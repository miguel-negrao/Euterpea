module Euterpea.IO.MUI 
  ( -- UI functions
    UISF 
  , convertToUISF       -- :: NFData b => Integer -> Int -> SF a b -> UISF a ([b], Bool)
  , Dimension           -- type Dimension = (Int, Int)
  , Rect                -- type Rect = (Point, Dimension)
  , topDown, bottomUp, leftRight, rightLeft    -- :: UISF a b -> UISF a b
  , setSize             -- :: Dimension -> UISF a b -> UISF a b
  , setLayout           -- :: Layout -> UISF a b -> UISF a b
  , pad                 -- :: (Int, Int, Int, Int) -> UISF a b -> UISF a b
  , runUI               -- :: String -> UISF () () -> IO ()
  , runUIEx             -- :: Dimension -> String -> UISF () () -> IO ()
  , time                -- :: UISF () Time
    -- Widgets
  , label               -- :: String -> UISF a a
  , displayStr          -- :: UISF String ()
  , display             -- :: Show a => UISF a ()
  , withDisplay         -- :: Show b => UISF a b -> UISF a b
  , textbox             -- :: String -> UISF String String
  , title               -- :: String -> UISF a b -> UISF a b
  , button              -- :: String -> UISF () Bool
  , stickyButton        -- :: String -> UISF () Bool
  , checkbox            -- :: String -> Bool -> UISF () Bool
  , radio               -- :: [String] -> Int -> UISF () Int
  , hSlider, vSlider    -- :: RealFrac a => (a, a) -> a -> UISF () a
  , hiSlider, viSlider  -- :: Integral a => a -> (a, a) -> a -> UISF () a
  , realtimeGraph       -- :: RealFrac a => Layout -> Time -> Color -> UISF (Time, [(a,Time)]) ()
  , histogram           -- :: RealFrac a => Layout -> UISF (Event [a]) ()
  , listbox             -- :: (Eq a, Show a) => UISF ([a], Int) Int
  , midiIn              -- :: UISF DeviceID (Event [MidiMessage])
  , midiInM             -- :: UISF [(DeviceID, Bool)] (Event [MidiMessage])
  , midiOut             -- :: UISF (DeviceID, Event [MidiMessage]) ()
  , midiOutB            -- :: UISF (DeviceID, Event [(Time, MidiMessage)]) Bool
  , midiOutM            -- :: UISF ([(DeviceID, Bool)], Event [MisiMessage]) ()
  , musicToMsgs         -- :: Bool -> [InstrumentName] -> Music1 -> [(Time, MidiMessage)]
  , selectInput, selectOutput    -- :: UISF () DeviceID
  , selectInputM, selectOutputM  -- :: UISF () [(DeviceID, Bool)]
  , canvas              -- :: Dimension -> UISF (Event Graphic) ()
  , canvas'             -- :: Layout -> (a -> Dimension -> Graphic) -> UISF (Event a) ()
  -- Widget Utilities
  , makeLayout          -- :: LayoutType -> LayoutType -> Layout
  , LayoutType (..)     -- data LayoutType = Stretchy { minSize :: Int } | Fixed { fixedSize :: Int }
  , Color (..)          -- data Color = Black | Blue | Green | Cyan | Red | Magenta | Yellow | White
  ) where

import Euterpea.IO.MUI.UIMonad
import Euterpea.IO.MUI.UISF
import Euterpea.IO.MUI.Widget
import Euterpea.IO.MUI.SOE (Color (..))
