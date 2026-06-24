{-# LANGUAGE Unsafe #-}
{-# OPTIONS_GHC -Wno-safe -Wno-unsafe #-}

module Main (main) where

import Network.HaskellNet.SMTP

main ∷ IO ()
main = pure ()

{-

doSMTP "aspmx.l.google.com" $ \conn ->
   sendPlainTextMail "tohnet@emberdart.co.uk" "fromhnet@emberdart.co.uk" "Greetings" "Greetings!!" conn

-}
