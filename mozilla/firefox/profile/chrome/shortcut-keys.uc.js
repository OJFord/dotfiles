(function() {
    try {
        // keys from view-source:chrome://browser/content/browser.xhtml
        // `reserved=true` ones seem not possible to remove
        let keys_to_unbind = [
            document.getElementById("key_selectTab1"),
            document.getElementById("key_selectTab2"),
            document.getElementById("key_selectTab3"),
            document.getElementById("key_selectTab4"),
            document.getElementById("key_selectTab5"),
            document.getElementById("key_selectTab6"),
            document.getElementById("key_selectTab7"),
            document.getElementById("key_selectTab8"),
            document.getElementById("key_selectLastTab"),
        ];

        let keyset = chromeWindow.document.getElementById("mainKeyset");
        for (key of keys_to_unbind) {
            keyset.removeChild(key);
        }
    } catch (e) {
        Components.utils.reportError(e);
    };
})();
