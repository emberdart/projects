{-# OPTIONS_GHC -Wno-unused-top-binds -Wno-unsafe -Wno-safe #-}
{-# LANGUAGE Unsafe #-}

module Main where

import Control.Category
import Data.Typeable
-- import Data.Dynamic
import GHC.Read
import Prelude hiding ((.))
import Text.Read
-- import Text.Read.Lex
import Unsafe.Coerce

data A = C deriving stock (Show)

data Expr a b where
    Id :: Expr a a
    Output :: Expr String ()
    Input :: Expr () String
    StrToInt :: Expr String Int
    IntToStr :: Expr Int String
    Add :: Expr (Int, Int) Int
    Concat :: Expr (String, String) String
    Clone :: Expr a (a, a)
    ConstStr :: String -> Expr () String
    ConstInt :: Int -> Expr () Int 
    Compose :: Expr b c -> Expr a b -> Expr a c

deriving instance Show (Expr a b)

instance Read (Expr a b) where
    readPrec
        = parens
            (choose
                [("Id", pure $ unsafeCoerce Id),
                ("Output", pure $ unsafeCoerce Output),
                ("Input", pure $ unsafeCoerce Input),
                ("StrToInt", pure $ unsafeCoerce StrToInt),
                ("IntToStr", pure $ unsafeCoerce IntToStr),
                ("Add", pure $ unsafeCoerce Add),
                ("Concat", pure $ unsafeCoerce Concat),
                ("Clone", pure $ unsafeCoerce Clone)]
                +++
                (prec
                    10
                    (do expectP (Ident "ConstStr")
                        a1_a9IR <- step readPrec
                        pure $ unsafeCoerce (ConstStr a1_a9IR))
                    +++
                    (prec
                        10
                        (do expectP
                                (Ident "ConstInt")
                            a1_a9IS <- step readPrec
                            pure $ unsafeCoerce (ConstInt a1_a9IS))
                        +++
                            prec
                            10
                            (do expectP
                                    (Ident "Compose")
                                a1_a9IT <- step readPrec
                                a2_a9IU <- step readPrec
                                pure $ unsafeCoerce (Compose a1_a9IT a2_a9IU)))))
    readList = readListDefault
    readListPrec
        = readListPrecDefault

instance Category Expr where
    id = Id
    (.) = Compose

data UExpr a b where
    UId :: UExpr () ()
    UInput :: UExpr () ()
    UOutput :: UExpr () ()
    UStrToInt :: UExpr () ()
    UIntToStr :: UExpr () ()
    UAdd :: UExpr () ()
    UConcat :: UExpr () ()
    UClone :: UExpr () ()
    UConstStr :: String -> UExpr () ()
    UConstInt :: Int -> UExpr () () 
    UCompose :: UExpr () () -> UExpr () () -> UExpr () ()


deriving instance Show (UExpr a b)

instance Read (UExpr a b) where
    readPrec = parens (choose [
        ("UId", pure $ unsafeCoerce UId),
        ("UOutput", pure $ unsafeCoerce UOutput),
        ("UInput", pure $ unsafeCoerce UInput),
        ("UStrToInt", pure $ unsafeCoerce UStrToInt),
        ("UntToStr", pure $ unsafeCoerce UIntToStr),
        ("UAdd", pure $ unsafeCoerce UAdd),
        ("UConcat", pure $ unsafeCoerce UConcat),
        ("UClone", pure $ unsafeCoerce UClone)]
        +++
        (prec
            10
            (do expectP (Ident "UConstStr")
                a1_a9IR <- step readPrec
                pure $ unsafeCoerce (UConstStr a1_a9IR))
            +++
            (prec
                10
                (do expectP
                        (Ident "UConstInt")
                    a1_a9IS <- step readPrec
                    pure $ unsafeCoerce (UConstInt a1_a9IS))
                +++
                    prec
                    10
                    (do expectP
                            (Ident "UCompose")
                        a1_a9IT <- step readPrec
                        a2_a9IU <- step readPrec
                        pure $ unsafeCoerce (UCompose a1_a9IT a2_a9IU)
                    )
            )
        )
        )
    readList = readListDefault
    readListPrec
        = readListPrecDefault

instance Category UExpr where
    id = unsafeCoerce UId
    (.) = unsafeCoerce UCompose

-- Decodable?
simpleProgram :: Expr () ()
simpleProgram = Output . IntToStr . Add . Clone . StrToInt . Input

-- Non-decodable
simpleUProgram :: UExpr () ()
simpleUProgram = UOutput . UIntToStr . UAdd . UClone . UStrToInt . UInput

result ∷ String
result = show C <> (" is a " <> (show (typeOf C) <> "!"))

parse :: String
parse = undefined

main ∷ IO ()
main = do
    print result
    print $ (read (show simpleProgram) :: Expr () ())
    -- print $ (read (show simpleProgram) :: UExpr () ())
    -- print $ (read (show simpleUProgram) :: Expr () ())
    -- print $ (read (show simpleUProgram) :: UExpr () ())
