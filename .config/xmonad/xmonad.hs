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

myTerm :: String
myTerm = "kitty"

myStartupHook :: X ()
myStartupHook = do
    -- spawnOnce "picom &"
    spawnOnce "gentoo-pipewire-launcher &"
    spawnOnce "feh --bg-scale $HOME/backgrounds/firewatch.jpg &"
    spawnOnce "trayer --edge top --align right --width 10 --transparent true --alpha 0 --tint 0x232323 --height 17 &"

myLayoutHook = tiled ||| Mirror tiled ||| Full
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1/2
        delta   = 3/100

myManageHook :: ManageHook
myManageHook = composeAll [ className =? "Gimp" --> doFloat
                          , isDialog            --> doFloat
                          ]

myKeys :: [(String, X ())]
myKeys = [ ("M-<Return>", spawn "rofi -show drun")
         , ("M-l", spawn "i3lock")
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
