import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.ManageHook
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageHelpers
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Layout.SimplestFloat (simplestFloat)

myTerm :: String
myTerm = "kitty"

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom &"
    spawnOnce "gentoo-pipewire-launcher &"
    spawnOnce "xset m 0 0 &"
    spawnOnce "feh --bg-scale $HOME/backgrounds/road-96.png &"
    spawnOnce "trayer --edge top --align right --width 10 --transparent true --alpha 0 --tint 0x232323 --height 17 &"

myLayoutHook = tiled ||| Full ||| float
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1/2
        delta   = 3/100
        float   = simplestFloat

myManageHook :: ManageHook
myManageHook = composeAll [ className =? "Gimp" --> doFloat
                          , isDialog            --> doFloat
                          ]

myKeys :: [(String, X ())]
myKeys = [ ("M-<Return>", spawn "rofi -show drun")
         , ("M-S-l", spawn "i3lock")
         , ("M-f", spawn "flameshot gui")
         , ("M-S-f", withFocused toggleFloat)
         ]

defaults = def { terminal    = myTerm
               , modMask     = mod4Mask
               , startupHook = myStartupHook
               , layoutHook  = myLayoutHook
               , manageHook  = myManageHook
               }

main :: IO ()
main = do
    xmonad $ ewmhFullscreen
           $ ewmh
           $ xmobarProp
           $ defaults
           `additionalKeysP` myKeys

toggleFloat :: Window -> X ()
toggleFloat w =
  windows
    ( \s ->
        if M.member w (W.floating s)
          then W.sink w s
          else W.float w (W.RationalRect (1 / 3) (1 / 4) (1 / 2) (1 / 2)) s
    )
