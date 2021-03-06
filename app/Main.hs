{-# LANGUAGE PackageImports #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import                     Prelude hiding (head)
import "lens"              Control.Lens
import "data-default"      Data.Default (def)
import "aeson"             Data.Aeson (toJSON)
import "text"              Data.Text (Text, pack)
import "reflex-dom"        Reflex.Dom
import "reflex-utils"      Reflex.Utils
import "reflex-jsoneditor" Reflex.JsonEditor
import "reflex-jsoneditor" Reflex.JsonEditor.Types

--
main :: IO ()
main = mainWidget main_
    where
        main_ :: forall t m. MonadWidget t m => m ()
        main_ = do
            headD <- head
            whenLoaded [headD] blank body
            return ()

--
head :: forall t m. MonadWidget t m => m (Dynamic t Bool)
head = do
    s1Ds <- sequence [ script "https://cdnjs.cloudflare.com/ajax/libs/jsoneditor/8.6.1/jsoneditor.min.js"
                     , css    "https://cdnjs.cloudflare.com/ajax/libs/jsoneditor/8.6.1/jsoneditor.min.css"
                     ]
    whenLoaded s1Ds blank $ return ()

--
body :: MonadWidget t m => m ()
body = do
    clickE <- button "Random"

    (randomsE :: Event t [[Int]]) <- randomsW clickE
    randomsD <- holdDyn [] randomsE

    (outD, selectE) <- jsoneditor editorConfig randomsD
    display outD
    selectD <- holdDyn def selectE
    display selectD
    return ()
    where
        editorConfig :: JsonEditorOptions
        editorConfig
            = def
            & jsonEditorOptions_mode ?~ Tree
            & jsonEditorOptions_modes ?~ [ Tree
                                         , Code
                                         ]
