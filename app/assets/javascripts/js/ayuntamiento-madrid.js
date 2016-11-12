"use strict";
jQuery.extend({
    exists: function(a) {
        return jQuery(a).length ? !0 : !1
    }
}), jQuery(document).ready(function() {
    aytmad.main = function() {
        var a = function() {
                aytmad.utils.setJs(), aytmad.googleMaps.init(), aytmad.collapse.accordion(), aytmad.utils.moreElements(), aytmad.distritos.init(), aytmad.section.init(), aytmad.utils.goBack(), aytmad.searcher.init(), aytmad.carrusel.init(), aytmad.date.init(), aytmad.date.pickerRadioSelector(), aytmad.oculta.init(".close-info", ".header .modal-alert"), aytmad.menuVertical.init(), aytmad.font.init(), aytmad.tramites.init(), aytmad.serviciosSociales.init(), aytmad.tramitesDetalle.init(), aytmad.tabs.init(), aytmad.utils.tooltip(), aytmad.utils.visibleWhenActive(), aytmad.date.picker('.form.form-electronic .c01 input[type="text"]'), aytmad.date.picker('.date-field input[type="text"]'), aytmad.table.responsive([".tributes-table .table"]), aytmad.gallery.init(), aytmad.videoplayer.init(), aytmad.tree.init(), aytmad.utils.magazine()
            },
            b = function() {
                aytmad.utils.ie8() || aytmad.menu.init()
            };
        return {
            load: a,
            mobileLoad: b
        }
    }(), aytmad.main.load() /*, enquire.register("screen and (max-width:992px)", {
        setup: function() {
            aytmad.main.mobileLoad(), aytmad.nxc.init()
        },
        deferSetup: !0
    }), enquire.register("screen and (max-width:767px)", {
        setup: function() {
            aytmad.collapse.init()
        },
        deferSetup: !0
    })*/
}), aytmad.distritos = {}, aytmad.distritos = function() {
    var a = 0,
        b = jQuery("#mapaMadrid"),
        c = jQuery("#mapMapaMadrid"),
        d = jQuery("#mapaMadridTooltip"),
        e = function() {
            b.maphilight({
                fill: !0,
                fillColor: "0077b9",
                fillOpacity: 1,
                stroke: !1,
                strokeColor: "ff0000",
                strokeOpacity: 1,
                strokeWidth: 1,
                fade: !0,
                alwaysOn: !1,
                neverOn: !1,
                groupBy: !1,
                wrapClass: !0,
                shadow: !1,
                shadowX: 0,
                shadowY: 0,
                shadowRadius: 6,
                shadowColor: "000000",
                shadowOpacity: .8,
                shadowPosition: "outside",
                shadowFrom: !1
            }), k(), c.on("mouseover", "area", f), c.on("mousemove", "area", i), c.on("mouseleave", "area", j), c.on("focus", "area", g), c.on("blur", "area", h), jQuery(window).on("resize", k), jQuery(".tabspanel").on("click", 'a[href="#tab-en_tu_distrito"]', k), jQuery(".distritos").on("click", 'a[href="#tabMapa"]', k)
        },
        f = function(c) {
            var e = jQuery(this),
                f = c.pageX - b.offset().left + a - 10,
                g = c.pageY - b.offset().top - 60;
            d.css("left", f).css("top", g).show().find(".text").text(e.attr("alt"))
        },
        g = function() {
            jQuery(this).mouseover().css("fill", "#0077b9")
        },
        h = function() {
            jQuery(this).mouseout().css("fill", "#c1c1c1")
        },
        i = function(c) {
            var e = c.pageX - b.offset().left + a - 10,
                f = c.pageY - b.offset().top - 60;
            d.css("left", e).css("top", f)
        },
        j = function() {
            d.hide()
        },
        k = function() {
            var b = jQuery(".mapContainer"),
                c = b.find(">div:first-child"),
                d = -1 * (c.width() - b.width()) / 2;
            a = d, c.css("left", d)
        };
    return {
        init: e
    }
}(), aytmad.section = {}, aytmad.section = function() {
    var a = function() {
        var a = jQuery("#section-image"),
            b = jQuery("header.header"),
            c = a.attr("src");
        b.css({
            
        })
    };
    return {
        init: a
    }
}(), aytmad.utils = {}, aytmad.utils = function() {
    var a = null,
        b = jQuery("html"),
        c = function() {
            b.removeClass("no-js")
        },
        d = function() {
            return b.hasClass("ie8")
        },
        e = function() {
            var a = jQuery("a.backbutton");
            a.on("click", function(a) {
                a.preventDefault(), window.history.back()
            })
        },
        f = function() {
            var a = aytmad.config.constants.numVisibleLinks,
                b = jQuery("ul.trancateList");
            b.each(function(b, c) {
                var d = jQuery(c),
                    e = d.children("li:gt(" + (a - 1) + ")");
                e.size() > 0 && (e.addClass("hide"), g(d))
            })
        },
        g = function(a) {
            var b = jQuery("<div/>").attr({
                    "class": "button-group rs_skip"
                }),
                c = jQuery('<a href="#" class="button button3"><strong>ver más enlaces...</strong></a>');
            c.on("click", function(c) {
                c.preventDefault(), a.children("li.hide").removeClass("hide"), b.addClass("hide")
            }), b.append(c), a.after(b)
        },
        h = function() {
            var a = jQuery("form.visibleWhenActive"),
                b = a.find("div.button-group"),
                c = a.find('input[type="radio"]');
            c.on("click", function() {
                b.show()
            })
        },
        i = function() {
            var a = jQuery(".ico-info"),
                b = jQuery(".tooltip-instalacion"),
                c = b.find(".linkCerrarPopupTooltip");
            a.add(c).on("click", function(a) {
                a.preventDefault(), b.is(":visible") ? b.hide() : b.show()
            })
        },
        j = function() {
            var a = jQuery("#magazine");
            if (jQuery.exists(a)) {
                var b = jQuery("header.header .section-cont");
                b.after(a.clone()), b.find(".section-name").addClass("section-hidden")
            }
        },
        k = function() {
            if (null === a) {
                var b = document.createElement("a");
                return "undefined" == typeof b.download ? (a = !1, !1) : (a = !0, !0)
            }
            return a
        },
        l = function(a) {
            for (var b = window.location.search.substring(1), c = b.split("&"), d = 0; d < c.length; d++) {
                var e = c[d].split("=");
                if (e[0] === a) return e[1]
            }
            return !1
        },
        m = function(a) {
            var b = l(a),
                c = decodeURIComponent(b);
            return c
        };
    return {
        setJs: c,
        ie8: d,
        goBack: e,
        visibleWhenActive: h,
        moreElements: f,
        tooltip: i,
        magazine: j,
        downloadSupport: k,
        getParamFromUrl: m
    }
}(), aytmad.menu = {}, aytmad.menu = function() {
    var a = jQuery("#navbar"),
        b = {},
        c = jQuery("<a/>").attr({
            "class": "sidebar-ico",
            href: "#menu",
            id: "sidebar-toggle-button"
        }),
        d = jQuery("<nav/>").attr({
            id: c.attr("href").replace("#", ""),
            "class": "sidebar"
        }),
        e = function() {
            var b = jQuery("<div/>").attr({
                "class": "navigation-bar-ico nb-menu"
            }).append(c);
            a.prepend(b)
        },
        f = function(a) {
            var b;
            b = a.href ? jQuery("<a/>").attr({
                href: a.href,
                "class": "sidebar-link " + a["class"]
            }) : jQuery("<span/>").attr({
                "class": "sidebar-link " + a["class"]
            }), b.text(a.text);
            var c = jQuery("<li/>").append(b);
            return c
        },
        g = function(a) {
            var b = jQuery("<ul/>");
            return jQuery.each(a.elements, function(a, c) {
                var d = f(c);
                c.submenu && d.append(g(c.submenu)), b.append(d)
            }), b
        },
        h = function() {
            var a = jQuery.ajax({
                    url: aytmad.config.routes.menu,
                    dataType: "json"
                }),
                c = jQuery.ajax({
                    url: aytmad.config.routes.menuTramites,
                    dataType: "json"
                });
            jQuery.when(a, c).then(function(a, c) {
                b = a[0], b.menu.elements.unshift(c[0].menu.elements[0]), d.append(g(b.menu)), d.mmenu({
                    header: {
                        add: !0,
                        update: !0,
                        title: aytmad.i18n.menu,
                        content: ["close", "title", "prev"]
                    }
                }, {
                    offCanvas: {
                        pageSelector: "#wrapper"
                    }
                })
            })
        },
        i = function() {
            e(), h()
        };
    return {
        init: i
    }
}(), aytmad.collapse = {}, aytmad.collapse = function() {
    var a = "collapse-item",
        b = function() {
            var b = jQuery("." + a);
            jQuery.exists(b) && b.on("click", function() {
                var b = jQuery(this),
                    c = b.parent("li").siblings();
                b.toggleClass("collapse-item-active"), c.children("." + a).removeClass("collapse-item-active")
            })
        },
        c = function() {
            var a = jQuery("div.panel-group.info-detalles");
            jQuery.exists(a) && a.on("shown.bs.collapse", function(a) {
                var b = jQuery(a.target),
                    c = b.prev(".panel-title");
                jQuery("html, body").animate({
                    scrollTop: c.offset().top
                }, 1e3)
            })
        };
    return {
        init: b,
        accordion: c
    }
}(), aytmad.searcher = {}, aytmad.searcher = function() {
    var a = jQuery("#navbar"),
        b = jQuery("#searcher-form"),
        c = jQuery("<a/>").attr({
            "class": "searcher-link searcher-toggle",
            href: "#" + b.attr("id"),
            id: "searcher-toggle-button",
            title: aytmad.i18n.buscar
        }),
        d = function() {
            var b = jQuery("<div/>").attr({
                "class": "navigation-bar-ico nb-search"
            }).append(c);
            a.append(b)
        },
        e = function() {
            jQuery.exists(b) && (d(), a.addClass("navigation-bar-toggle"), c.on("click", function(b) {
                b.preventDefault(), a.toggleClass("navigation-bar-active"), a.hasClass("navigation-bar-active") ? (jQuery("#search-field").focus(), c.attr("title", aytmad.i18n.cerrarbuscador), jQuery("#searcher-form .searcher-link").attr("title", aytmad.i18n.buscar)) : c.attr("title", aytmad.i18n.buscar)
            }))
        };
    return {
        init: e
    }
}(), aytmad.carrusel = {}, aytmad.carrusel = function() {
    var a = jQuery(".carouselHome"),
        b = function() {
            c(), f(), g(), h(), i(), j()
        },
        c = function() {
            jQuery.exists(a) && (d(a.clone()), a.on("resize.owl.carousel resized.owl.carousel", function() {
                a.data("owlCarousel").reload()
            }), a.owlCarousel({
                scrollPerPage: !0,
                items: 8,
                itemsDesktop: [1200, 8],
                itemsDesktopSmall: [992, 6],
                itemsTablet: [768, 6],
                itemsMobile: !1,
                pagination: !0,
                paginationNumbers: !1
            }))
        },
        d = function(b) {
            var c = jQuery("<div/>").attr({
                    id: "listadoHome",
                    "class": "listadoHome"
                }),
                d = b.data("text-hide"),
                f = b.data("text-show");
            b.children("li").removeClass("item"), b.attr("class", "collapse"), b.removeAttr("id"), c.append(b), a.after(c);
            var g = jQuery('<a href="#" id="btnHomeTemas" class="button button4 button-icon"><strong>' + f + '</strong> <i class="button-icon-arrowbottom"></i></a>').on("click", function(a) {
                    a.preventDefault();
                    var b = jQuery(this),
                        g = c.hasClass("active") ? f : d;
                    e(b, c, g)
                }),
                h = jQuery("<div/>").attr({
                    "class": "btnWrapper"
                }).append(g);
            c.append(h)
        },
        e = function(a, b, c) {
            var d = b.children("ul"),
                e = a.children("strong");
            b.toggleClass("active"), d.collapse("toggle"), e.text(c)
        },
        f = function() {
            var a = jQuery(".carouselTeInteresa");
            a.on("resize.owl.carousel resized.owl.carousel", function() {
                a.data("owlCarousel").reload()
            }), a.owlCarousel({
                scrollPerPage: !0,
                items: 4,
                itemsDesktop: [1200, 4],
                itemsDesktopSmall: [992, 4],
                itemsTablet: [767, 2],
                itemsMobile: !1,
                pagination: !0,
                paginationNumbers: !1
            })
        },
        g = function() {
            var a = jQuery(".carouselFormasParte");
            a.on("resize.owl.carousel resized.owl.carousel", function() {
                a.data("owlCarousel").reload()
            }), a.owlCarousel({
                scrollPerPage: !0,
                items: 4,
                itemsDesktop: [1200, 4],
                itemsDesktopSmall: [992, 4],
                itemsTablet: [767, 2],
                itemsMobile: !1,
                pagination: !0,
                paginationNumbers: !1
            })
        },
        h = function() {
            var a = jQuery(".carouselConsultas");
            a.on("resize.owl.carousel resized.owl.carousel", function() {
                a.data("owlCarousel").reload()
            }), a.owlCarousel({
                scrollPerPage: !0,
                items: 4,
                itemsDesktop: [1200, 4],
                itemsDesktopSmall: [992, 4],
                itemsTablet: [767, 2],
                itemsMobile: !1,
                pagination: !0,
                paginationNumbers: !1
            })
        },
        i = function() {
            var a = jQuery(".carousel-gobierno-abierto");
            a.on("resize.owl.carousel resized.owl.carousel", function() {
                a.data("owlCarousel").reload()
            }), a.owlCarousel({
                scrollPerPage: !0,
                items: 3,
                itemsDesktop: [1200, 3],
                itemsDesktopSmall: [992, 3],
                itemsTablet: [767, 2],
                itemsMobile: !1,
                pagination: !0,
                paginationNumbers: !1
            })
        },
        j = function() {
            var a = jQuery(".carouselNoticia");
            a.on("resize.owl.carousel resized.owl.carousel", function() {
                a.data("owlCarousel").reload()
            }), a.owlCarousel({
                scrollPerPage: !1,
                items: 3,
                itemsDesktop: [1200, 3],
                itemsDesktopSmall: [992, 3],
                itemsTablet: [767, 2],
                itemsMobile: [320, 1],
                pagination: !1,
                paginationNumbers: !1,
                navigation: !0,
                rewindNav: !1,
                responsive: !0,
                responsiveRefreshRate: 200,
                responsiveBaseWidth: window,
                navigationText: ["", ""]
            })
        };
    return {
        init: b
    }
}(), aytmad.date = {}, aytmad.date = function() {
    var a = '<div class="datepicker"><div class="datepicker-days"><table class=" table-condensed"><caption class="text-hide">' + aytmad.i18n.calendario + '</caption><thead><tr><th class="prev"><a href="#" title="' + aytmad.i18n.anterior + '">' + aytmad.i18n.anterior + '</a></th><th colspan="5" class="datepicker-switch"></th><th class="next"><a href="#" title="' + aytmad.i18n.siguiente + '">' + aytmad.i18n.siguiente + '</a></th></tr></thead><tbody></tbody><tfoot><tr><th colspan="7" class="today"></th></tr><tr><th colspan="7" class="clear"></th></tr></tfoot></table></div><div class="datepicker-months"><table class="table-condensed"><thead><tr><th class="prev"><a href="#" title="' + aytmad.i18n.anterior + '">' + aytmad.i18n.anterior + '</a></th><th colspan="5" class="datepicker-switch"></th><th class="next"><a href="#" title="' + aytmad.i18n.siguiente + '">' + aytmad.i18n.siguiente + '</a></th></tr></thead><tbody><tr><td colspan="7"></td></tr></tbody><tfoot><tr><th colspan="7" class="today"></th></tr><tr><th colspan="7" class="clear"></th></tr></tfoot></table></div><div class="datepicker-years"><table class="table-condensed"><thead><tr><th class="prev"><a href="#" title="' + aytmad.i18n.anterior + '">Anterior</a></th><th colspan="5" class="datepicker-switch"></th><th class="next"><a href="#" title="' + aytmad.i18n.siguiente + '">' + aytmad.i18n.siguiente + '</a></th></tr></thead><tbody><tr><td colspan="7"></td></tr></tbody><tfoot><tr><th colspan="7" class="today"></th></tr><tr><th colspan="7" class="clear"></th></tr></tfoot></table></div></div>';
    $.fn.datepicker.DPGlobal.template = a;
    var b = jQuery("#activitiesCalendar"),
        c = jQuery("#calendarSelectionPicker"),
        d = function() {
            b.datepicker({
                startDate: new Date,
                language: "es",
                todayHighlight: !0
            }).on("changeDate", function(a) {
                window.location = aytmad.config.routes.calendar + a.format()
            })
        },
        e = function() {
            jQuery(".datepicker .datepicker-days .table-condensed tbody > tr > td").not("td.day.disabled").each(function(a, b) {
                jQuery(b).html('<a href="#">' + b.innerHTML + "</a>")
            })
        },
        f = function(a) {
            var b = jQuery(a);
            jQuery.exists(b) && (b.addClass("form-control-date"), b.datepicker({
                language: "es",
                autoclose: !0,
                todayHighlight: !0
            }))
        },
        g = function() {
            var a = jQuery("#radioSelectionPicker"),
                b = a.find("input:radio"),
                d = c.find("input.calendarSelectionPickerInput"),
                f = aytmad.utils.getParamFromUrl("fechaAccesible");
            c.datepicker({
                startDate: new Date,
                language: "es",
                todayHighlight: !0
            }).on("changeDate", function(c) {
                d.val(c.format()), b.prop("checked", !1), a.find("input#when1").prop("checked", !0)
            }), c.datepicker("update", f), b.is(":checked") && h(a.find("input:radio:checked")), b.on("change", function() {
                c.datepicker("update", new Date);
                var a = jQuery(this);
                h(a)
            }), e()
        },
        h = function(a) {
            var b = a.attr("id");
            if ("when2" === b || "when3" === b) {
                var d = c.find("td.today");
                a.parents(".radio").siblings(".radio").removeClass("radio-check"), a.parents(".radio").addClass("radio-check");
                var e = d.parent("tr");
                switch (b) {
                    case "when2":
                        e.children("td:gt(3)").addClass("check-weekend"), e.children("td:eq(4)").addClass("check-weekend-init"), e.children("td:eq(6)").addClass("check-weekend-end");
                        break;
                    case "when3":
                        e.addClass("check-week")
                }
            }
        };
    return {
        init: d,
        addEnableDay: e,
        picker: f,
        pickerRadioSelector: g
    }
}(), aytmad.menuVertical = {}, aytmad.menuVertical = function() {
    var a = jQuery(".menuVertical"),
        b = jQuery(".btnSubmenu"),
        c = function() {
            f(), g(), d(), a.find(".menu").on("click", ".btnSubmenu", e)
        },
        d = function() {
            b.each(function() {
                var a = jQuery(this);
                a.hasClass("active") || a.next(".submenu").removeClass("in")
            })
        },
        e = function(a) {
            var b = jQuery(this),
                c = b.attr("href"),
                d = b.siblings(".submenu");
            (jQuery(a.target).hasClass("flecha") || "#" === c) && (a.preventDefault(), b.toggleClass("active"), d.slideToggle("fast"))
        },
        f = function() {
            var b = jQuery(".footer");
            if (a.length && b.length) {
                var c = jQuery(".menuVertical").clone();
                c.find(".menu").remove(), c.addClass("menuSocialFooter"), c.insertBefore(b)
            }
        },
        g = function() {
            var a = jQuery(".enlacesMenuVertical");
            a.each(function(a, b) {
                var c = jQuery(b),
                    d = "menu" + a,
                    e = c.find(".btnMenuVerticalCompartir"),
                    f = c.find('a[class^="linkCerrarPopupSocial"]'),
                    g = jQuery(".popupMenuSocial"),
                    h = jQuery(".popupMenuSocialSeguir");
                c.attr("id", d), jQuery.exists(e) && e.on("click", function(a) {
                    a.preventDefault(), g.slideToggle("fast"), h.slideUp("fast"), e.hasClass("icon-selected") ? e.removeClass("icon-selected") : e.addClass("icon-selected")
                }), f.on("click", function(a) {
                    a.preventDefault(), f.parent().slideUp("fast"), e.removeClass("icon-selected")
                })
            })
        };
    return {
        init: c
    }
}(), aytmad.recoloca = {}, aytmad.recoloca = function() {
    function a(a, b) {
        "prev" === b ? jQuery(a).remove() : jQuery(a).parent().remove()
    }

    function b(a, b) {
        var c = jQuery(b);
        if ("prev" === b) {
            var d = jQuery(a).prev();
            d.before(a)
        } else c.first().before(a)
    }
    var c = function(c, d) {
        var e = jQuery(c).parent();
        d === c ? b(e, "prev") : (a(c), b(e, d))
    };
    return {
        init: c
    }
}(), aytmad.oculta = {}, aytmad.oculta = function() {
    function a(a) {
        a.hide()
    }

    function b(a) {
        a.show()
    }
    var c = function(c, d) {
        var e = jQuery(c),
            f = jQuery(d);
        e.on("click", function(c) {
            c.preventDefault(), "none" === f.css("display") ? b(f) : a(f)
        })
    };
    return {
        init: c
    }
}(), aytmad.font = {}, aytmad.font = function() {
    function a(a) {
        var b, c, d, e = a.attr("style");
        void 0 === e ? a.css("font-size", "104%") : (b = e.split(":"), c = parseInt(b[1]), d = c + 3, a.css("font-size", d + "%"))
    }

    function b(a) {
        var b = a.attr("style"),
            c = b.split(":"),
            d = parseInt(c[1]),
            e = d - 2;
        e > 100 && a.css("font-size", e + "%")
    }
    var c = function() {
        jQuery(".botonesFuenteImprimir a").on("click", function(c) {
            c.preventDefault();
            var d = jQuery(this).attr("id"),
                e = jQuery("main");
            "btnMenuVerticalAumentarFuente" === d ? a(e) : "btnMenuVerticalReducirFuente" === d ? b(e) : "btnMenuVerticalImprimir" === d && window.print()
        })
    };
    return {
        init: c
    }
}(), aytmad.tramites = {}, aytmad.tramites = function() {
    var a = function() {
            var a = jQuery(".mainContent");
            a.on("click", "#linkTramitarEnLinea", b), a.on("click", ".tramite-metodos .button", c)
        },
        b = function(a) {
            a.preventDefault();
            var b = jQuery('.tramite-detalles a[href="#enLinea"]'),
                c = 0,
                d = b.attr("href");
            jQuery(d).hasClass("in") || b.click(), c = jQuery("#enLinea").offset().top - b.height(), jQuery("html, body").animate({
                scrollTop: c
            }, 1e3)
        },
        c = function(a) {
            a.preventDefault();
            var b = jQuery(".tramite-detalles"),
                c = b.offset().top - (b.prev().height() + 30);
            jQuery("html, body").animate({
                scrollTop: c
            }, 1e3)
        };
    return {
        init: a
    }
}(), aytmad.serviciosSociales = {}, aytmad.serviciosSociales = function() {
    var a = function() {
            jQuery("#tipoInstalacion").length && (jQuery.ajax({
                type: "GET",
                url: aytmad.config.routes.taxonomias,
                dataType: "xml",
                contentType: "text/xml; charset=ISO-8859-1",
                success: function(a) {
                    b(a)
                },
                failure: function() {
                    console.log("XML File could not be found")
                }
            }), jQuery("#tipoInstalacion").on("keyup", function() {
                "" === jQuery("#tipoInstalacion").val() && jQuery("#tipoId").val("")
            }), jQuery("#tipoInstalacion").on("typeahead:selected", function(a, b) {
                jQuery("#tipoId").val(b.value)
            }))
        },
        b = function(a) {
            for (var b = jQuery(a).find("item"), d = [], e = 0, f = b.length; f > e; e++) {
                var g = {},
                    h = jQuery(b[e]);
                g.text = h.find("text").text(), g.value = h.find("value").text(), d.push(g)
            }
            c(d)
        },
        c = function(a) {
            var b = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.obj.whitespace("text"),
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                limit: 10,
                local: a,
                filter: function(a) {
                    return jQuery.map(a, function(a) {
                        return {
                            name: a.text,
                            id: a.value
                        }
                    })
                }
            });
            b.initialize(), jQuery("#tipoInstalacion").typeahead({
                highlight: !0
            }, {
                name: "tipos",
                displayKey: "text",
                source: b.ttAdapter()
            })
        };
    return {
        init: a
    }
}(), aytmad.tramitesDetalle = {}, aytmad.tramitesDetalle = function() {
    var a = function() {
            var a = window.location.search.substring(1),
                b = a.split("="),
                c = b[b.length - 1],
                d = a.slice().indexOf("target") > -1;
            return d === !0 ? c : !1
        },
        b = function(a) {
            jQuery(".collapse").each(function() {
                var b = jQuery(this);
                b.attr("id") !== a ? b.hasClass("submenu") || b.removeClass("in") : b.attr("id") !== a && b.hasClass("submenu") || jQuery('a[href="#' + a + '"]').removeClass("collapsed")
            })
        },
        c = function(a) {
            if (a.length) {
                var b = jQuery('a[href="#' + a + '"]'),
                    c = 500;
                setTimeout(function() {
                    var c = jQuery("#" + a).offset().top - b.height();
                    jQuery("html, body").animate({
                        scrollTop: c
                    }, 1e3)
                }, c)
            }
        },
        d = function() {
            var d = jQuery(".panel");
            if (d.length) {
                var e = a("dest");
                b(e), c(e)
            }
        };
    return {
        init: d
    }
}(), aytmad.tabs = {}, aytmad.tabs = function() {
    var a = "nav-tabs",
        b = "tabspanel-select",
        c = function() {
            h(), d(), e();
            var a = jQuery(".tabsToSelect");
            if (a.length)
                for (var b = 0, c = a.length; c > b; b++) f(jQuery(a[b]));
            if (a = jQuery(".tabspanel "), a.length) {
                for (var i = 0, j = a.length; j > i; i++) g(jQuery(a[i]), ".nav-tabs-xs-select a", "tabspanel-select");
                e()
            }
        },
        d = function() {
            var b = jQuery("." + a + " a");
            jQuery.exists(b) && b.on("click", function(a) {
                a.preventDefault();
                var b = jQuery(this);
                b.tab("show")
            })
        },
        e = function() {
            var a = jQuery("." + b);
            jQuery.exists(a) && a.on("change", function(a) {
                function b() {
                    f.each(function() {
                        var a = jQuery(this);
                        a.hasClass("active") && a.removeClass("active")
                    }), g.each(function() {
                        var a = jQuery(this);
                        a.hasClass("active") && a.removeClass("active")
                    })
                }
                a.preventDefault();
                var c = jQuery(this),
                    d = jQuery(c.parent()),
                    e = c.parent().find(":selected").val(),
                    f = jQuery(".tab-pane", d),
                    g = jQuery(".nav-tabs li", d);
                b(), d.find(".tab-content").find(e).addClass("active"), d.find(".nav-tabs").find("a[href=" + e + "]").parent().addClass("active")
            })
        },
        f = function(a) {
            var b = "",
                c = a.find(".tabsToSelectItem"),
                d = !0;
            if (c.length > 0 && d) {
                b = "<select>";
                for (var e = 0, f = c.length; f > e; e++) b += '<option value="' + jQuery(c[e]).attr("href") + '">' + jQuery(c[e]).text() + "</option>";
                b += "</select>", a.append(b)
            }
        },
        g = function(a, b, c) {
            var d = "",
                e = a.find(b),
                f = !0;
            if (e.length > 0 && f) {
                d = '<select class="' + c + '">';
                for (var g = 0, h = e.length; h > g; g++) d += '<option value="' + jQuery(e[g]).attr("href") + '">' + jQuery(e[g]).text() + "</option>";
                d += "</select>", a.prepend(d)
            }
        },
        h = function() {
            var a = jQuery(".tab-content");
            a.each(function() {
                jQuery(".tab-pane:not(:first-child)").removeClass("active")
            })
        };
    return {
        init: c
    }
}(), aytmad.table = {}, aytmad.table = function() {
    var a = function(a) {
            jQuery.each(a, function() {
                var a = jQuery(this);
                jQuery.exists(a) && b(a)
            })
        },
        b = function(a) {
            var b = a.find("thead tr").children(),
                c = a.find("tbody tr");
            c.each(function(a, c) {
                var d = jQuery(c),
                    e = d.children();
                e.each(function(a, c) {
                    var d = jQuery(b.get(a)).children(),
                        e = jQuery(c);
                    e.prepend(d.clone().addClass("table-text-header"))
                })
            })
        };
    return {
        responsive: a
    }
}(), aytmad.googleMaps = {}, aytmad.googleMaps = function() {
    var a = jQuery("#vermapa"),
        b = jQuery("#tabmapa"),
        c = null,
        d = 18,
        e = [],
        f = !1,
        g = !1,
        h = function() {
            jQuery.exists(a) && j(), jQuery.exists(b) && k()
        },
        i = function() {
            if (!f) {
                f = !0;
                var a = document.createElement("script");
                a.type = "text/javascript", a.src = "https://maps.googleapis.com/maps/api/js?key=" + aytmad.config.constants.API_KEY + "&callback=aytmad.googleMaps.initialize", document.body.appendChild(a)
            }
        },
        j = function() {
            c = jQuery(a.attr("href")), e = l(a), a.on("click", function(a) {
                a.preventDefault(), i(), c.slideToggle(300).toggleClass("in"), m()
            })
        },
        k = function() {
            c = jQuery(b.attr("href")), e = l(jQuery(".event-location")), b.on("click", function(a) {
                a.preventDefault(), i()
            })
        },
        l = function(a) {
            var b = [];
            return a.each(function(a, c) {
                var d = jQuery(c);
                b.push({
                    name: d.data("name"),
                    dir: d.data("direction"),
                    lat: parseFloat(d.data("latitude")),
                    "long": parseFloat(d.data("longitude"))
                })
            }), b
        },
        m = function() {
            var b = a.text(),
                c = a.attr("data-toggle-text");
            a.attr("data-toggle-text", b), a.get(0).childNodes[0].nodeValue = c
        },
        n = function() {
            var a, b;
            if (g === !1) {
                g = !0, b = {
                    zoom: d,
                    center: new google.maps.LatLng(e[0].lat, e[0]["long"])
                }, a = new google.maps.Map(c.get(0), b);
                var f = new google.maps.LatLngBounds;
                jQuery(e).each(function(b, c) {
                    var d = new google.maps.LatLng(c.lat, c["long"]),
                        e = new google.maps.Marker({
                            map: a,
                            position: d,
                            title: c.name,
                            icon: "/assets/images/map/map-icon-target.png"
                        });
                    f.extend(d);
                    var g = new google.maps.InfoWindow({
                        content: '<span class="infoWindow-name">' + c.name + '</span><span class="infoWindow-direction">' + c.dir + "</span>"
                    });
                    google.maps.event.addListener(e, "click", function() {
                        g.open(a, e)
                    })
                }), e.length > 1 && a.fitBounds(f)
            }
        };
    return {
        init: h,
        initialize: n
    }
}(), aytmad.gallery = {}, aytmad.gallery = function() {
    var a = jQuery('a[data-toggle="lightbox"]'),
        b = function() {
            jQuery.exists(a) && a.on("click", function(a) {
                a.preventDefault(), jQuery(this).ekkoLightbox({
                    onShown: function() {
                        var a = this.modal_dialog,
                            b = this.$element.attr("data-size"),
                            c = this.$element.attr("href"),
                            d = jQuery("<a/>").attr({
                                "class": "gallery-link",
                                href: c
                            }).text("Descargar").append('<span class="gallery-text">' + b + "</span>");
                        aytmad.utils.downloadSupport() ? d.attr("download", c.replace(/^.*[\\\/]/, "")) : d.attr("target", "_blank"), a.find(".modal-footer").prepend(d)
                    }
                })
            })
        };
    return {
        init: b
    }
}(), aytmad.videoplayer = {}, aytmad.videoplayer = function() {
    var a = function() {
            var a = jQuery(".currentvideo");
            a.each(function(a, c) {
                var d = jQuery(c),
                    e = "videoPlayer" + a;
                d.attr("id", e), b(d)
            })
        },
        b = function(a) {
            var b = a.data("height"),
                c = a.data("width"),
                d = a.data("image"),
                e = a.data("urlhtml5"),
                f = '<video width="' + c + '" height="' + b + '" poster="' + d + '" controls=""><source src="' + e + '" type="video/mp4"></source></video>';
            a.html(f)
        };
    return {
        init: a
    }
}(), aytmad.tree = {}, aytmad.tree = function() {
    var a = jQuery(".tree"),
        b = function() {
            jQuery.exists(a) && (c(), d())
        },
        c = function() {
            var b = a.find("li:has(ul)");
            b.addClass("parent_li"), b.children(".tree-header").prepend('<a href="#" class="tree-toggle plus" title="' + aytmad.i18n.desplegar + '"></a>'), b.find(" > ul > li").hide()
        },
        d = function() {
            a.find("li.parent_li > .tree-header > a.tree-toggle").on("click", function(a) {
                a.preventDefault();
                var b = jQuery(this),
                    c = b.closest("li.parent_li").find(" > ul > li");
                b.toggleClass("plus"), b.hasClass("plus") ? b.attr("title", aytmad.i18n.desplegar) : b.attr("title", aytmad.i18n.ocultar), c.toggle(), a.stopPropagation()
            })
        };
    return {
        init: b
    }
}(), aytmad.nxc = {}, aytmad.nxc = function() {
    var a = jQuery("#nxc"),
        b = a.find("ul.menu"),
        c = function() {
            if (jQuery.exists(a) && jQuery.exists(b)) {
                var c = a.find(".menuVertical"),
                    d = c.find("ul.menu"),
                    e = jQuery("ul.menu li:first-child a").attr("title"),
                    f = jQuery("<a/>").attr({
                        href: "#",
                        "class": "nxc-toggle-link"
                    }).text(e);
                c.prepend(f), f.on("click", function(a) {
                    a.preventDefault(), d.toggleClass("menu-active")
                })
            }
        };
    return {
        init: c
    }
}();
