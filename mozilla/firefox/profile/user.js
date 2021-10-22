// Customisation
user_pref('browser.zoom.siteSpecific', true);
user_pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);
user_pref('ui.context_menus.after_mouseup', true);

// Privacy
user_pref('privacy.firstparty.isolate', true);

// Scrolling
// https://wiki.archlinux.org/index.php/Firefox/Tweaks#Jerky_or_choppy_scrolling
user_pref('mousewheel.min_line_scroll_amount', 40);
user_pref('general.smoothScroll', false);
user_pref('general.smoothScroll.pages', false);
user_pref('image.mem.min_discard_timeout_ms', 2140000000);
user_pref('image.mem.max_decoded_image_kb', 524288);

// http://forums.mozillazine.org/viewtopic.php?p=14854175#p14854175
Components.utils.import("resource://gre/modules/Services.jsm");
Services.obs.addObserver(function (aSubject, aTopic, aData) {
    var chromeWindow = aSubject;
    chromeWindow.setTimeout(function () {
        try {
            if (chromeWindow.userChromeJsMod) return;
            chromeWindow.userChromeJsMod = true;
            var chromeFiles = chromeWindow.FileUtils.getDir("UChrm", []).directoryEntries;
            var sss = Components.classes["@mozilla.org/content/style-sheet-service;1"].getService(Components.interfaces.nsIStyleSheetService);

            while (chromeFiles.hasMoreElements()) {
                var file = chromeFiles.getNext().QueryInterface(Components.interfaces.nsIFile);
                var fileURI = Services.io.newFileURI(file);
                if (file.isFile()) {
                    if (/(^userChrome|\.uc)\.js$/i.test(file.leafName)) {
                        Services.scriptloader.loadSubScriptWithOptions(fileURI.spec, {target: chromeWindow, ignoreCache: true});
                    } else if (/\.as\.css$/i.test(file.leafName)) {
                        if (!sss.sheetRegistered(fileURI, sss.AGENT_SHEET)) {
                            sss.loadAndRegisterSheet(fileURI, sss.AGENT_SHEET);
                        }
                    } else if (/^(?!(userChrome|userContent)\.css$).+\.css$/i.test(file.leafName)) {
                        if (!sss.sheetRegistered(fileURI, sss.USER_SHEET)) {
                            sss.loadAndRegisterSheet(fileURI, sss.USER_SHEET);
                        }
                    }
                }
            }
        } catch (e) {
            Components.utils.reportError(e); // [check] Show Content Messages
        }
    }, 10);
}, "browser-delayed-startup-finished", false);
