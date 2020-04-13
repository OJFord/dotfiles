// Customisation
user_pref('browser.zoom.siteSpecific', true);
user_pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);

// Privacy
user_pref('privacy.firstparty.isolate, true);

// Scrolling
// https://wiki.archlinux.org/index.php/Firefox/Tweaks#Jerky_or_choppy_scrolling
user_pref('mousewheel.min_line_scroll_amount', 40);
user_pref('general.smoothScroll', false);
user_pref('general.smoothScroll.pages', false);
user_pref('image.mem.min_discard_timeout_ms', 2140000000);
user_pref('image.mem.max_decoded_image_kb', 2**19);
