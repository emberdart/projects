{-# LANGUAGE Safe                  #-}
{-# LANGUAGE TemplateHaskellQuotes #-}
{-# OPTIONS_GHC -Wno-unsafe -Wno-safe #-}

module RuntimeTypes where

import Data.Proxy
import Language.Haskell.TH.QuasiQuoter

gen ∷ Proxy a → Proxy b → Q [Dec]
gen _ _ = [d|
    data MyType = AString String | AnInt Int
    data MyType2 a b = ATuple a | AThingy b

    data Record = Record {
        field :: MyType,
        field2 :: MyType2 Int String
    }
    |]
