{-# LANGUAGE Safe #-}

module TH where

import Language.Haskell.TH (runIO, liftCode)
import Language.Haskell.TH.Lib (stringE)
import Language.Haskell.TH.Syntax (unsafeTExpCoerce)
import Language.Haskell.TH.QuasiQuoter
import Language.Haskell.TH.Lift

self ∷ Q Exp
self = do
    f <- runIO $ readFile "src/th.hs"
    stringE f

selfTyped :: Code Q String
selfTyped = liftCode . unsafeTExpCoerce $ do
    f <- runIO $ readFile "src/th.hs"
    stringE f

s ∷ QuasiQuoter
s = QuasiQuoter {
    quoteExp = stringE,
    quotePat = undefined,
    quoteType = undefined,
    quoteDec = undefined
}
