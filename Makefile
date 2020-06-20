example:
	nix-build example.nix -A ghcjs.reflex-jsoneditor -o result-reflex-jsoneditor
	$(BROWSER) ./result-reflex-jsoneditor/bin/reflex-jsoneditor-exe.jsexe/index.html
