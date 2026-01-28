{...}:

{
  programs.firefox = {
    enable = true;
    preferences = {
      "browser.preferences.experimental.hidden" = true;
      "browser.preferences.moreFromMozilla" = false;

      "browser.urlbar.shortcuts.actions" = false;
      "browser.urlbar.shortcuts.bookmarks" = false;
      "browser.urlbar.shortcuts.history" = false;
      "browser.urlbar.shortcuts.tabs" = false;

      "browser.search.suggest.enabled" = false;
      "browser.urlbar.suggest.addons" = false;
      "browser.urlbar.suggest.amp" = false;
      "browser.urlbar.suggest.bookmark" = false;
      "browser.urlbar.suggest.calculator" = false;
      "browser.urlbar.suggest.clipboard" = false;
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.history" = false;
      "browser.urlbar.suggest.importantDates" = false;
      "browser.urlbar.suggest.mdn" = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.quickactions" = false;
      "browser.urlbar.suggest.realtimeOptIn" = false;
      "browser.urlbar.suggest.recentsearches" = false;
      "browser.urlbar.suggest.remotetab" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.urlbar.suggest.sports" = false;
      "browser.urlbar.suggest.topsites" = false;
      "browser.urlbar.suggest.trending" = false;
      "browser.urlbar.suggest.weather" = false;
      "browser.urlbar.suggest.wikipedia" = false;
      "browser.urlbar.suggest.yelp" = false;
      "browser.urlbar.suggest.yelpRealtime" = false;
      "browser.urlbar.showSearchSuggestionsFirst" = false;
      "browser.urlbar.quicksuggest.online.enabled" = false;
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      GenerativeAI.Enabled = false;
      Homepage = {
        Locked = true;
        StartPage = "none";
      };
      SanitizeOnShutdown = true;
      PasswordManagerEnabled = false;
      NewTabPage = false;
      SearchEngines = {
        PreventInstalls = true;
        Add = [
          {
            Name = "Duck";
            URLTemplate = "https://duckduckgo.com/?q={searchTerms}";
            Alias = "@d";
          }
          {
            Name = "StartPage";
            URLTemplate = "https://www.startpage.com/do/search?query={searchTerms}";
            Alias = "@s";
          }
          {
            Name = "NixOS";
            URLTemplate = "https://search.nixos.org/options?channel=25.11&query={searchTerms}";
            Alias = "@opt";
          }
          {
            Name = "Nix";
            URLTemplate = "https://search.nixos.org/packages?channel=25.11&query={searchTerms}";
            Alias = "@nix";
          }
          {
            Name = "Home-Manager";
            URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}";
            Alias = "@home";
          }
        ];
        Remove = ["Google" "Bing" "DuckDuckGo" "eBay" "Ecosia" "Perplexity" "Qwant" "Wikipedia (en)"];
      };
      ExtensionSettings = {
        # Block all extensions except the config ones.
        "*".installation_mode = "blocked";
        #Ublock Origin
        "uBlock0@raymondhill.net" = {
          install_url =  "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        #ClearURLs
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        #Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        #PopUpOff
        "{154cddeb-4c8b-4627-a478-c7e5b427ffdf}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/popupoff/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        #Nitter
        "{7b74340a-30bf-4a45-aefa-8a0de3096062}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/nitter/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };
}
