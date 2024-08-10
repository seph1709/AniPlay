[
{
  "name": "aniru",
  "tag": "anime",
  "host": "ryuk.to",
  "streamPage": {
    "querySelector": {"selector": "div.film-buttons > a", "attribute": "href"},
  },
  "types": {
    "latest": {
      "subdirectory": "/latest/subbed",
      "logic": {
        "selectAllItems": {
          "querySelectorAll": {"selector": "div.flw-item"},
          // "dynamicLoad": true,
        },
        "getPosterImageUrlPerItem": {
          "querySelector": {"selector": "img", "attribute": "data-src"},
        },
        "getTitlePerItem": {
          "querySelector": {
            "selector": "a.film-poster-ahref",
            "attribute": "title",
          },
        },
        "getMoreDetailsUrlPerItem": {
          "querySelector": {"selector": "a", "attribute": "href"},
        },
        "moreDetailsPerItem": {
          "getDescription": {
            "querySelector": {"selector": "div.text", "getText": true}
          },
          "getFilmTag": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-quality",
              "getText": true
            }
          },
          "getFilmDate": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-dub",
              "getText": true
            },
          },
          "getCurrentSeasonLinkItems": {
            "querySelectorAll": {
              "selector": ".ssl-item.ep-item ",
              "attribute": "href"
            },
          },
        },
      },
    },
    "completed": {
      "subdirectory": "/status/completed",
      "streamPage": {
        "querySelector": {
          "selector": "div.film-buttons > a",
          "attribute": "href"
        },
      },
      "logic": {
        "selectAllItems": {
          "querySelectorAll": {"selector": "div.flw-item"},
          // "dynamicLoad": true,
        },
        "getPosterImageUrlPerItem": {
          "querySelector": {"selector": "img", "attribute": "data-src"},
        },
        "getTitlePerItem": {
          "querySelector": {
            "selector": "a.film-poster-ahref",
            "attribute": "title",
          },
        },
        "getMoreDetailsUrlPerItem": {
          "querySelector": {"selector": "a", "attribute": "href"},
        },
        "moreDetailsPerItem": {
          "getDescription": {
            "querySelector": {"selector": "div.text", "getText": true}
          },
          "getFilmTag": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-quality",
              "getText": true
            }
          },
          "getFilmDate": {
            "querySelector": {
              "selector": "div.film-stats > span.item",
              "getText": true
            },
          },
          "getCurrentSeasonLinkItems": {
            "querySelectorAll": {
              "selector": ".ssl-item.ep-item ",
              "attribute": "href"
            },
          },
        },
      },
    },
    "popular": {
      "subdirectory": "/popular",
      "streamPage": {
        "querySelector": {
          "selector": "div.film-buttons > a",
          "attribute": "href"
        },
      },
      "logic": {
        "selectAllItems": {
          "querySelectorAll": {"selector": "div.flw-item"},
          // "dynamicLoad": true,
        },
        "getPosterImageUrlPerItem": {
          "querySelector": {"selector": "img", "attribute": "data-src"},
        },
        "getTitlePerItem": {
          "querySelector": {
            "selector": "a.film-poster-ahref",
            "attribute": "title",
          },
        },
        "getMoreDetailsUrlPerItem": {
          "querySelector": {"selector": "a", "attribute": "href"},
        },
        "moreDetailsPerItem": {
          "getDescription": {
            "querySelector": {"selector": "div.text", "getText": true}
          },
          "getFilmTag": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-quality",
              "getText": true
            }
          },
          "getFilmDate": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-dub",
              "getText": true
            },
          },
          "getCurrentSeasonLinkItems": {
            "querySelectorAll": {
              "selector": "a[data-number]",
              "attribute": "href"
            },
          },
        },
      },
    },
  },
  "search": {
    "path": "search",
    "query": {"keyword": "value"},
    "streamPage": true,
    "overrideSelectorHomeData": {
      "getCurrentSeasonLinkItems": {
        "querySelectorAll": {
          "selector": ".ssl-item.ep-item ",
          "attribute": "href"
        },
      },
    }
  }
},
{
  "name": "animeY",
  "tag": "anime",
  "host": "animez.org",
  "streamPage": {
    "querySelector": {"selector": "a.watch_button_more", "attribute": "href"},
  },
  "types": {
    "latest": {
      "subdirectory": "/",
      "logic": {
        "selectAllItems": {
          "querySelectorAll": {"selector": "li.TPostMv"},
          // "dynamicLoad": true,
        },
        "getPosterImageUrlPerItem": {
          "querySelector": {"selector": "img", "attribute": "src"},
        },
        "getTitlePerItem": {
          "querySelector": {
            "selector": "img",
            "attribute": "title",
          },
        },
        "getMoreDetailsUrlPerItem": {
          "querySelector": {"selector": "a", "attribute": "href"},
        },
        "moreDetailsPerItem": {
          "getDescription": {
            "querySelector": {
              "selector": "div#summary_shortened",
              "getText": true
            }
          },
          "getFilmTag": {
            "querySelector": {
              "selector": "li.AAIco-adjust:nth-child(4) > a:nth-child(2)",
              "getText": true
            }
          },
          "getFilmDate": {
            "querySelector": {
              "selector": "li.AAIco-adjust:nth-child(4) > a:nth-child(3))",
              "getText": true
            },
          },
          "getCurrentSeasonLinkItems": {
            "querySelectorAll": {
              "selector": "nav.mb-3 li.wp-manga-chapter > a",
              "attribute": "href"
            },
            "reverse": true,
            "replaceHost": {"embed": "anime"}
          },
        },
      },
    },
    "hot": {
      "subdirectory": "/hot",
      "logic": {
        "selectAllItems": {
          "querySelectorAll": {"selector": "li.TPostMv"},
          // "dynamicLoad": true,
        },
        "getPosterImageUrlPerItem": {
          "querySelector": {"selector": "img", "attribute": "src"},
        },
        "getTitlePerItem": {
          "querySelector": {"selector": "h2.Title", "getText": true},
        },
        "getMoreDetailsUrlPerItem": {
          "querySelector": {"selector": "a", "attribute": "href"},
        },
        "moreDetailsPerItem": {
          "getDescription": {
            "querySelector": {
              "selector": "div#summary_shortened",
              "getText": true
            }
          },
          "getFilmTag": {
            "querySelector": {
              "selector": "div.mrt5.mrb10 > span",
              "getText": true
            }
          },
          "getFilmDate": {
            "querySelector": {
              "selector": "li:nth-child(4) > a:nth-child(3)",
              "getText": true
            },
          },
          "getCurrentSeasonLinkItems": {
            "querySelectorAll": {
              "selector": "nav.mb-3 li.wp-manga-chapter > a",
              "attribute": "href"
            },
            "reverse": true,
            "replaceHost": {"embed": "anime"}
          },
        },
      },
    },
  },
  "search": {
    "path": "/",
    "query": {
      "f[keyword]": "value",
      "act": "search",
      "f[status]": "all",
      "f[sortby]": "lastest-chap",
    },
    "streamPage": true,
    "overrideSelectorHomeData": {
      "getTitlePerItem": {
        "querySelector": {"selector": "h2.Title", "getText": true},
      },
    }
  }
},
{
  "name": "animensub",
  "tag": "anime",
  "host": "animenosub.to",
  "streamPage": {
    "querySelector": {"selector": "div.film-buttons > a", "attribute": "href"},
  },
  "types": {
    "latest": {
      "subdirectory": "/anime/?status=&type=&order=update",
      "logic": {
        "selectAllItems": {
          "querySelectorAll": {"selector": "article.bs"},
          // "dynamicLoad": true,
        },
        "getPosterImageUrlPerItem": {
          "querySelector": {"selector": "img", "attribute": "src"},
        },
        "getTitlePerItem": {
          "querySelector": {"selector": "h2", "getText": true},
        },
        "getMoreDetailsUrlPerItem": {
          "querySelector": {"selector": "a", "attribute": "href"},
        },
        "moreDetailsPerItem": {
          "getDescription": {
            "querySelector": {
              "selector": "div[itemprop=description] > p",
              "getText": true
            }
          },
          "getFilmTag": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-quality",
              "getText": true
            }
          },
          "getFilmDate": {
            "querySelector": {
              "selector": "div.tac.tick-item.tick-dub",
              "getText": true
            },
          },
          "getCurrentSeasonLinkItems": {
            "querySelectorAll": {
              "selector": ".eplister > ul > li > a",
              "attribute": "href"
            },
          },
        },
      },
    },
  },
  "search": {
    "path": "/",
    "query": {"s": "value"},
  }
}
]