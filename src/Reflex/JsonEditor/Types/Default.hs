{-# LANGUAGE PackageImports #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Reflex.JsonEditor.Types.Default where


import "data-default" Data.Default
import "aeson"        Data.Aeson as Aeson (Value(..))
import                Reflex.JsonEditor.Types.Types

instance Default Value where
    def = Null

instance Default JsonEditorMode where
    def = Tree

instance Default JsonEditorOptions where
    def = JsonEditorOptions Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing

instance Default JsonEditorSelection where
    def = JsonEditorSelection Nothing
                              Nothing

instance Default JsonEditorEvent where
    def = JsonEditorEvent Nothing
                          Nothing
