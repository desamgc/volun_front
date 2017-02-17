
! function(a, b) {
    "object" == typeof module && "object" == typeof module.exports ? module.exports = a.document ? b(a, !0) : function(a) {
        if (!a.document) throw new Error("jQuery requires a window with a document");
        return b(a)
    } : b(a)
}("undefined" != typeof window ? window : this, function(a, b) {
    function c(a) {
        var b = a.length,
            c = eb.type(a);
        return "function" === c || eb.isWindow(a) ? !1 : 1 === a.nodeType && b ? !0 : "array" === c || 0 === b || "number" == typeof b && b > 0 && b - 1 in a
    }

    function d(a, b, c) {
        if (eb.isFunction(b)) return eb.grep(a, function(a, d) {
            return !!b.call(a, d, a) !== c
        });
        if (b.nodeType) return eb.grep(a, function(a) {
            return a === b !== c
        });
        if ("string" == typeof b) {
            if (mb.test(b)) return eb.filter(b, a, c);
            b = eb.filter(b, a)
        }
        return eb.grep(a, function(a) {
            return eb.inArray(a, b) >= 0 !== c
        })
    }

    function e(a, b) {
        do a = a[b]; while (a && 1 !== a.nodeType);
        return a
    }

    function f(a) {
        var b = ub[a] = {};
        return eb.each(a.match(tb) || [], function(a, c) {
            b[c] = !0
        }), b
    }

    function g() {
        ob.addEventListener ? (ob.removeEventListener("DOMContentLoaded", h, !1), a.removeEventListener("load", h, !1)) : (ob.detachEvent("onreadystatechange", h), a.detachEvent("onload", h))
    }

    function h() {
        (ob.addEventListener || "load" === event.type || "complete" === ob.readyState) && (g(), eb.ready())
    }

    function i(a, b, c) {
        if (void 0 === c && 1 === a.nodeType) {
            var d = "data-" + b.replace(zb, "-$1").toLowerCase();
            if (c = a.getAttribute(d), "string" == typeof c) {
                try {
                    c = "true" === c ? !0 : "false" === c ? !1 : "null" === c ? null : +c + "" === c ? +c : yb.test(c) ? eb.parseJSON(c) : c
                } catch (e) {}
                eb.data(a, b, c)
            } else c = void 0
        }
        return c
    }

    function j(a) {
        var b;
        for (b in a)
            if (("data" !== b || !eb.isEmptyObject(a[b])) && "toJSON" !== b) return !1;
        return !0
    }

    function k(a, b, c, d) {
        if (eb.acceptData(a)) {
            var e, f, g = eb.expando,
                h = a.nodeType,
                i = h ? eb.cache : a,
                j = h ? a[g] : a[g] && g;
            if (j && i[j] && (d || i[j].data) || void 0 !== c || "string" != typeof b) return j || (j = h ? a[g] = W.pop() || eb.guid++ : g), i[j] || (i[j] = h ? {} : {
                toJSON: eb.noop
            }), ("object" == typeof b || "function" == typeof b) && (d ? i[j] = eb.extend(i[j], b) : i[j].data = eb.extend(i[j].data, b)), f = i[j], d || (f.data || (f.data = {}), f = f.data), void 0 !== c && (f[eb.camelCase(b)] = c), "string" == typeof b ? (e = f[b], null == e && (e = f[eb.camelCase(b)])) : e = f, e
        }
    }

    function l(a, b, c) {
        if (eb.acceptData(a)) {
            var d, e, f = a.nodeType,
                g = f ? eb.cache : a,
                h = f ? a[eb.expando] : eb.expando;
            if (g[h]) {
                if (b && (d = c ? g[h] : g[h].data)) {
                    eb.isArray(b) ? b = b.concat(eb.map(b, eb.camelCase)) : b in d ? b = [b] : (b = eb.camelCase(b), b = b in d ? [b] : b.split(" ")), e = b.length;
                    for (; e--;) delete d[b[e]];
                    if (c ? !j(d) : !eb.isEmptyObject(d)) return
                }(c || (delete g[h].data, j(g[h]))) && (f ? eb.cleanData([a], !0) : cb.deleteExpando || g != g.window ? delete g[h] : g[h] = null)
            }
        }
    }

    function m() {
        return !0
    }

    function n() {
        return !1
    }

    function o() {
        try {
            return ob.activeElement
        } catch (a) {}
    }

    function p(a) {
        var b = Kb.split("|"),
            c = a.createDocumentFragment();
        if (c.createElement)
            for (; b.length;) c.createElement(b.pop());
        return c
    }

    function q(a, b) {
        var c, d, e = 0,
            f = typeof a.getElementsByTagName !== xb ? a.getElementsByTagName(b || "*") : typeof a.querySelectorAll !== xb ? a.querySelectorAll(b || "*") : void 0;
        if (!f)
            for (f = [], c = a.childNodes || a; null != (d = c[e]); e++) !b || eb.nodeName(d, b) ? f.push(d) : eb.merge(f, q(d, b));
        return void 0 === b || b && eb.nodeName(a, b) ? eb.merge([a], f) : f
    }

    function r(a) {
        Eb.test(a.type) && (a.defaultChecked = a.checked)
    }

    function s(a, b) {
        return eb.nodeName(a, "table") && eb.nodeName(11 !== b.nodeType ? b : b.firstChild, "tr") ? a.getElementsByTagName("tbody")[0] || a.appendChild(a.ownerDocument.createElement("tbody")) : a
    }

    function t(a) {
        return a.type = (null !== eb.find.attr(a, "type")) + "/" + a.type, a
    }

    function u(a) {
        var b = Vb.exec(a.type);
        return b ? a.type = b[1] : a.removeAttribute("type"), a
    }

    function v(a, b) {
        for (var c, d = 0; null != (c = a[d]); d++) eb._data(c, "globalEval", !b || eb._data(b[d], "globalEval"))
    }

    function w(a, b) {
        if (1 === b.nodeType && eb.hasData(a)) {
            var c, d, e, f = eb._data(a),
                g = eb._data(b, f),
                h = f.events;
            if (h) {
                delete g.handle, g.events = {};
                for (c in h)
                    for (d = 0, e = h[c].length; e > d; d++) eb.event.add(b, c, h[c][d])
            }
            g.data && (g.data = eb.extend({}, g.data))
        }
    }

    function x(a, b) {
        var c, d, e;
        if (1 === b.nodeType) {
            if (c = b.nodeName.toLowerCase(), !cb.noCloneEvent && b[eb.expando]) {
                e = eb._data(b);
                for (d in e.events) eb.removeEvent(b, d, e.handle);
                b.removeAttribute(eb.expando)
            }
            "script" === c && b.text !== a.text ? (t(b).text = a.text, u(b)) : "object" === c ? (b.parentNode && (b.outerHTML = a.outerHTML), cb.html5Clone && a.innerHTML && !eb.trim(b.innerHTML) && (b.innerHTML = a.innerHTML)) : "input" === c && Eb.test(a.type) ? (b.defaultChecked = b.checked = a.checked, b.value !== a.value && (b.value = a.value)) : "option" === c ? b.defaultSelected = b.selected = a.defaultSelected : ("input" === c || "textarea" === c) && (b.defaultValue = a.defaultValue)
        }
    }

    function y(b, c) {
        var d, e = eb(c.createElement(b)).appendTo(c.body),
            f = a.getDefaultComputedStyle && (d = a.getDefaultComputedStyle(e[0])) ? d.display : eb.css(e[0], "display");
        return e.detach(), f
    }

    function z(a) {
        var b = ob,
            c = _b[a];
        return c || (c = y(a, b), "none" !== c && c || ($b = ($b || eb("<iframe frameborder='0' width='0' height='0'/>")).appendTo(b.documentElement), b = ($b[0].contentWindow || $b[0].contentDocument).document, b.write(), b.close(), c = y(a, b), $b.detach()), _b[a] = c), c
    }

    function A(a, b) {
        return {
            get: function() {
                var c = a();
                if (null != c) return c ? void delete this.get : (this.get = b).apply(this, arguments)
            }
        }
    }

    function B(a, b) {
        if (b in a) return b;
        for (var c = b.charAt(0).toUpperCase() + b.slice(1), d = b, e = mc.length; e--;)
            if (b = mc[e] + c, b in a) return b;
        return d
    }

    function C(a, b) {
        for (var c, d, e, f = [], g = 0, h = a.length; h > g; g++) d = a[g], d.style && (f[g] = eb._data(d, "olddisplay"), c = d.style.display, b ? (f[g] || "none" !== c || (d.style.display = ""), "" === d.style.display && Cb(d) && (f[g] = eb._data(d, "olddisplay", z(d.nodeName)))) : (e = Cb(d), (c && "none" !== c || !e) && eb._data(d, "olddisplay", e ? c : eb.css(d, "display"))));
        for (g = 0; h > g; g++) d = a[g], d.style && (b && "none" !== d.style.display && "" !== d.style.display || (d.style.display = b ? f[g] || "" : "none"));
        return a
    }

    function D(a, b, c) {
        var d = ic.exec(b);
        return d ? Math.max(0, d[1] - (c || 0)) + (d[2] || "px") : b
    }

    function E(a, b, c, d, e) {
        for (var f = c === (d ? "border" : "content") ? 4 : "width" === b ? 1 : 0, g = 0; 4 > f; f += 2) "margin" === c && (g += eb.css(a, c + Bb[f], !0, e)), d ? ("content" === c && (g -= eb.css(a, "padding" + Bb[f], !0, e)), "margin" !== c && (g -= eb.css(a, "border" + Bb[f] + "Width", !0, e))) : (g += eb.css(a, "padding" + Bb[f], !0, e), "padding" !== c && (g += eb.css(a, "border" + Bb[f] + "Width", !0, e)));
        return g
    }

    function F(a, b, c) {
        var d = !0,
            e = "width" === b ? a.offsetWidth : a.offsetHeight,
            f = ac(a),
            g = cb.boxSizing && "border-box" === eb.css(a, "boxSizing", !1, f);
        if (0 >= e || null == e) {
            if (e = bc(a, b, f), (0 > e || null == e) && (e = a.style[b]), dc.test(e)) return e;
            d = g && (cb.boxSizingReliable() || e === a.style[b]), e = parseFloat(e) || 0
        }
        return e + E(a, b, c || (g ? "border" : "content"), d, f) + "px"
    }

    function G(a, b, c, d, e) {
        return new G.prototype.init(a, b, c, d, e)
    }

    function H() {
        return setTimeout(function() {
            nc = void 0
        }), nc = eb.now()
    }

    function I(a, b) {
        var c, d = {
                height: a
            },
            e = 0;
        for (b = b ? 1 : 0; 4 > e; e += 2 - b) c = Bb[e], d["margin" + c] = d["padding" + c] = a;
        return b && (d.opacity = d.width = a), d
    }

    function J(a, b, c) {
        for (var d, e = (tc[b] || []).concat(tc["*"]), f = 0, g = e.length; g > f; f++)
            if (d = e[f].call(c, b, a)) return d
    }

    function K(a, b, c) {
        var d, e, f, g, h, i, j, k, l = this,
            m = {},
            n = a.style,
            o = a.nodeType && Cb(a),
            p = eb._data(a, "fxshow");
        c.queue || (h = eb._queueHooks(a, "fx"), null == h.unqueued && (h.unqueued = 0, i = h.empty.fire, h.empty.fire = function() {
            h.unqueued || i()
        }), h.unqueued++, l.always(function() {
            l.always(function() {
                h.unqueued--, eb.queue(a, "fx").length || h.empty.fire()
            })
        })), 1 === a.nodeType && ("height" in b || "width" in b) && (c.overflow = [n.overflow, n.overflowX, n.overflowY], j = eb.css(a, "display"), k = "none" === j ? eb._data(a, "olddisplay") || z(a.nodeName) : j, "inline" === k && "none" === eb.css(a, "float") && (cb.inlineBlockNeedsLayout && "inline" !== z(a.nodeName) ? n.zoom = 1 : n.display = "inline-block")), c.overflow && (n.overflow = "hidden", cb.shrinkWrapBlocks() || l.always(function() {
            n.overflow = c.overflow[0], n.overflowX = c.overflow[1], n.overflowY = c.overflow[2]
        }));
        for (d in b)
            if (e = b[d], pc.exec(e)) {
                if (delete b[d], f = f || "toggle" === e, e === (o ? "hide" : "show")) {
                    if ("show" !== e || !p || void 0 === p[d]) continue;
                    o = !0
                }
                m[d] = p && p[d] || eb.style(a, d)
            } else j = void 0;
        if (eb.isEmptyObject(m)) "inline" === ("none" === j ? z(a.nodeName) : j) && (n.display = j);
        else {
            p ? "hidden" in p && (o = p.hidden) : p = eb._data(a, "fxshow", {}), f && (p.hidden = !o), o ? eb(a).show() : l.done(function() {
                eb(a).hide()
            }), l.done(function() {
                var b;
                eb._removeData(a, "fxshow");
                for (b in m) eb.style(a, b, m[b])
            });
            for (d in m) g = J(o ? p[d] : 0, d, l), d in p || (p[d] = g.start, o && (g.end = g.start, g.start = "width" === d || "height" === d ? 1 : 0))
        }
    }

    function L(a, b) {
        var c, d, e, f, g;
        for (c in a)
            if (d = eb.camelCase(c), e = b[d], f = a[c], eb.isArray(f) && (e = f[1], f = a[c] = f[0]), c !== d && (a[d] = f, delete a[c]), g = eb.cssHooks[d], g && "expand" in g) {
                f = g.expand(f), delete a[d];
                for (c in f) c in a || (a[c] = f[c], b[c] = e)
            } else b[d] = e
    }

    function M(a, b, c) {
        var d, e, f = 0,
            g = sc.length,
            h = eb.Deferred().always(function() {
                delete i.elem
            }),
            i = function() {
                if (e) return !1;
                for (var b = nc || H(), c = Math.max(0, j.startTime + j.duration - b), d = c / j.duration || 0, f = 1 - d, g = 0, i = j.tweens.length; i > g; g++) j.tweens[g].run(f);
                return h.notifyWith(a, [j, f, c]), 1 > f && i ? c : (h.resolveWith(a, [j]), !1)
            },
            j = h.promise({
                elem: a,
                props: eb.extend({}, b),
                opts: eb.extend(!0, {
                    specialEasing: {}
                }, c),
                originalProperties: b,
                originalOptions: c,
                startTime: nc || H(),
                duration: c.duration,
                tweens: [],
                createTween: function(b, c) {
                    var d = eb.Tween(a, j.opts, b, c, j.opts.specialEasing[b] || j.opts.easing);
                    return j.tweens.push(d), d
                },
                stop: function(b) {
                    var c = 0,
                        d = b ? j.tweens.length : 0;
                    if (e) return this;
                    for (e = !0; d > c; c++) j.tweens[c].run(1);
                    return b ? h.resolveWith(a, [j, b]) : h.rejectWith(a, [j, b]), this
                }
            }),
            k = j.props;
        for (L(k, j.opts.specialEasing); g > f; f++)
            if (d = sc[f].call(j, a, k, j.opts)) return d;
        return eb.map(k, J, j), eb.isFunction(j.opts.start) && j.opts.start.call(a, j), eb.fx.timer(eb.extend(i, {
            elem: a,
            anim: j,
            queue: j.opts.queue
        })), j.progress(j.opts.progress).done(j.opts.done, j.opts.complete).fail(j.opts.fail).always(j.opts.always)
    }

    function N(a) {
        return function(b, c) {
            "string" != typeof b && (c = b, b = "*");
            var d, e = 0,
                f = b.toLowerCase().match(tb) || [];
            if (eb.isFunction(c))
                for (; d = f[e++];) "+" === d.charAt(0) ? (d = d.slice(1) || "*", (a[d] = a[d] || []).unshift(c)) : (a[d] = a[d] || []).push(c)
        }
    }

    function O(a, b, c, d) {
        function e(h) {
            var i;
            return f[h] = !0, eb.each(a[h] || [], function(a, h) {
                var j = h(b, c, d);
                return "string" != typeof j || g || f[j] ? g ? !(i = j) : void 0 : (b.dataTypes.unshift(j), e(j), !1)
            }), i
        }
        var f = {},
            g = a === Rc;
        return e(b.dataTypes[0]) || !f["*"] && e("*")
    }

    function P(a, b) {
        var c, d, e = eb.ajaxSettings.flatOptions || {};
        for (d in b) void 0 !== b[d] && ((e[d] ? a : c || (c = {}))[d] = b[d]);
        return c && eb.extend(!0, a, c), a
    }

    function Q(a, b, c) {
        for (var d, e, f, g, h = a.contents, i = a.dataTypes;
            "*" === i[0];) i.shift(), void 0 === e && (e = a.mimeType || b.getResponseHeader("Content-Type"));
        if (e)
            for (g in h)
                if (h[g] && h[g].test(e)) {
                    i.unshift(g);
                    break
                }
        if (i[0] in c) f = i[0];
        else {
            for (g in c) {
                if (!i[0] || a.converters[g + " " + i[0]]) {
                    f = g;
                    break
                }
                d || (d = g)
            }
            f = f || d
        }
        return f ? (f !== i[0] && i.unshift(f), c[f]) : void 0
    }

    function R(a, b, c, d) {
        var e, f, g, h, i, j = {},
            k = a.dataTypes.slice();
        if (k[1])
            for (g in a.converters) j[g.toLowerCase()] = a.converters[g];
        for (f = k.shift(); f;)
            if (a.responseFields[f] && (c[a.responseFields[f]] = b), !i && d && a.dataFilter && (b = a.dataFilter(b, a.dataType)), i = f, f = k.shift())
                if ("*" === f) f = i;
                else if ("*" !== i && i !== f) {
            if (g = j[i + " " + f] || j["* " + f], !g)
                for (e in j)
                    if (h = e.split(" "), h[1] === f && (g = j[i + " " + h[0]] || j["* " + h[0]])) {
                        g === !0 ? g = j[e] : j[e] !== !0 && (f = h[0], k.unshift(h[1]));
                        break
                    }
            if (g !== !0)
                if (g && a["throws"]) b = g(b);
                else try {
                    b = g(b)
                } catch (l) {
                    return {
                        state: "parsererror",
                        error: g ? l : "No conversion from " + i + " to " + f
                    }
                }
        }
        return {
            state: "success",
            data: b
        }
    }

    function S(a, b, c, d) {
        var e;
        if (eb.isArray(b)) eb.each(b, function(b, e) {
            c || Vc.test(a) ? d(a, e) : S(a + "[" + ("object" == typeof e ? b : "") + "]", e, c, d)
        });
        else if (c || "object" !== eb.type(b)) d(a, b);
        else
            for (e in b) S(a + "[" + e + "]", b[e], c, d)
    }

    function T() {
        try {
            return new a.XMLHttpRequest
        } catch (b) {}
    }

    function U() {
        try {
            return new a.ActiveXObject("Microsoft.XMLHTTP")
        } catch (b) {}
    }

    function V(a) {
        return eb.isWindow(a) ? a : 9 === a.nodeType ? a.defaultView || a.parentWindow : !1
    }
    var W = [],
        X = W.slice,
        Y = W.concat,
        Z = W.push,
        $ = W.indexOf,
        _ = {},
        ab = _.toString,
        bb = _.hasOwnProperty,
        cb = {},
        db = "1.11.2",
        eb = function(a, b) {
            return new eb.fn.init(a, b)
        },
        fb = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
        gb = /^-ms-/,
        hb = /-([\da-z])/gi,
        ib = function(a, b) {
            return b.toUpperCase()
        };
    eb.fn = eb.prototype = {
        jquery: db,
        constructor: eb,
        selector: "",
        length: 0,
        toArray: function() {
            return X.call(this)
        },
        get: function(a) {
            return null != a ? 0 > a ? this[a + this.length] : this[a] : X.call(this)
        },
        pushStack: function(a) {
            var b = eb.merge(this.constructor(), a);
            return b.prevObject = this, b.context = this.context, b
        },
        each: function(a, b) {
            return eb.each(this, a, b)
        },
        map: function(a) {
            return this.pushStack(eb.map(this, function(b, c) {
                return a.call(b, c, b)
            }))
        },
        slice: function() {
            return this.pushStack(X.apply(this, arguments))
        },
        first: function() {
            return this.eq(0)
        },
        last: function() {
            return this.eq(-1)
        },
        eq: function(a) {
            var b = this.length,
                c = +a + (0 > a ? b : 0);
            return this.pushStack(c >= 0 && b > c ? [this[c]] : [])
        },
        end: function() {
            return this.prevObject || this.constructor(null)
        },
        push: Z,
        sort: W.sort,
        splice: W.splice
    }, eb.extend = eb.fn.extend = function() {
        var a, b, c, d, e, f, g = arguments[0] || {},
            h = 1,
            i = arguments.length,
            j = !1;
        for ("boolean" == typeof g && (j = g, g = arguments[h] || {}, h++), "object" == typeof g || eb.isFunction(g) || (g = {}), h === i && (g = this, h--); i > h; h++)
            if (null != (e = arguments[h]))
                for (d in e) a = g[d], c = e[d], g !== c && (j && c && (eb.isPlainObject(c) || (b = eb.isArray(c))) ? (b ? (b = !1, f = a && eb.isArray(a) ? a : []) : f = a && eb.isPlainObject(a) ? a : {}, g[d] = eb.extend(j, f, c)) : void 0 !== c && (g[d] = c));
        return g
    }, eb.extend({
        expando: "jQuery" + (db + Math.random()).replace(/\D/g, ""),
        isReady: !0,
        error: function(a) {
            throw new Error(a)
        },
        noop: function() {},
        isFunction: function(a) {
            return "function" === eb.type(a)
        },
        isArray: Array.isArray || function(a) {
            return "array" === eb.type(a)
        },
        isWindow: function(a) {
            return null != a && a == a.window
        },
        isNumeric: function(a) {
            return !eb.isArray(a) && a - parseFloat(a) + 1 >= 0
        },
        isEmptyObject: function(a) {
            var b;
            for (b in a) return !1;
            return !0
        },
        isPlainObject: function(a) {
            var b;
            if (!a || "object" !== eb.type(a) || a.nodeType || eb.isWindow(a)) return !1;
            try {
                if (a.constructor && !bb.call(a, "constructor") && !bb.call(a.constructor.prototype, "isPrototypeOf")) return !1
            } catch (c) {
                return !1
            }
            if (cb.ownLast)
                for (b in a) return bb.call(a, b);
            for (b in a);
            return void 0 === b || bb.call(a, b)
        },
        type: function(a) {
            return null == a ? a + "" : "object" == typeof a || "function" == typeof a ? _[ab.call(a)] || "object" : typeof a
        },
        globalEval: function(b) {
            b && eb.trim(b) && (a.execScript || function(b) {
                a.eval.call(a, b)
            })(b)
        },
        camelCase: function(a) {
            return a.replace(gb, "ms-").replace(hb, ib)
        },
        nodeName: function(a, b) {
            return a.nodeName && a.nodeName.toLowerCase() === b.toLowerCase()
        },
        each: function(a, b, d) {
            var e, f = 0,
                g = a.length,
                h = c(a);
            if (d) {
                if (h)
                    for (; g > f && (e = b.apply(a[f], d), e !== !1); f++);
                else
                    for (f in a)
                        if (e = b.apply(a[f], d), e === !1) break
            } else if (h)
                for (; g > f && (e = b.call(a[f], f, a[f]), e !== !1); f++);
            else
                for (f in a)
                    if (e = b.call(a[f], f, a[f]), e === !1) break; return a
        },
        trim: function(a) {
            return null == a ? "" : (a + "").replace(fb, "")
        },
        makeArray: function(a, b) {
            var d = b || [];
            return null != a && (c(Object(a)) ? eb.merge(d, "string" == typeof a ? [a] : a) : Z.call(d, a)), d
        },
        inArray: function(a, b, c) {
            var d;
            if (b) {
                if ($) return $.call(b, a, c);
                for (d = b.length, c = c ? 0 > c ? Math.max(0, d + c) : c : 0; d > c; c++)
                    if (c in b && b[c] === a) return c
            }
            return -1
        },
        merge: function(a, b) {
            for (var c = +b.length, d = 0, e = a.length; c > d;) a[e++] = b[d++];
            if (c !== c)
                for (; void 0 !== b[d];) a[e++] = b[d++];
            return a.length = e, a
        },
        grep: function(a, b, c) {
            for (var d, e = [], f = 0, g = a.length, h = !c; g > f; f++) d = !b(a[f], f), d !== h && e.push(a[f]);
            return e
        },
        map: function(a, b, d) {
            var e, f = 0,
                g = a.length,
                h = c(a),
                i = [];
            if (h)
                for (; g > f; f++) e = b(a[f], f, d), null != e && i.push(e);
            else
                for (f in a) e = b(a[f], f, d), null != e && i.push(e);
            return Y.apply([], i)
        },
        guid: 1,
        proxy: function(a, b) {
            var c, d, e;
            return "string" == typeof b && (e = a[b], b = a, a = e), eb.isFunction(a) ? (c = X.call(arguments, 2), d = function() {
                return a.apply(b || this, c.concat(X.call(arguments)))
            }, d.guid = a.guid = a.guid || eb.guid++, d) : void 0
        },
        now: function() {
            return +new Date
        },
        support: cb
    }), eb.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(a, b) {
        _["[object " + b + "]"] = b.toLowerCase()
    });
    var jb = function(a) {
        function b(a, b, c, d) {
            var e, f, g, h, i, j, l, n, o, p;
            if ((b ? b.ownerDocument || b : O) !== G && F(b), b = b || G, c = c || [], h = b.nodeType, "string" != typeof a || !a || 1 !== h && 9 !== h && 11 !== h) return c;
            if (!d && I) {
                if (11 !== h && (e = sb.exec(a)))
                    if (g = e[1]) {
                        if (9 === h) {
                            if (f = b.getElementById(g), !f || !f.parentNode) return c;
                            if (f.id === g) return c.push(f), c
                        } else if (b.ownerDocument && (f = b.ownerDocument.getElementById(g)) && M(b, f) && f.id === g) return c.push(f), c
                    } else {
                        if (e[2]) return $.apply(c, b.getElementsByTagName(a)), c;
                        if ((g = e[3]) && v.getElementsByClassName) return $.apply(c, b.getElementsByClassName(g)), c
                    }
                if (v.qsa && (!J || !J.test(a))) {
                    if (n = l = N, o = b, p = 1 !== h && a, 1 === h && "object" !== b.nodeName.toLowerCase()) {
                        for (j = z(a), (l = b.getAttribute("id")) ? n = l.replace(ub, "\\$&") : b.setAttribute("id", n), n = "[id='" + n + "'] ", i = j.length; i--;) j[i] = n + m(j[i]);
                        o = tb.test(a) && k(b.parentNode) || b, p = j.join(",")
                    }
                    if (p) try {
                        return $.apply(c, o.querySelectorAll(p)), c
                    } catch (q) {} finally {
                        l || b.removeAttribute("id")
                    }
                }
            }
            return B(a.replace(ib, "$1"), b, c, d)
        }

        function c() {
            function a(c, d) {
                return b.push(c + " ") > w.cacheLength && delete a[b.shift()], a[c + " "] = d
            }
            var b = [];
            return a
        }

        function d(a) {
            return a[N] = !0, a
        }

        function e(a) {
            var b = G.createElement("div");
            try {
                return !!a(b)
            } catch (c) {
                return !1
            } finally {
                b.parentNode && b.parentNode.removeChild(b), b = null
            }
        }

        function f(a, b) {
            for (var c = a.split("|"), d = a.length; d--;) w.attrHandle[c[d]] = b
        }

        function g(a, b) {
            var c = b && a,
                d = c && 1 === a.nodeType && 1 === b.nodeType && (~b.sourceIndex || V) - (~a.sourceIndex || V);
            if (d) return d;
            if (c)
                for (; c = c.nextSibling;)
                    if (c === b) return -1;
            return a ? 1 : -1
        }

        function h(a) {
            return function(b) {
                var c = b.nodeName.toLowerCase();
                return "input" === c && b.type === a
            }
        }

        function i(a) {
            return function(b) {
                var c = b.nodeName.toLowerCase();
                return ("input" === c || "button" === c) && b.type === a
            }
        }

        function j(a) {
            return d(function(b) {
                return b = +b, d(function(c, d) {
                    for (var e, f = a([], c.length, b), g = f.length; g--;) c[e = f[g]] && (c[e] = !(d[e] = c[e]))
                })
            })
        }

        function k(a) {
            return a && "undefined" != typeof a.getElementsByTagName && a
        }

        function l() {}

        function m(a) {
            for (var b = 0, c = a.length, d = ""; c > b; b++) d += a[b].value;
            return d
        }

        function n(a, b, c) {
            var d = b.dir,
                e = c && "parentNode" === d,
                f = Q++;
            return b.first ? function(b, c, f) {
                for (; b = b[d];)
                    if (1 === b.nodeType || e) return a(b, c, f)
            } : function(b, c, g) {
                var h, i, j = [P, f];
                if (g) {
                    for (; b = b[d];)
                        if ((1 === b.nodeType || e) && a(b, c, g)) return !0
                } else
                    for (; b = b[d];)
                        if (1 === b.nodeType || e) {
                            if (i = b[N] || (b[N] = {}), (h = i[d]) && h[0] === P && h[1] === f) return j[2] = h[2];
                            if (i[d] = j, j[2] = a(b, c, g)) return !0
                        }
            }
        }

        function o(a) {
            return a.length > 1 ? function(b, c, d) {
                for (var e = a.length; e--;)
                    if (!a[e](b, c, d)) return !1;
                return !0
            } : a[0]
        }

        function p(a, c, d) {
            for (var e = 0, f = c.length; f > e; e++) b(a, c[e], d);
            return d
        }

        function q(a, b, c, d, e) {
            for (var f, g = [], h = 0, i = a.length, j = null != b; i > h; h++)(f = a[h]) && (!c || c(f, d, e)) && (g.push(f), j && b.push(h));
            return g
        }

        function r(a, b, c, e, f, g) {
            return e && !e[N] && (e = r(e)), f && !f[N] && (f = r(f, g)), d(function(d, g, h, i) {
                var j, k, l, m = [],
                    n = [],
                    o = g.length,
                    r = d || p(b || "*", h.nodeType ? [h] : h, []),
                    s = !a || !d && b ? r : q(r, m, a, h, i),
                    t = c ? f || (d ? a : o || e) ? [] : g : s;
                if (c && c(s, t, h, i), e)
                    for (j = q(t, n), e(j, [], h, i), k = j.length; k--;)(l = j[k]) && (t[n[k]] = !(s[n[k]] = l));
                if (d) {
                    if (f || a) {
                        if (f) {
                            for (j = [], k = t.length; k--;)(l = t[k]) && j.push(s[k] = l);
                            f(null, t = [], j, i)
                        }
                        for (k = t.length; k--;)(l = t[k]) && (j = f ? ab(d, l) : m[k]) > -1 && (d[j] = !(g[j] = l))
                    }
                } else t = q(t === g ? t.splice(o, t.length) : t), f ? f(null, g, t, i) : $.apply(g, t)
            })
        }

        function s(a) {
            for (var b, c, d, e = a.length, f = w.relative[a[0].type], g = f || w.relative[" "], h = f ? 1 : 0, i = n(function(a) {
                    return a === b
                }, g, !0), j = n(function(a) {
                    return ab(b, a) > -1
                }, g, !0), k = [function(a, c, d) {
                    var e = !f && (d || c !== C) || ((b = c).nodeType ? i(a, c, d) : j(a, c, d));
                    return b = null, e
                }]; e > h; h++)
                if (c = w.relative[a[h].type]) k = [n(o(k), c)];
                else {
                    if (c = w.filter[a[h].type].apply(null, a[h].matches), c[N]) {
                        for (d = ++h; e > d && !w.relative[a[d].type]; d++);
                        return r(h > 1 && o(k), h > 1 && m(a.slice(0, h - 1).concat({
                            value: " " === a[h - 2].type ? "*" : ""
                        })).replace(ib, "$1"), c, d > h && s(a.slice(h, d)), e > d && s(a = a.slice(d)), e > d && m(a))
                    }
                    k.push(c)
                }
            return o(k)
        }

        function t(a, c) {
            var e = c.length > 0,
                f = a.length > 0,
                g = function(d, g, h, i, j) {
                    var k, l, m, n = 0,
                        o = "0",
                        p = d && [],
                        r = [],
                        s = C,
                        t = d || f && w.find.TAG("*", j),
                        u = P += null == s ? 1 : Math.random() || .1,
                        v = t.length;
                    for (j && (C = g !== G && g); o !== v && null != (k = t[o]); o++) {
                        if (f && k) {
                            for (l = 0; m = a[l++];)
                                if (m(k, g, h)) {
                                    i.push(k);
                                    break
                                }
                            j && (P = u)
                        }
                        e && ((k = !m && k) && n--, d && p.push(k))
                    }
                    if (n += o, e && o !== n) {
                        for (l = 0; m = c[l++];) m(p, r, g, h);
                        if (d) {
                            if (n > 0)
                                for (; o--;) p[o] || r[o] || (r[o] = Y.call(i));
                            r = q(r)
                        }
                        $.apply(i, r), j && !d && r.length > 0 && n + c.length > 1 && b.uniqueSort(i)
                    }
                    return j && (P = u, C = s), p
                };
            return e ? d(g) : g
        }
        var u, v, w, x, y, z, A, B, C, D, E, F, G, H, I, J, K, L, M, N = "sizzle" + 1 * new Date,
            O = a.document,
            P = 0,
            Q = 0,
            R = c(),
            S = c(),
            T = c(),
            U = function(a, b) {
                return a === b && (E = !0), 0
            },
            V = 1 << 31,
            W = {}.hasOwnProperty,
            X = [],
            Y = X.pop,
            Z = X.push,
            $ = X.push,
            _ = X.slice,
            ab = function(a, b) {
                for (var c = 0, d = a.length; d > c; c++)
                    if (a[c] === b) return c;
                return -1
            },
            bb = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",
            cb = "[\\x20\\t\\r\\n\\f]",
            db = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",
            eb = db.replace("w", "w#"),
            fb = "\\[" + cb + "*(" + db + ")(?:" + cb + "*([*^$|!~]?=)" + cb + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + eb + "))|)" + cb + "*\\]",
            gb = ":(" + db + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + fb + ")*)|.*)\\)|)",
            hb = new RegExp(cb + "+", "g"),
            ib = new RegExp("^" + cb + "+|((?:^|[^\\\\])(?:\\\\.)*)" + cb + "+$", "g"),
            jb = new RegExp("^" + cb + "*," + cb + "*"),
            kb = new RegExp("^" + cb + "*([>+~]|" + cb + ")" + cb + "*"),
            lb = new RegExp("=" + cb + "*([^\\]'\"]*?)" + cb + "*\\]", "g"),
            mb = new RegExp(gb),
            nb = new RegExp("^" + eb + "$"),
            ob = {
                ID: new RegExp("^#(" + db + ")"),
                CLASS: new RegExp("^\\.(" + db + ")"),
                TAG: new RegExp("^(" + db.replace("w", "w*") + ")"),
                ATTR: new RegExp("^" + fb),
                PSEUDO: new RegExp("^" + gb),
                CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + cb + "*(even|odd|(([+-]|)(\\d*)n|)" + cb + "*(?:([+-]|)" + cb + "*(\\d+)|))" + cb + "*\\)|)", "i"),
                bool: new RegExp("^(?:" + bb + ")$", "i"),
                needsContext: new RegExp("^" + cb + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + cb + "*((?:-\\d)?\\d*)" + cb + "*\\)|)(?=[^-]|$)", "i")
            },
            pb = /^(?:input|select|textarea|button)$/i,
            qb = /^h\d$/i,
            rb = /^[^{]+\{\s*\[native \w/,
            sb = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
            tb = /[+~]/,
            ub = /'|\\/g,
            vb = new RegExp("\\\\([\\da-f]{1,6}" + cb + "?|(" + cb + ")|.)", "ig"),
            wb = function(a, b, c) {
                var d = "0x" + b - 65536;
                return d !== d || c ? b : 0 > d ? String.fromCharCode(d + 65536) : String.fromCharCode(d >> 10 | 55296, 1023 & d | 56320)
            },
            xb = function() {
                F()
            };
        try {
            $.apply(X = _.call(O.childNodes), O.childNodes), X[O.childNodes.length].nodeType
        } catch (yb) {
            $ = {
                apply: X.length ? function(a, b) {
                    Z.apply(a, _.call(b))
                } : function(a, b) {
                    for (var c = a.length, d = 0; a[c++] = b[d++];);
                    a.length = c - 1
                }
            }
        }
        v = b.support = {}, y = b.isXML = function(a) {
            var b = a && (a.ownerDocument || a).documentElement;
            return b ? "HTML" !== b.nodeName : !1
        }, F = b.setDocument = function(a) {
            var b, c, d = a ? a.ownerDocument || a : O;
            return d !== G && 9 === d.nodeType && d.documentElement ? (G = d, H = d.documentElement, c = d.defaultView, c && c !== c.top && (c.addEventListener ? c.addEventListener("unload", xb, !1) : c.attachEvent && c.attachEvent("onunload", xb)), I = !y(d), v.attributes = e(function(a) {
                return a.className = "i", !a.getAttribute("className")
            }), v.getElementsByTagName = e(function(a) {
                return a.appendChild(d.createComment("")), !a.getElementsByTagName("*").length
            }), v.getElementsByClassName = rb.test(d.getElementsByClassName), v.getById = e(function(a) {
                return H.appendChild(a).id = N, !d.getElementsByName || !d.getElementsByName(N).length
            }), v.getById ? (w.find.ID = function(a, b) {
                if ("undefined" != typeof b.getElementById && I) {
                    var c = b.getElementById(a);
                    return c && c.parentNode ? [c] : []
                }
            }, w.filter.ID = function(a) {
                var b = a.replace(vb, wb);
                return function(a) {
                    return a.getAttribute("id") === b
                }
            }) : (delete w.find.ID, w.filter.ID = function(a) {
                var b = a.replace(vb, wb);
                return function(a) {
                    var c = "undefined" != typeof a.getAttributeNode && a.getAttributeNode("id");
                    return c && c.value === b
                }
            }), w.find.TAG = v.getElementsByTagName ? function(a, b) {
                return "undefined" != typeof b.getElementsByTagName ? b.getElementsByTagName(a) : v.qsa ? b.querySelectorAll(a) : void 0
            } : function(a, b) {
                var c, d = [],
                    e = 0,
                    f = b.getElementsByTagName(a);
                if ("*" === a) {
                    for (; c = f[e++];) 1 === c.nodeType && d.push(c);
                    return d
                }
                return f
            }, w.find.CLASS = v.getElementsByClassName && function(a, b) {
                return I ? b.getElementsByClassName(a) : void 0
            }, K = [], J = [], (v.qsa = rb.test(d.querySelectorAll)) && (e(function(a) {
                H.appendChild(a).innerHTML = "<a id='" + N + "'></a><select id='" + N + "-\f]' msallowcapture=''><option selected=''></option></select>", a.querySelectorAll("[msallowcapture^='']").length && J.push("[*^$]=" + cb + "*(?:''|\"\")"), a.querySelectorAll("[selected]").length || J.push("\\[" + cb + "*(?:value|" + bb + ")"), a.querySelectorAll("[id~=" + N + "-]").length || J.push("~="), a.querySelectorAll(":checked").length || J.push(":checked"), a.querySelectorAll("a#" + N + "+*").length || J.push(".#.+[+~]")
            }), e(function(a) {
                var b = d.createElement("input");
                b.setAttribute("type", "hidden"), a.appendChild(b).setAttribute("name", "D"), a.querySelectorAll("[name=d]").length && J.push("name" + cb + "*[*^$|!~]?="), a.querySelectorAll(":enabled").length || J.push(":enabled", ":disabled"), a.querySelectorAll("*,:x"), J.push(",.*:")
            })), (v.matchesSelector = rb.test(L = H.matches || H.webkitMatchesSelector || H.mozMatchesSelector || H.oMatchesSelector || H.msMatchesSelector)) && e(function(a) {
                v.disconnectedMatch = L.call(a, "div"), L.call(a, "[s!='']:x"), K.push("!=", gb)
            }), J = J.length && new RegExp(J.join("|")), K = K.length && new RegExp(K.join("|")), b = rb.test(H.compareDocumentPosition), M = b || rb.test(H.contains) ? function(a, b) {
                var c = 9 === a.nodeType ? a.documentElement : a,
                    d = b && b.parentNode;
                return a === d || !(!d || 1 !== d.nodeType || !(c.contains ? c.contains(d) : a.compareDocumentPosition && 16 & a.compareDocumentPosition(d)))
            } : function(a, b) {
                if (b)
                    for (; b = b.parentNode;)
                        if (b === a) return !0;
                return !1
            }, U = b ? function(a, b) {
                if (a === b) return E = !0, 0;
                var c = !a.compareDocumentPosition - !b.compareDocumentPosition;
                return c ? c : (c = (a.ownerDocument || a) === (b.ownerDocument || b) ? a.compareDocumentPosition(b) : 1, 1 & c || !v.sortDetached && b.compareDocumentPosition(a) === c ? a === d || a.ownerDocument === O && M(O, a) ? -1 : b === d || b.ownerDocument === O && M(O, b) ? 1 : D ? ab(D, a) - ab(D, b) : 0 : 4 & c ? -1 : 1)
            } : function(a, b) {
                if (a === b) return E = !0, 0;
                var c, e = 0,
                    f = a.parentNode,
                    h = b.parentNode,
                    i = [a],
                    j = [b];
                if (!f || !h) return a === d ? -1 : b === d ? 1 : f ? -1 : h ? 1 : D ? ab(D, a) - ab(D, b) : 0;
                if (f === h) return g(a, b);
                for (c = a; c = c.parentNode;) i.unshift(c);
                for (c = b; c = c.parentNode;) j.unshift(c);
                for (; i[e] === j[e];) e++;
                return e ? g(i[e], j[e]) : i[e] === O ? -1 : j[e] === O ? 1 : 0
            }, d) : G
        }, b.matches = function(a, c) {
            return b(a, null, null, c)
        }, b.matchesSelector = function(a, c) {
            if ((a.ownerDocument || a) !== G && F(a), c = c.replace(lb, "='$1']"), !(!v.matchesSelector || !I || K && K.test(c) || J && J.test(c))) try {
                var d = L.call(a, c);
                if (d || v.disconnectedMatch || a.document && 11 !== a.document.nodeType) return d
            } catch (e) {}
            return b(c, G, null, [a]).length > 0
        }, b.contains = function(a, b) {
            return (a.ownerDocument || a) !== G && F(a), M(a, b)
        }, b.attr = function(a, b) {
            (a.ownerDocument || a) !== G && F(a);
            var c = w.attrHandle[b.toLowerCase()],
                d = c && W.call(w.attrHandle, b.toLowerCase()) ? c(a, b, !I) : void 0;
            return void 0 !== d ? d : v.attributes || !I ? a.getAttribute(b) : (d = a.getAttributeNode(b)) && d.specified ? d.value : null
        }, b.error = function(a) {
            throw new Error("Syntax error, unrecognized expression: " + a)
        }, b.uniqueSort = function(a) {
            var b, c = [],
                d = 0,
                e = 0;
            if (E = !v.detectDuplicates, D = !v.sortStable && a.slice(0), a.sort(U), E) {
                for (; b = a[e++];) b === a[e] && (d = c.push(e));
                for (; d--;) a.splice(c[d], 1)
            }
            return D = null, a
        }, x = b.getText = function(a) {
            var b, c = "",
                d = 0,
                e = a.nodeType;
            if (e) {
                if (1 === e || 9 === e || 11 === e) {
                    if ("string" == typeof a.textContent) return a.textContent;
                    for (a = a.firstChild; a; a = a.nextSibling) c += x(a)
                } else if (3 === e || 4 === e) return a.nodeValue
            } else
                for (; b = a[d++];) c += x(b);
            return c
        }, w = b.selectors = {
            cacheLength: 50,
            createPseudo: d,
            match: ob,
            attrHandle: {},
            find: {},
            relative: {
                ">": {
                    dir: "parentNode",
                    first: !0
                },
                " ": {
                    dir: "parentNode"
                },
                "+": {
                    dir: "previousSibling",
                    first: !0
                },
                "~": {
                    dir: "previousSibling"
                }
            },
            preFilter: {
                ATTR: function(a) {
                    return a[1] = a[1].replace(vb, wb), a[3] = (a[3] || a[4] || a[5] || "").replace(vb, wb), "~=" === a[2] && (a[3] = " " + a[3] + " "), a.slice(0, 4)
                },
                CHILD: function(a) {
                    return a[1] = a[1].toLowerCase(), "nth" === a[1].slice(0, 3) ? (a[3] || b.error(a[0]), a[4] = +(a[4] ? a[5] + (a[6] || 1) : 2 * ("even" === a[3] || "odd" === a[3])), a[5] = +(a[7] + a[8] || "odd" === a[3])) : a[3] && b.error(a[0]), a
                },
                PSEUDO: function(a) {
                    var b, c = !a[6] && a[2];
                    return ob.CHILD.test(a[0]) ? null : (a[3] ? a[2] = a[4] || a[5] || "" : c && mb.test(c) && (b = z(c, !0)) && (b = c.indexOf(")", c.length - b) - c.length) && (a[0] = a[0].slice(0, b), a[2] = c.slice(0, b)), a.slice(0, 3))
                }
            },
            filter: {
                TAG: function(a) {
                    var b = a.replace(vb, wb).toLowerCase();
                    return "*" === a ? function() {
                        return !0
                    } : function(a) {
                        return a.nodeName && a.nodeName.toLowerCase() === b
                    }
                },
                CLASS: function(a) {
                    var b = R[a + " "];
                    return b || (b = new RegExp("(^|" + cb + ")" + a + "(" + cb + "|$)")) && R(a, function(a) {
                        return b.test("string" == typeof a.className && a.className || "undefined" != typeof a.getAttribute && a.getAttribute("class") || "")
                    })
                },
                ATTR: function(a, c, d) {
                    return function(e) {
                        var f = b.attr(e, a);
                        return null == f ? "!=" === c : c ? (f += "", "=" === c ? f === d : "!=" === c ? f !== d : "^=" === c ? d && 0 === f.indexOf(d) : "*=" === c ? d && f.indexOf(d) > -1 : "$=" === c ? d && f.slice(-d.length) === d : "~=" === c ? (" " + f.replace(hb, " ") + " ").indexOf(d) > -1 : "|=" === c ? f === d || f.slice(0, d.length + 1) === d + "-" : !1) : !0
                    }
                },
                CHILD: function(a, b, c, d, e) {
                    var f = "nth" !== a.slice(0, 3),
                        g = "last" !== a.slice(-4),
                        h = "of-type" === b;
                    return 1 === d && 0 === e ? function(a) {
                        return !!a.parentNode
                    } : function(b, c, i) {
                        var j, k, l, m, n, o, p = f !== g ? "nextSibling" : "previousSibling",
                            q = b.parentNode,
                            r = h && b.nodeName.toLowerCase(),
                            s = !i && !h;
                        if (q) {
                            if (f) {
                                for (; p;) {
                                    for (l = b; l = l[p];)
                                        if (h ? l.nodeName.toLowerCase() === r : 1 === l.nodeType) return !1;
                                    o = p = "only" === a && !o && "nextSibling"
                                }
                                return !0
                            }
                            if (o = [g ? q.firstChild : q.lastChild], g && s) {
                                for (k = q[N] || (q[N] = {}), j = k[a] || [], n = j[0] === P && j[1], m = j[0] === P && j[2], l = n && q.childNodes[n]; l = ++n && l && l[p] || (m = n = 0) || o.pop();)
                                    if (1 === l.nodeType && ++m && l === b) {
                                        k[a] = [P, n, m];
                                        break
                                    }
                            } else if (s && (j = (b[N] || (b[N] = {}))[a]) && j[0] === P) m = j[1];
                            else
                                for (;
                                    (l = ++n && l && l[p] || (m = n = 0) || o.pop()) && ((h ? l.nodeName.toLowerCase() !== r : 1 !== l.nodeType) || !++m || (s && ((l[N] || (l[N] = {}))[a] = [P, m]), l !== b)););
                            return m -= e, m === d || m % d === 0 && m / d >= 0
                        }
                    }
                },
                PSEUDO: function(a, c) {
                    var e, f = w.pseudos[a] || w.setFilters[a.toLowerCase()] || b.error("unsupported pseudo: " + a);
                    return f[N] ? f(c) : f.length > 1 ? (e = [a, a, "", c], w.setFilters.hasOwnProperty(a.toLowerCase()) ? d(function(a, b) {
                        for (var d, e = f(a, c), g = e.length; g--;) d = ab(a, e[g]), a[d] = !(b[d] = e[g])
                    }) : function(a) {
                        return f(a, 0, e)
                    }) : f
                }
            },
            pseudos: {
                not: d(function(a) {
                    var b = [],
                        c = [],
                        e = A(a.replace(ib, "$1"));
                    return e[N] ? d(function(a, b, c, d) {
                        for (var f, g = e(a, null, d, []), h = a.length; h--;)(f = g[h]) && (a[h] = !(b[h] = f))
                    }) : function(a, d, f) {
                        return b[0] = a, e(b, null, f, c), b[0] = null, !c.pop()
                    }
                }),
                has: d(function(a) {
                    return function(c) {
                        return b(a, c).length > 0
                    }
                }),
                contains: d(function(a) {
                    return a = a.replace(vb, wb),
                        function(b) {
                            return (b.textContent || b.innerText || x(b)).indexOf(a) > -1
                        }
                }),
                lang: d(function(a) {
                    return nb.test(a || "") || b.error("unsupported lang: " + a), a = a.replace(vb, wb).toLowerCase(),
                        function(b) {
                            var c;
                            do
                                if (c = I ? b.lang : b.getAttribute("xml:lang") || b.getAttribute("lang")) return c = c.toLowerCase(), c === a || 0 === c.indexOf(a + "-");
                            while ((b = b.parentNode) && 1 === b.nodeType);
                            return !1
                        }
                }),
                target: function(b) {
                    var c = a.location && a.location.hash;
                    return c && c.slice(1) === b.id
                },
                root: function(a) {
                    return a === H
                },
                focus: function(a) {
                    return a === G.activeElement && (!G.hasFocus || G.hasFocus()) && !!(a.type || a.href || ~a.tabIndex)
                },
                enabled: function(a) {
                    return a.disabled === !1
                },
                disabled: function(a) {
                    return a.disabled === !0
                },
                checked: function(a) {
                    var b = a.nodeName.toLowerCase();
                    return "input" === b && !!a.checked || "option" === b && !!a.selected
                },
                selected: function(a) {
                    return a.parentNode && a.parentNode.selectedIndex, a.selected === !0
                },
                empty: function(a) {
                    for (a = a.firstChild; a; a = a.nextSibling)
                        if (a.nodeType < 6) return !1;
                    return !0
                },
                parent: function(a) {
                    return !w.pseudos.empty(a)
                },
                header: function(a) {
                    return qb.test(a.nodeName)
                },
                input: function(a) {
                    return pb.test(a.nodeName)
                },
                button: function(a) {
                    var b = a.nodeName.toLowerCase();
                    return "input" === b && "button" === a.type || "button" === b
                },
                text: function(a) {
                    var b;
                    return "input" === a.nodeName.toLowerCase() && "text" === a.type && (null == (b = a.getAttribute("type")) || "text" === b.toLowerCase())
                },
                first: j(function() {
                    return [0]
                }),
                last: j(function(a, b) {
                    return [b - 1]
                }),
                eq: j(function(a, b, c) {
                    return [0 > c ? c + b : c]
                }),
                even: j(function(a, b) {
                    for (var c = 0; b > c; c += 2) a.push(c);
                    return a
                }),
                odd: j(function(a, b) {
                    for (var c = 1; b > c; c += 2) a.push(c);
                    return a
                }),
                lt: j(function(a, b, c) {
                    for (var d = 0 > c ? c + b : c; --d >= 0;) a.push(d);
                    return a
                }),
                gt: j(function(a, b, c) {
                    for (var d = 0 > c ? c + b : c; ++d < b;) a.push(d);
                    return a
                })
            }
        }, w.pseudos.nth = w.pseudos.eq;
        for (u in {
                radio: !0,
                checkbox: !0,
                file: !0,
                password: !0,
                image: !0
            }) w.pseudos[u] = h(u);
        for (u in {
                submit: !0,
                reset: !0
            }) w.pseudos[u] = i(u);
        return l.prototype = w.filters = w.pseudos, w.setFilters = new l, z = b.tokenize = function(a, c) {
            var d, e, f, g, h, i, j, k = S[a + " "];
            if (k) return c ? 0 : k.slice(0);
            for (h = a, i = [], j = w.preFilter; h;) {
                (!d || (e = jb.exec(h))) && (e && (h = h.slice(e[0].length) || h), i.push(f = [])), d = !1, (e = kb.exec(h)) && (d = e.shift(), f.push({
                    value: d,
                    type: e[0].replace(ib, " ")
                }), h = h.slice(d.length));
                for (g in w.filter) !(e = ob[g].exec(h)) || j[g] && !(e = j[g](e)) || (d = e.shift(), f.push({
                    value: d,
                    type: g,
                    matches: e
                }), h = h.slice(d.length));
                if (!d) break
            }
            return c ? h.length : h ? b.error(a) : S(a, i).slice(0)
        }, A = b.compile = function(a, b) {
            var c, d = [],
                e = [],
                f = T[a + " "];
            if (!f) {
                for (b || (b = z(a)), c = b.length; c--;) f = s(b[c]), f[N] ? d.push(f) : e.push(f);
                f = T(a, t(e, d)), f.selector = a
            }
            return f
        }, B = b.select = function(a, b, c, d) {
            var e, f, g, h, i, j = "function" == typeof a && a,
                l = !d && z(a = j.selector || a);
            if (c = c || [], 1 === l.length) {
                if (f = l[0] = l[0].slice(0), f.length > 2 && "ID" === (g = f[0]).type && v.getById && 9 === b.nodeType && I && w.relative[f[1].type]) {
                    if (b = (w.find.ID(g.matches[0].replace(vb, wb), b) || [])[0], !b) return c;
                    j && (b = b.parentNode), a = a.slice(f.shift().value.length)
                }
                for (e = ob.needsContext.test(a) ? 0 : f.length; e-- && (g = f[e], !w.relative[h = g.type]);)
                    if ((i = w.find[h]) && (d = i(g.matches[0].replace(vb, wb), tb.test(f[0].type) && k(b.parentNode) || b))) {
                        if (f.splice(e, 1), a = d.length && m(f), !a) return $.apply(c, d), c;
                        break
                    }
            }
            return (j || A(a, l))(d, b, !I, c, tb.test(a) && k(b.parentNode) || b), c
        }, v.sortStable = N.split("").sort(U).join("") === N, v.detectDuplicates = !!E, F(), v.sortDetached = e(function(a) {
            return 1 & a.compareDocumentPosition(G.createElement("div"))
        }), e(function(a) {
            return a.innerHTML = "<a href='#'></a>", "#" === a.firstChild.getAttribute("href")
        }) || f("type|href|height|width", function(a, b, c) {
            return c ? void 0 : a.getAttribute(b, "type" === b.toLowerCase() ? 1 : 2)
        }), v.attributes && e(function(a) {
            return a.innerHTML = "<input/>", a.firstChild.setAttribute("value", ""), "" === a.firstChild.getAttribute("value")
        }) || f("value", function(a, b, c) {
            return c || "input" !== a.nodeName.toLowerCase() ? void 0 : a.defaultValue
        }), e(function(a) {
            return null == a.getAttribute("disabled")
        }) || f(bb, function(a, b, c) {
            var d;
            return c ? void 0 : a[b] === !0 ? b.toLowerCase() : (d = a.getAttributeNode(b)) && d.specified ? d.value : null
        }), b
    }(a);
    eb.find = jb, eb.expr = jb.selectors, eb.expr[":"] = eb.expr.pseudos, eb.unique = jb.uniqueSort, eb.text = jb.getText, eb.isXMLDoc = jb.isXML, eb.contains = jb.contains;
    var kb = eb.expr.match.needsContext,
        lb = /^<(\w+)\s*\/?>(?:<\/\1>|)$/,
        mb = /^.[^:#\[\.,]*$/;
    eb.filter = function(a, b, c) {
        var d = b[0];
        return c && (a = ":not(" + a + ")"), 1 === b.length && 1 === d.nodeType ? eb.find.matchesSelector(d, a) ? [d] : [] : eb.find.matches(a, eb.grep(b, function(a) {
            return 1 === a.nodeType
        }))
    }, eb.fn.extend({
        find: function(a) {
            var b, c = [],
                d = this,
                e = d.length;
            if ("string" != typeof a) return this.pushStack(eb(a).filter(function() {
                for (b = 0; e > b; b++)
                    if (eb.contains(d[b], this)) return !0
            }));
            for (b = 0; e > b; b++) eb.find(a, d[b], c);
            return c = this.pushStack(e > 1 ? eb.unique(c) : c), c.selector = this.selector ? this.selector + " " + a : a, c
        },
        filter: function(a) {
            return this.pushStack(d(this, a || [], !1))
        },
        not: function(a) {
            return this.pushStack(d(this, a || [], !0))
        },
        is: function(a) {
            return !!d(this, "string" == typeof a && kb.test(a) ? eb(a) : a || [], !1).length
        }
    });
    var nb, ob = a.document,
        pb = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,
        qb = eb.fn.init = function(a, b) {
            var c, d;
            if (!a) return this;
            if ("string" == typeof a) {
                if (c = "<" === a.charAt(0) && ">" === a.charAt(a.length - 1) && a.length >= 3 ? [null, a, null] : pb.exec(a), !c || !c[1] && b) return !b || b.jquery ? (b || nb).find(a) : this.constructor(b).find(a);
                if (c[1]) {
                    if (b = b instanceof eb ? b[0] : b, eb.merge(this, eb.parseHTML(c[1], b && b.nodeType ? b.ownerDocument || b : ob, !0)), lb.test(c[1]) && eb.isPlainObject(b))
                        for (c in b) eb.isFunction(this[c]) ? this[c](b[c]) : this.attr(c, b[c]);
                    return this
                }
                if (d = ob.getElementById(c[2]), d && d.parentNode) {
                    if (d.id !== c[2]) return nb.find(a);
                    this.length = 1, this[0] = d
                }
                return this.context = ob, this.selector = a, this
            }
            return a.nodeType ? (this.context = this[0] = a, this.length = 1, this) : eb.isFunction(a) ? "undefined" != typeof nb.ready ? nb.ready(a) : a(eb) : (void 0 !== a.selector && (this.selector = a.selector, this.context = a.context), eb.makeArray(a, this))
        };
    qb.prototype = eb.fn, nb = eb(ob);
    var rb = /^(?:parents|prev(?:Until|All))/,
        sb = {
            children: !0,
            contents: !0,
            next: !0,
            prev: !0
        };
    eb.extend({
        dir: function(a, b, c) {
            for (var d = [], e = a[b]; e && 9 !== e.nodeType && (void 0 === c || 1 !== e.nodeType || !eb(e).is(c));) 1 === e.nodeType && d.push(e), e = e[b];
            return d
        },
        sibling: function(a, b) {
            for (var c = []; a; a = a.nextSibling) 1 === a.nodeType && a !== b && c.push(a);
            return c
        }
    }), eb.fn.extend({
        has: function(a) {
            var b, c = eb(a, this),
                d = c.length;
            return this.filter(function() {
                for (b = 0; d > b; b++)
                    if (eb.contains(this, c[b])) return !0
            })
        },
        closest: function(a, b) {
            for (var c, d = 0, e = this.length, f = [], g = kb.test(a) || "string" != typeof a ? eb(a, b || this.context) : 0; e > d; d++)
                for (c = this[d]; c && c !== b; c = c.parentNode)
                    if (c.nodeType < 11 && (g ? g.index(c) > -1 : 1 === c.nodeType && eb.find.matchesSelector(c, a))) {
                        f.push(c);
                        break
                    }
            return this.pushStack(f.length > 1 ? eb.unique(f) : f)
        },
        index: function(a) {
            return a ? "string" == typeof a ? eb.inArray(this[0], eb(a)) : eb.inArray(a.jquery ? a[0] : a, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
        },
        add: function(a, b) {
            return this.pushStack(eb.unique(eb.merge(this.get(), eb(a, b))))
        },
        addBack: function(a) {
            return this.add(null == a ? this.prevObject : this.prevObject.filter(a))
        }
    }), eb.each({
        parent: function(a) {
            var b = a.parentNode;
            return b && 11 !== b.nodeType ? b : null
        },
        parents: function(a) {
            return eb.dir(a, "parentNode")
        },
        parentsUntil: function(a, b, c) {
            return eb.dir(a, "parentNode", c)
        },
        next: function(a) {
            return e(a, "nextSibling")
        },
        prev: function(a) {
            return e(a, "previousSibling")
        },
        nextAll: function(a) {
            return eb.dir(a, "nextSibling")
        },
        prevAll: function(a) {
            return eb.dir(a, "previousSibling")
        },
        nextUntil: function(a, b, c) {
            return eb.dir(a, "nextSibling", c)
        },
        prevUntil: function(a, b, c) {
            return eb.dir(a, "previousSibling", c)
        },
        siblings: function(a) {
            return eb.sibling((a.parentNode || {}).firstChild, a)
        },
        children: function(a) {
            return eb.sibling(a.firstChild)
        },
        contents: function(a) {
            return eb.nodeName(a, "iframe") ? a.contentDocument || a.contentWindow.document : eb.merge([], a.childNodes)
        }
    }, function(a, b) {
        eb.fn[a] = function(c, d) {
            var e = eb.map(this, b, c);
            return "Until" !== a.slice(-5) && (d = c), d && "string" == typeof d && (e = eb.filter(d, e)), this.length > 1 && (sb[a] || (e = eb.unique(e)), rb.test(a) && (e = e.reverse())), this.pushStack(e)
        }
    });
    var tb = /\S+/g,
        ub = {};
    eb.Callbacks = function(a) {
        a = "string" == typeof a ? ub[a] || f(a) : eb.extend({}, a);
        var b, c, d, e, g, h, i = [],
            j = !a.once && [],
            k = function(f) {
                for (c = a.memory && f, d = !0, g = h || 0, h = 0, e = i.length, b = !0; i && e > g; g++)
                    if (i[g].apply(f[0], f[1]) === !1 && a.stopOnFalse) {
                        c = !1;
                        break
                    }
                b = !1, i && (j ? j.length && k(j.shift()) : c ? i = [] : l.disable())
            },
            l = {
                add: function() {
                    if (i) {
                        var d = i.length;
                        ! function f(b) {
                            eb.each(b, function(b, c) {
                                var d = eb.type(c);
                                "function" === d ? a.unique && l.has(c) || i.push(c) : c && c.length && "string" !== d && f(c)
                            })
                        }(arguments), b ? e = i.length : c && (h = d, k(c))
                    }
                    return this
                },
                remove: function() {
                    return i && eb.each(arguments, function(a, c) {
                        for (var d;
                            (d = eb.inArray(c, i, d)) > -1;) i.splice(d, 1), b && (e >= d && e--, g >= d && g--)
                    }), this
                },
                has: function(a) {
                    return a ? eb.inArray(a, i) > -1 : !(!i || !i.length)
                },
                empty: function() {
                    return i = [], e = 0, this
                },
                disable: function() {
                    return i = j = c = void 0, this
                },
                disabled: function() {
                    return !i
                },
                lock: function() {
                    return j = void 0, c || l.disable(), this
                },
                locked: function() {
                    return !j
                },
                fireWith: function(a, c) {
                    return !i || d && !j || (c = c || [], c = [a, c.slice ? c.slice() : c], b ? j.push(c) : k(c)), this
                },
                fire: function() {
                    return l.fireWith(this, arguments), this
                },
                fired: function() {
                    return !!d
                }
            };
        return l
    }, eb.extend({
        Deferred: function(a) {
            var b = [
                    ["resolve", "done", eb.Callbacks("once memory"), "resolved"],
                    ["reject", "fail", eb.Callbacks("once memory"), "rejected"],
                    ["notify", "progress", eb.Callbacks("memory")]
                ],
                c = "pending",
                d = {
                    state: function() {
                        return c
                    },
                    always: function() {
                        return e.done(arguments).fail(arguments), this
                    },
                    then: function() {
                        var a = arguments;
                        return eb.Deferred(function(c) {
                            eb.each(b, function(b, f) {
                                var g = eb.isFunction(a[b]) && a[b];
                                e[f[1]](function() {
                                    var a = g && g.apply(this, arguments);
                                    a && eb.isFunction(a.promise) ? a.promise().done(c.resolve).fail(c.reject).progress(c.notify) : c[f[0] + "With"](this === d ? c.promise() : this, g ? [a] : arguments)
                                })
                            }), a = null
                        }).promise()
                    },
                    promise: function(a) {
                        return null != a ? eb.extend(a, d) : d
                    }
                },
                e = {};
            return d.pipe = d.then, eb.each(b, function(a, f) {
                var g = f[2],
                    h = f[3];
                d[f[1]] = g.add, h && g.add(function() {
                    c = h
                }, b[1 ^ a][2].disable, b[2][2].lock), e[f[0]] = function() {
                    return e[f[0] + "With"](this === e ? d : this, arguments), this
                }, e[f[0] + "With"] = g.fireWith
            }), d.promise(e), a && a.call(e, e), e
        },
        when: function(a) {
            var b, c, d, e = 0,
                f = X.call(arguments),
                g = f.length,
                h = 1 !== g || a && eb.isFunction(a.promise) ? g : 0,
                i = 1 === h ? a : eb.Deferred(),
                j = function(a, c, d) {
                    return function(e) {
                        c[a] = this, d[a] = arguments.length > 1 ? X.call(arguments) : e, d === b ? i.notifyWith(c, d) : --h || i.resolveWith(c, d)
                    }
                };
            if (g > 1)
                for (b = new Array(g), c = new Array(g), d = new Array(g); g > e; e++) f[e] && eb.isFunction(f[e].promise) ? f[e].promise().done(j(e, d, f)).fail(i.reject).progress(j(e, c, b)) : --h;
            return h || i.resolveWith(d, f), i.promise()
        }
    });
    var vb;
    eb.fn.ready = function(a) {
        return eb.ready.promise().done(a), this
    }, eb.extend({
        isReady: !1,
        readyWait: 1,
        holdReady: function(a) {
            a ? eb.readyWait++ : eb.ready(!0)
        },
        ready: function(a) {
            if (a === !0 ? !--eb.readyWait : !eb.isReady) {
                if (!ob.body) return setTimeout(eb.ready);
                eb.isReady = !0, a !== !0 && --eb.readyWait > 0 || (vb.resolveWith(ob, [eb]), eb.fn.triggerHandler && (eb(ob).triggerHandler("ready"), eb(ob).off("ready")))
            }
        }
    }), eb.ready.promise = function(b) {
        if (!vb)
            if (vb = eb.Deferred(), "complete" === ob.readyState) setTimeout(eb.ready);
            else if (ob.addEventListener) ob.addEventListener("DOMContentLoaded", h, !1), a.addEventListener("load", h, !1);
        else {
            ob.attachEvent("onreadystatechange", h), a.attachEvent("onload", h);
            var c = !1;
            try {
                c = null == a.frameElement && ob.documentElement
            } catch (d) {}
            c && c.doScroll && ! function e() {
                if (!eb.isReady) {
                    try {
                        c.doScroll("left")
                    } catch (a) {
                        return setTimeout(e, 50)
                    }
                    g(), eb.ready()
                }
            }()
        }
        return vb.promise(b)
    };
    var wb, xb = "undefined";
    for (wb in eb(cb)) break;
    cb.ownLast = "0" !== wb, cb.inlineBlockNeedsLayout = !1, eb(function() {
            var a, b, c, d;
            c = ob.getElementsByTagName("body")[0], c && c.style && (b = ob.createElement("div"), d = ob.createElement("div"), d.style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px", c.appendChild(d).appendChild(b), typeof b.style.zoom !== xb && (b.style.cssText = "display:inline;margin:0;border:0;padding:1px;width:1px;zoom:1", cb.inlineBlockNeedsLayout = a = 3 === b.offsetWidth, a && (c.style.zoom = 1)), c.removeChild(d))
        }),
        function() {
            var a = ob.createElement("div");
            if (null == cb.deleteExpando) {
                cb.deleteExpando = !0;
                try {
                    delete a.test
                } catch (b) {
                    cb.deleteExpando = !1
                }
            }
            a = null
        }(), eb.acceptData = function(a) {
            var b = eb.noData[(a.nodeName + " ").toLowerCase()],
                c = +a.nodeType || 1;
            return 1 !== c && 9 !== c ? !1 : !b || b !== !0 && a.getAttribute("classid") === b
        };
    var yb = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
        zb = /([A-Z])/g;
    eb.extend({
        cache: {},
        noData: {
            "applet ": !0,
            "embed ": !0,
            "object ": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
        },
        hasData: function(a) {
            return a = a.nodeType ? eb.cache[a[eb.expando]] : a[eb.expando], !!a && !j(a)
        },
        data: function(a, b, c) {
            return k(a, b, c)
        },
        removeData: function(a, b) {
            return l(a, b)
        },
        _data: function(a, b, c) {
            return k(a, b, c, !0)
        },
        _removeData: function(a, b) {
            return l(a, b, !0)
        }
    }), eb.fn.extend({
        data: function(a, b) {
            var c, d, e, f = this[0],
                g = f && f.attributes;
            if (void 0 === a) {
                if (this.length && (e = eb.data(f), 1 === f.nodeType && !eb._data(f, "parsedAttrs"))) {
                    for (c = g.length; c--;) g[c] && (d = g[c].name, 0 === d.indexOf("data-") && (d = eb.camelCase(d.slice(5)), i(f, d, e[d])));
                    eb._data(f, "parsedAttrs", !0)
                }
                return e
            }
            return "object" == typeof a ? this.each(function() {
                eb.data(this, a)
            }) : arguments.length > 1 ? this.each(function() {
                eb.data(this, a, b)
            }) : f ? i(f, a, eb.data(f, a)) : void 0
        },
        removeData: function(a) {
            return this.each(function() {
                eb.removeData(this, a)
            })
        }
    }), eb.extend({
        queue: function(a, b, c) {
            var d;
            return a ? (b = (b || "fx") + "queue", d = eb._data(a, b), c && (!d || eb.isArray(c) ? d = eb._data(a, b, eb.makeArray(c)) : d.push(c)), d || []) : void 0
        },
        dequeue: function(a, b) {
            b = b || "fx";
            var c = eb.queue(a, b),
                d = c.length,
                e = c.shift(),
                f = eb._queueHooks(a, b),
                g = function() {
                    eb.dequeue(a, b)
                };
            "inprogress" === e && (e = c.shift(), d--), e && ("fx" === b && c.unshift("inprogress"), delete f.stop, e.call(a, g, f)), !d && f && f.empty.fire()
        },
        _queueHooks: function(a, b) {
            var c = b + "queueHooks";
            return eb._data(a, c) || eb._data(a, c, {
                empty: eb.Callbacks("once memory").add(function() {
                    eb._removeData(a, b + "queue"), eb._removeData(a, c)
                })
            })
        }
    }), eb.fn.extend({
        queue: function(a, b) {
            var c = 2;
            return "string" != typeof a && (b = a, a = "fx", c--), arguments.length < c ? eb.queue(this[0], a) : void 0 === b ? this : this.each(function() {
                var c = eb.queue(this, a, b);
                eb._queueHooks(this, a), "fx" === a && "inprogress" !== c[0] && eb.dequeue(this, a)
            })
        },
        dequeue: function(a) {
            return this.each(function() {
                eb.dequeue(this, a)
            })
        },
        clearQueue: function(a) {
            return this.queue(a || "fx", [])
        },
        promise: function(a, b) {
            var c, d = 1,
                e = eb.Deferred(),
                f = this,
                g = this.length,
                h = function() {
                    --d || e.resolveWith(f, [f])
                };
            for ("string" != typeof a && (b = a, a = void 0), a = a || "fx"; g--;) c = eb._data(f[g], a + "queueHooks"), c && c.empty && (d++, c.empty.add(h));
            return h(), e.promise(b)
        }
    });
    var Ab = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
        Bb = ["Top", "Right", "Bottom", "Left"],
        Cb = function(a, b) {
            return a = b || a, "none" === eb.css(a, "display") || !eb.contains(a.ownerDocument, a)
        },
        Db = eb.access = function(a, b, c, d, e, f, g) {
            var h = 0,
                i = a.length,
                j = null == c;
            if ("object" === eb.type(c)) {
                e = !0;
                for (h in c) eb.access(a, b, h, c[h], !0, f, g)
            } else if (void 0 !== d && (e = !0, eb.isFunction(d) || (g = !0), j && (g ? (b.call(a, d), b = null) : (j = b, b = function(a, b, c) {
                    return j.call(eb(a), c)
                })), b))
                for (; i > h; h++) b(a[h], c, g ? d : d.call(a[h], h, b(a[h], c)));
            return e ? a : j ? b.call(a) : i ? b(a[0], c) : f
        },
        Eb = /^(?:checkbox|radio)$/i;
    ! function() {
        var a = ob.createElement("input"),
            b = ob.createElement("div"),
            c = ob.createDocumentFragment();
        if (b.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", cb.leadingWhitespace = 3 === b.firstChild.nodeType, cb.tbody = !b.getElementsByTagName("tbody").length, cb.htmlSerialize = !!b.getElementsByTagName("link").length, cb.html5Clone = "<:nav></:nav>" !== ob.createElement("nav").cloneNode(!0).outerHTML, a.type = "checkbox", a.checked = !0, c.appendChild(a), cb.appendChecked = a.checked, b.innerHTML = "<textarea>x</textarea>", cb.noCloneChecked = !!b.cloneNode(!0).lastChild.defaultValue, c.appendChild(b), b.innerHTML = "<input type='radio' checked='checked' name='t'/>", cb.checkClone = b.cloneNode(!0).cloneNode(!0).lastChild.checked, cb.noCloneEvent = !0, b.attachEvent && (b.attachEvent("onclick", function() {
                cb.noCloneEvent = !1
            }), b.cloneNode(!0).click()), null == cb.deleteExpando) {
            cb.deleteExpando = !0;
            try {
                delete b.test
            } catch (d) {
                cb.deleteExpando = !1
            }
        }
    }(),
    function() {
        var b, c, d = ob.createElement("div");
        for (b in {
                submit: !0,
                change: !0,
                focusin: !0
            }) c = "on" + b, (cb[b + "Bubbles"] = c in a) || (d.setAttribute(c, "t"), cb[b + "Bubbles"] = d.attributes[c].expando === !1);
        d = null
    }();
    var Fb = /^(?:input|select|textarea)$/i,
        Gb = /^key/,
        Hb = /^(?:mouse|pointer|contextmenu)|click/,
        Ib = /^(?:focusinfocus|focusoutblur)$/,
        Jb = /^([^.]*)(?:\.(.+)|)$/;
    eb.event = {
        global: {},
        add: function(a, b, c, d, e) {
            var f, g, h, i, j, k, l, m, n, o, p, q = eb._data(a);
            if (q) {
                for (c.handler && (i = c, c = i.handler, e = i.selector), c.guid || (c.guid = eb.guid++), (g = q.events) || (g = q.events = {}), (k = q.handle) || (k = q.handle = function(a) {
                        return typeof eb === xb || a && eb.event.triggered === a.type ? void 0 : eb.event.dispatch.apply(k.elem, arguments)
                    }, k.elem = a), b = (b || "").match(tb) || [""], h = b.length; h--;) f = Jb.exec(b[h]) || [], n = p = f[1], o = (f[2] || "").split(".").sort(), n && (j = eb.event.special[n] || {}, n = (e ? j.delegateType : j.bindType) || n, j = eb.event.special[n] || {}, l = eb.extend({
                    type: n,
                    origType: p,
                    data: d,
                    handler: c,
                    guid: c.guid,
                    selector: e,
                    needsContext: e && eb.expr.match.needsContext.test(e),
                    namespace: o.join(".")
                }, i), (m = g[n]) || (m = g[n] = [], m.delegateCount = 0, j.setup && j.setup.call(a, d, o, k) !== !1 || (a.addEventListener ? a.addEventListener(n, k, !1) : a.attachEvent && a.attachEvent("on" + n, k))), j.add && (j.add.call(a, l), l.handler.guid || (l.handler.guid = c.guid)), e ? m.splice(m.delegateCount++, 0, l) : m.push(l), eb.event.global[n] = !0);
                a = null
            }
        },
        remove: function(a, b, c, d, e) {
            var f, g, h, i, j, k, l, m, n, o, p, q = eb.hasData(a) && eb._data(a);
            if (q && (k = q.events)) {
                for (b = (b || "").match(tb) || [""], j = b.length; j--;)
                    if (h = Jb.exec(b[j]) || [], n = p = h[1], o = (h[2] || "").split(".").sort(), n) {
                        for (l = eb.event.special[n] || {}, n = (d ? l.delegateType : l.bindType) || n, m = k[n] || [], h = h[2] && new RegExp("(^|\\.)" + o.join("\\.(?:.*\\.|)") + "(\\.|$)"), i = f = m.length; f--;) g = m[f], !e && p !== g.origType || c && c.guid !== g.guid || h && !h.test(g.namespace) || d && d !== g.selector && ("**" !== d || !g.selector) || (m.splice(f, 1), g.selector && m.delegateCount--, l.remove && l.remove.call(a, g));
                        i && !m.length && (l.teardown && l.teardown.call(a, o, q.handle) !== !1 || eb.removeEvent(a, n, q.handle), delete k[n])
                    } else
                        for (n in k) eb.event.remove(a, n + b[j], c, d, !0);
                eb.isEmptyObject(k) && (delete q.handle, eb._removeData(a, "events"))
            }
        },
        trigger: function(b, c, d, e) {
            var f, g, h, i, j, k, l, m = [d || ob],
                n = bb.call(b, "type") ? b.type : b,
                o = bb.call(b, "namespace") ? b.namespace.split(".") : [];
            if (h = k = d = d || ob, 3 !== d.nodeType && 8 !== d.nodeType && !Ib.test(n + eb.event.triggered) && (n.indexOf(".") >= 0 && (o = n.split("."), n = o.shift(), o.sort()), g = n.indexOf(":") < 0 && "on" + n, b = b[eb.expando] ? b : new eb.Event(n, "object" == typeof b && b), b.isTrigger = e ? 2 : 3, b.namespace = o.join("."), b.namespace_re = b.namespace ? new RegExp("(^|\\.)" + o.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, b.result = void 0, b.target || (b.target = d), c = null == c ? [b] : eb.makeArray(c, [b]), j = eb.event.special[n] || {}, e || !j.trigger || j.trigger.apply(d, c) !== !1)) {
                if (!e && !j.noBubble && !eb.isWindow(d)) {
                    for (i = j.delegateType || n, Ib.test(i + n) || (h = h.parentNode); h; h = h.parentNode) m.push(h), k = h;
                    k === (d.ownerDocument || ob) && m.push(k.defaultView || k.parentWindow || a)
                }
                for (l = 0;
                    (h = m[l++]) && !b.isPropagationStopped();) b.type = l > 1 ? i : j.bindType || n, f = (eb._data(h, "events") || {})[b.type] && eb._data(h, "handle"), f && f.apply(h, c), f = g && h[g], f && f.apply && eb.acceptData(h) && (b.result = f.apply(h, c), b.result === !1 && b.preventDefault());
                if (b.type = n, !e && !b.isDefaultPrevented() && (!j._default || j._default.apply(m.pop(), c) === !1) && eb.acceptData(d) && g && d[n] && !eb.isWindow(d)) {
                    k = d[g], k && (d[g] = null), eb.event.triggered = n;
                    try {
                        d[n]()
                    } catch (p) {}
                    eb.event.triggered = void 0, k && (d[g] = k)
                }
                return b.result
            }
        },
        dispatch: function(a) {
            a = eb.event.fix(a);
            var b, c, d, e, f, g = [],
                h = X.call(arguments),
                i = (eb._data(this, "events") || {})[a.type] || [],
                j = eb.event.special[a.type] || {};
            if (h[0] = a, a.delegateTarget = this, !j.preDispatch || j.preDispatch.call(this, a) !== !1) {
                for (g = eb.event.handlers.call(this, a, i), b = 0;
                    (e = g[b++]) && !a.isPropagationStopped();)
                    for (a.currentTarget = e.elem, f = 0;
                        (d = e.handlers[f++]) && !a.isImmediatePropagationStopped();)(!a.namespace_re || a.namespace_re.test(d.namespace)) && (a.handleObj = d, a.data = d.data, c = ((eb.event.special[d.origType] || {}).handle || d.handler).apply(e.elem, h), void 0 !== c && (a.result = c) === !1 && (a.preventDefault(), a.stopPropagation()));
                return j.postDispatch && j.postDispatch.call(this, a), a.result
            }
        },
        handlers: function(a, b) {
            var c, d, e, f, g = [],
                h = b.delegateCount,
                i = a.target;
            if (h && i.nodeType && (!a.button || "click" !== a.type))
                for (; i != this; i = i.parentNode || this)
                    if (1 === i.nodeType && (i.disabled !== !0 || "click" !== a.type)) {
                        for (e = [], f = 0; h > f; f++) d = b[f], c = d.selector + " ", void 0 === e[c] && (e[c] = d.needsContext ? eb(c, this).index(i) >= 0 : eb.find(c, this, null, [i]).length), e[c] && e.push(d);
                        e.length && g.push({
                            elem: i,
                            handlers: e
                        })
                    }
            return h < b.length && g.push({
                elem: this,
                handlers: b.slice(h)
            }), g
        },
        fix: function(a) {
            if (a[eb.expando]) return a;
            var b, c, d, e = a.type,
                f = a,
                g = this.fixHooks[e];
            for (g || (this.fixHooks[e] = g = Hb.test(e) ? this.mouseHooks : Gb.test(e) ? this.keyHooks : {}), d = g.props ? this.props.concat(g.props) : this.props, a = new eb.Event(f), b = d.length; b--;) c = d[b], a[c] = f[c];
            return a.target || (a.target = f.srcElement || ob), 3 === a.target.nodeType && (a.target = a.target.parentNode), a.metaKey = !!a.metaKey, g.filter ? g.filter(a, f) : a
        },
        props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
        fixHooks: {},
        keyHooks: {
            props: "char charCode key keyCode".split(" "),
            filter: function(a, b) {
                return null == a.which && (a.which = null != b.charCode ? b.charCode : b.keyCode), a
            }
        },
        mouseHooks: {
            props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
            filter: function(a, b) {
                var c, d, e, f = b.button,
                    g = b.fromElement;
                return null == a.pageX && null != b.clientX && (d = a.target.ownerDocument || ob, e = d.documentElement, c = d.body, a.pageX = b.clientX + (e && e.scrollLeft || c && c.scrollLeft || 0) - (e && e.clientLeft || c && c.clientLeft || 0), a.pageY = b.clientY + (e && e.scrollTop || c && c.scrollTop || 0) - (e && e.clientTop || c && c.clientTop || 0)), !a.relatedTarget && g && (a.relatedTarget = g === a.target ? b.toElement : g), a.which || void 0 === f || (a.which = 1 & f ? 1 : 2 & f ? 3 : 4 & f ? 2 : 0), a
            }
        },
        special: {
            load: {
                noBubble: !0
            },
            focus: {
                trigger: function() {
                    if (this !== o() && this.focus) try {
                        return this.focus(), !1
                    } catch (a) {}
                },
                delegateType: "focusin"
            },
            blur: {
                trigger: function() {
                    return this === o() && this.blur ? (this.blur(), !1) : void 0
                },
                delegateType: "focusout"
            },
            click: {
                trigger: function() {
                    return eb.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(), !1) : void 0
                },
                _default: function(a) {
                    return eb.nodeName(a.target, "a")
                }
            },
            beforeunload: {
                postDispatch: function(a) {
                    void 0 !== a.result && a.originalEvent && (a.originalEvent.returnValue = a.result)
                }
            }
        },
        simulate: function(a, b, c, d) {
            var e = eb.extend(new eb.Event, c, {
                type: a,
                isSimulated: !0,
                originalEvent: {}
            });
            d ? eb.event.trigger(e, null, b) : eb.event.dispatch.call(b, e), e.isDefaultPrevented() && c.preventDefault()
        }
    }, eb.removeEvent = ob.removeEventListener ? function(a, b, c) {
        a.removeEventListener && a.removeEventListener(b, c, !1)
    } : function(a, b, c) {
        var d = "on" + b;
        a.detachEvent && (typeof a[d] === xb && (a[d] = null), a.detachEvent(d, c))
    }, eb.Event = function(a, b) {
        return this instanceof eb.Event ? (a && a.type ? (this.originalEvent = a, this.type = a.type, this.isDefaultPrevented = a.defaultPrevented || void 0 === a.defaultPrevented && a.returnValue === !1 ? m : n) : this.type = a, b && eb.extend(this, b), this.timeStamp = a && a.timeStamp || eb.now(), void(this[eb.expando] = !0)) : new eb.Event(a, b)
    }, eb.Event.prototype = {
        isDefaultPrevented: n,
        isPropagationStopped: n,
        isImmediatePropagationStopped: n,
        preventDefault: function() {
            var a = this.originalEvent;
            this.isDefaultPrevented = m, a && (a.preventDefault ? a.preventDefault() : a.returnValue = !1)
        },
        stopPropagation: function() {
            var a = this.originalEvent;
            this.isPropagationStopped = m, a && (a.stopPropagation && a.stopPropagation(), a.cancelBubble = !0)
        },
        stopImmediatePropagation: function() {
            var a = this.originalEvent;
            this.isImmediatePropagationStopped = m, a && a.stopImmediatePropagation && a.stopImmediatePropagation(), this.stopPropagation()
        }
    }, eb.each({
        mouseenter: "mouseover",
        mouseleave: "mouseout",
        pointerenter: "pointerover",
        pointerleave: "pointerout"
    }, function(a, b) {
        eb.event.special[a] = {
            delegateType: b,
            bindType: b,
            handle: function(a) {
                var c, d = this,
                    e = a.relatedTarget,
                    f = a.handleObj;
                return (!e || e !== d && !eb.contains(d, e)) && (a.type = f.origType, c = f.handler.apply(this, arguments), a.type = b), c
            }
        }
    }), cb.submitBubbles || (eb.event.special.submit = {
        setup: function() {
            return eb.nodeName(this, "form") ? !1 : void eb.event.add(this, "click._submit keypress._submit", function(a) {
                var b = a.target,
                    c = eb.nodeName(b, "input") || eb.nodeName(b, "button") ? b.form : void 0;
                c && !eb._data(c, "submitBubbles") && (eb.event.add(c, "submit._submit", function(a) {
                    a._submit_bubble = !0
                }), eb._data(c, "submitBubbles", !0))
            })
        },
        postDispatch: function(a) {
            a._submit_bubble && (delete a._submit_bubble, this.parentNode && !a.isTrigger && eb.event.simulate("submit", this.parentNode, a, !0))
        },
        teardown: function() {
            return eb.nodeName(this, "form") ? !1 : void eb.event.remove(this, "._submit")
        }
    }), cb.changeBubbles || (eb.event.special.change = {
        setup: function() {
            return Fb.test(this.nodeName) ? (("checkbox" === this.type || "radio" === this.type) && (eb.event.add(this, "propertychange._change", function(a) {
                "checked" === a.originalEvent.propertyName && (this._just_changed = !0)
            }), eb.event.add(this, "click._change", function(a) {
                this._just_changed && !a.isTrigger && (this._just_changed = !1), eb.event.simulate("change", this, a, !0)
            })), !1) : void eb.event.add(this, "beforeactivate._change", function(a) {
                var b = a.target;
                Fb.test(b.nodeName) && !eb._data(b, "changeBubbles") && (eb.event.add(b, "change._change", function(a) {
                    !this.parentNode || a.isSimulated || a.isTrigger || eb.event.simulate("change", this.parentNode, a, !0)
                }), eb._data(b, "changeBubbles", !0))
            })
        },
        handle: function(a) {
            var b = a.target;
            return this !== b || a.isSimulated || a.isTrigger || "radio" !== b.type && "checkbox" !== b.type ? a.handleObj.handler.apply(this, arguments) : void 0
        },
        teardown: function() {
            return eb.event.remove(this, "._change"), !Fb.test(this.nodeName)
        }
    }), cb.focusinBubbles || eb.each({
        focus: "focusin",
        blur: "focusout"
    }, function(a, b) {
        var c = function(a) {
            eb.event.simulate(b, a.target, eb.event.fix(a), !0)
        };
        eb.event.special[b] = {
            setup: function() {
                var d = this.ownerDocument || this,
                    e = eb._data(d, b);
                e || d.addEventListener(a, c, !0), eb._data(d, b, (e || 0) + 1)
            },
            teardown: function() {
                var d = this.ownerDocument || this,
                    e = eb._data(d, b) - 1;
                e ? eb._data(d, b, e) : (d.removeEventListener(a, c, !0), eb._removeData(d, b))
            }
        }
    }), eb.fn.extend({
        on: function(a, b, c, d, e) {
            var f, g;
            if ("object" == typeof a) {
                "string" != typeof b && (c = c || b, b = void 0);
                for (f in a) this.on(f, b, c, a[f], e);
                return this
            }
            if (null == c && null == d ? (d = b, c = b = void 0) : null == d && ("string" == typeof b ? (d = c, c = void 0) : (d = c, c = b, b = void 0)), d === !1) d = n;
            else if (!d) return this;
            return 1 === e && (g = d, d = function(a) {
                return eb().off(a), g.apply(this, arguments)
            }, d.guid = g.guid || (g.guid = eb.guid++)), this.each(function() {
                eb.event.add(this, a, d, c, b)
            })
        },
        one: function(a, b, c, d) {
            return this.on(a, b, c, d, 1)
        },
        off: function(a, b, c) {
            var d, e;
            if (a && a.preventDefault && a.handleObj) return d = a.handleObj, eb(a.delegateTarget).off(d.namespace ? d.origType + "." + d.namespace : d.origType, d.selector, d.handler), this;
            if ("object" == typeof a) {
                for (e in a) this.off(e, b, a[e]);
                return this
            }
            return (b === !1 || "function" == typeof b) && (c = b, b = void 0), c === !1 && (c = n), this.each(function() {
                eb.event.remove(this, a, c, b)
            })
        },
        trigger: function(a, b) {
            return this.each(function() {
                eb.event.trigger(a, b, this)
            })
        },
        triggerHandler: function(a, b) {
            var c = this[0];
            return c ? eb.event.trigger(a, b, c, !0) : void 0
        }
    });
    var Kb = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",
        Lb = / jQuery\d+="(?:null|\d+)"/g,
        Mb = new RegExp("<(?:" + Kb + ")[\\s/>]", "i"),
        Nb = /^\s+/,
        Ob = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,
        Pb = /<([\w:]+)/,
        Qb = /<tbody/i,
        Rb = /<|&#?\w+;/,
        Sb = /<(?:script|style|link)/i,
        Tb = /checked\s*(?:[^=]|=\s*.checked.)/i,
        Ub = /^$|\/(?:java|ecma)script/i,
        Vb = /^true\/(.*)/,
        Wb = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,
        Xb = {
            option: [1, "<select multiple='multiple'>", "</select>"],
            legend: [1, "<fieldset>", "</fieldset>"],
            area: [1, "<map>", "</map>"],
            param: [1, "<object>", "</object>"],
            thead: [1, "<table>", "</table>"],
            tr: [2, "<table><tbody>", "</tbody></table>"],
            col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
            td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
            _default: cb.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]
        },
        Yb = p(ob),
        Zb = Yb.appendChild(ob.createElement("div"));
    Xb.optgroup = Xb.option, Xb.tbody = Xb.tfoot = Xb.colgroup = Xb.caption = Xb.thead, Xb.th = Xb.td, eb.extend({
        clone: function(a, b, c) {
            var d, e, f, g, h, i = eb.contains(a.ownerDocument, a);
            if (cb.html5Clone || eb.isXMLDoc(a) || !Mb.test("<" + a.nodeName + ">") ? f = a.cloneNode(!0) : (Zb.innerHTML = a.outerHTML, Zb.removeChild(f = Zb.firstChild)), !(cb.noCloneEvent && cb.noCloneChecked || 1 !== a.nodeType && 11 !== a.nodeType || eb.isXMLDoc(a)))
                for (d = q(f), h = q(a), g = 0; null != (e = h[g]); ++g) d[g] && x(e, d[g]);
            if (b)
                if (c)
                    for (h = h || q(a), d = d || q(f), g = 0; null != (e = h[g]); g++) w(e, d[g]);
                else w(a, f);
            return d = q(f, "script"), d.length > 0 && v(d, !i && q(a, "script")), d = h = e = null, f
        },
        buildFragment: function(a, b, c, d) {
            for (var e, f, g, h, i, j, k, l = a.length, m = p(b), n = [], o = 0; l > o; o++)
                if (f = a[o], f || 0 === f)
                    if ("object" === eb.type(f)) eb.merge(n, f.nodeType ? [f] : f);
                    else if (Rb.test(f)) {
                for (h = h || m.appendChild(b.createElement("div")), i = (Pb.exec(f) || ["", ""])[1].toLowerCase(), k = Xb[i] || Xb._default, h.innerHTML = k[1] + f.replace(Ob, "<$1></$2>") + k[2], e = k[0]; e--;) h = h.lastChild;
                if (!cb.leadingWhitespace && Nb.test(f) && n.push(b.createTextNode(Nb.exec(f)[0])), !cb.tbody)
                    for (f = "table" !== i || Qb.test(f) ? "<table>" !== k[1] || Qb.test(f) ? 0 : h : h.firstChild, e = f && f.childNodes.length; e--;) eb.nodeName(j = f.childNodes[e], "tbody") && !j.childNodes.length && f.removeChild(j);
                for (eb.merge(n, h.childNodes), h.textContent = ""; h.firstChild;) h.removeChild(h.firstChild);
                h = m.lastChild
            } else n.push(b.createTextNode(f));
            for (h && m.removeChild(h), cb.appendChecked || eb.grep(q(n, "input"), r), o = 0; f = n[o++];)
                if ((!d || -1 === eb.inArray(f, d)) && (g = eb.contains(f.ownerDocument, f), h = q(m.appendChild(f), "script"), g && v(h), c))
                    for (e = 0; f = h[e++];) Ub.test(f.type || "") && c.push(f);
            return h = null, m
        },
        cleanData: function(a, b) {
            for (var c, d, e, f, g = 0, h = eb.expando, i = eb.cache, j = cb.deleteExpando, k = eb.event.special; null != (c = a[g]); g++)
                if ((b || eb.acceptData(c)) && (e = c[h], f = e && i[e])) {
                    if (f.events)
                        for (d in f.events) k[d] ? eb.event.remove(c, d) : eb.removeEvent(c, d, f.handle);
                    i[e] && (delete i[e], j ? delete c[h] : typeof c.removeAttribute !== xb ? c.removeAttribute(h) : c[h] = null, W.push(e))
                }
        }
    }), eb.fn.extend({
        text: function(a) {
            return Db(this, function(a) {
                return void 0 === a ? eb.text(this) : this.empty().append((this[0] && this[0].ownerDocument || ob).createTextNode(a))
            }, null, a, arguments.length)
        },
        append: function() {
            return this.domManip(arguments, function(a) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var b = s(this, a);
                    b.appendChild(a)
                }
            })
        },
        prepend: function() {
            return this.domManip(arguments, function(a) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var b = s(this, a);
                    b.insertBefore(a, b.firstChild)
                }
            })
        },
        before: function() {
            return this.domManip(arguments, function(a) {
                this.parentNode && this.parentNode.insertBefore(a, this)
            })
        },
        after: function() {
            return this.domManip(arguments, function(a) {
                this.parentNode && this.parentNode.insertBefore(a, this.nextSibling)
            })
        },
        remove: function(a, b) {
            for (var c, d = a ? eb.filter(a, this) : this, e = 0; null != (c = d[e]); e++) b || 1 !== c.nodeType || eb.cleanData(q(c)), c.parentNode && (b && eb.contains(c.ownerDocument, c) && v(q(c, "script")), c.parentNode.removeChild(c));
            return this
        },
        empty: function() {
            for (var a, b = 0; null != (a = this[b]); b++) {
                for (1 === a.nodeType && eb.cleanData(q(a, !1)); a.firstChild;) a.removeChild(a.firstChild);
                a.options && eb.nodeName(a, "select") && (a.options.length = 0)
            }
            return this
        },
        clone: function(a, b) {
            return a = null == a ? !1 : a, b = null == b ? a : b, this.map(function() {
                return eb.clone(this, a, b)
            })
        },
        html: function(a) {
            return Db(this, function(a) {
                var b = this[0] || {},
                    c = 0,
                    d = this.length;
                if (void 0 === a) return 1 === b.nodeType ? b.innerHTML.replace(Lb, "") : void 0;
                if (!("string" != typeof a || Sb.test(a) || !cb.htmlSerialize && Mb.test(a) || !cb.leadingWhitespace && Nb.test(a) || Xb[(Pb.exec(a) || ["", ""])[1].toLowerCase()])) {
                    a = a.replace(Ob, "<$1></$2>");
                    try {
                        for (; d > c; c++) b = this[c] || {}, 1 === b.nodeType && (eb.cleanData(q(b, !1)), b.innerHTML = a);
                        b = 0
                    } catch (e) {}
                }
                b && this.empty().append(a)
            }, null, a, arguments.length)
        },
        replaceWith: function() {
            var a = arguments[0];
            return this.domManip(arguments, function(b) {
                a = this.parentNode, eb.cleanData(q(this)), a && a.replaceChild(b, this)
            }), a && (a.length || a.nodeType) ? this : this.remove()
        },
        detach: function(a) {
            return this.remove(a, !0)
        },
        domManip: function(a, b) {
            a = Y.apply([], a);
            var c, d, e, f, g, h, i = 0,
                j = this.length,
                k = this,
                l = j - 1,
                m = a[0],
                n = eb.isFunction(m);
            if (n || j > 1 && "string" == typeof m && !cb.checkClone && Tb.test(m)) return this.each(function(c) {
                var d = k.eq(c);
                n && (a[0] = m.call(this, c, d.html())), d.domManip(a, b)
            });
            if (j && (h = eb.buildFragment(a, this[0].ownerDocument, !1, this), c = h.firstChild, 1 === h.childNodes.length && (h = c), c)) {
                for (f = eb.map(q(h, "script"), t), e = f.length; j > i; i++) d = h, i !== l && (d = eb.clone(d, !0, !0), e && eb.merge(f, q(d, "script"))), b.call(this[i], d, i);
                if (e)
                    for (g = f[f.length - 1].ownerDocument, eb.map(f, u), i = 0; e > i; i++) d = f[i], Ub.test(d.type || "") && !eb._data(d, "globalEval") && eb.contains(g, d) && (d.src ? eb._evalUrl && eb._evalUrl(d.src) : eb.globalEval((d.text || d.textContent || d.innerHTML || "").replace(Wb, "")));
                h = c = null
            }
            return this
        }
    }), eb.each({
        appendTo: "append",
        prependTo: "prepend",
        insertBefore: "before",
        insertAfter: "after",
        replaceAll: "replaceWith"
    }, function(a, b) {
        eb.fn[a] = function(a) {
            for (var c, d = 0, e = [], f = eb(a), g = f.length - 1; g >= d; d++) c = d === g ? this : this.clone(!0), eb(f[d])[b](c), Z.apply(e, c.get());
            return this.pushStack(e)
        }
    });
    var $b, _b = {};
    ! function() {
        var a;
        cb.shrinkWrapBlocks = function() {
            if (null != a) return a;
            a = !1;
            var b, c, d;
            return c = ob.getElementsByTagName("body")[0], c && c.style ? (b = ob.createElement("div"), d = ob.createElement("div"), d.style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px", c.appendChild(d).appendChild(b), typeof b.style.zoom !== xb && (b.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:1px;width:1px;zoom:1", b.appendChild(ob.createElement("div")).style.width = "5px", a = 3 !== b.offsetWidth), c.removeChild(d), a) : void 0
        }
    }();
    var ac, bc, cc = /^margin/,
        dc = new RegExp("^(" + Ab + ")(?!px)[a-z%]+$", "i"),
        ec = /^(top|right|bottom|left)$/;
    a.getComputedStyle ? (ac = function(b) {
            return b.ownerDocument.defaultView.opener ? b.ownerDocument.defaultView.getComputedStyle(b, null) : a.getComputedStyle(b, null)
        }, bc = function(a, b, c) {
            var d, e, f, g, h = a.style;
            return c = c || ac(a), g = c ? c.getPropertyValue(b) || c[b] : void 0, c && ("" !== g || eb.contains(a.ownerDocument, a) || (g = eb.style(a, b)), dc.test(g) && cc.test(b) && (d = h.width, e = h.minWidth, f = h.maxWidth, h.minWidth = h.maxWidth = h.width = g, g = c.width, h.width = d, h.minWidth = e, h.maxWidth = f)), void 0 === g ? g : g + ""
        }) : ob.documentElement.currentStyle && (ac = function(a) {
            return a.currentStyle
        }, bc = function(a, b, c) {
            var d, e, f, g, h = a.style;
            return c = c || ac(a), g = c ? c[b] : void 0, null == g && h && h[b] && (g = h[b]), dc.test(g) && !ec.test(b) && (d = h.left, e = a.runtimeStyle, f = e && e.left, f && (e.left = a.currentStyle.left), h.left = "fontSize" === b ? "1em" : g, g = h.pixelLeft + "px", h.left = d, f && (e.left = f)), void 0 === g ? g : g + "" || "auto"
        }),
        function() {
            function b() {
                var b, c, d, e;
                c = ob.getElementsByTagName("body")[0], c && c.style && (b = ob.createElement("div"), d = ob.createElement("div"), d.style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px", c.appendChild(d).appendChild(b), b.style.cssText = "-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;margin-top:1%;top:1%;border:1px;padding:1px;width:4px;position:absolute", f = g = !1, i = !0, a.getComputedStyle && (f = "1%" !== (a.getComputedStyle(b, null) || {}).top, g = "4px" === (a.getComputedStyle(b, null) || {
                    width: "4px"
                }).width, e = b.appendChild(ob.createElement("div")), e.style.cssText = b.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0", e.style.marginRight = e.style.width = "0", b.style.width = "1px", i = !parseFloat((a.getComputedStyle(e, null) || {}).marginRight), b.removeChild(e)), b.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", e = b.getElementsByTagName("td"), e[0].style.cssText = "margin:0;border:0;padding:0;display:none", h = 0 === e[0].offsetHeight, h && (e[0].style.display = "", e[1].style.display = "none", h = 0 === e[0].offsetHeight), c.removeChild(d))
            }
            var c, d, e, f, g, h, i;
            c = ob.createElement("div"), c.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", e = c.getElementsByTagName("a")[0], d = e && e.style, d && (d.cssText = "float:left;opacity:.5", cb.opacity = "0.5" === d.opacity, cb.cssFloat = !!d.cssFloat, c.style.backgroundClip = "content-box", c.cloneNode(!0).style.backgroundClip = "", cb.clearCloneStyle = "content-box" === c.style.backgroundClip, cb.boxSizing = "" === d.boxSizing || "" === d.MozBoxSizing || "" === d.WebkitBoxSizing, eb.extend(cb, {
                reliableHiddenOffsets: function() {
                    return null == h && b(), h
                },
                boxSizingReliable: function() {
                    return null == g && b(), g
                },
                pixelPosition: function() {
                    return null == f && b(), f
                },
                reliableMarginRight: function() {
                    return null == i && b(), i
                }
            }))
        }(), eb.swap = function(a, b, c, d) {
            var e, f, g = {};
            for (f in b) g[f] = a.style[f], a.style[f] = b[f];
            e = c.apply(a, d || []);
            for (f in b) a.style[f] = g[f];
            return e
        };
    var fc = /alpha\([^)]*\)/i,
        gc = /opacity\s*=\s*([^)]*)/,
        hc = /^(none|table(?!-c[ea]).+)/,
        ic = new RegExp("^(" + Ab + ")(.*)$", "i"),
        jc = new RegExp("^([+-])=(" + Ab + ")", "i"),
        kc = {
            position: "absolute",
            visibility: "hidden",
            display: "block"
        },
        lc = {
            letterSpacing: "0",
            fontWeight: "400"
        },
        mc = ["Webkit", "O", "Moz", "ms"];
    eb.extend({
        cssHooks: {
            opacity: {
                get: function(a, b) {
                    if (b) {
                        var c = bc(a, "opacity");
                        return "" === c ? "1" : c
                    }
                }
            }
        },
        cssNumber: {
            columnCount: !0,
            fillOpacity: !0,
            flexGrow: !0,
            flexShrink: !0,
            fontWeight: !0,
            lineHeight: !0,
            opacity: !0,
            order: !0,
            orphans: !0,
            widows: !0,
            zIndex: !0,
            zoom: !0
        },
        cssProps: {
            "float": cb.cssFloat ? "cssFloat" : "styleFloat"
        },
        style: function(a, b, c, d) {
            if (a && 3 !== a.nodeType && 8 !== a.nodeType && a.style) {
                var e, f, g, h = eb.camelCase(b),
                    i = a.style;
                if (b = eb.cssProps[h] || (eb.cssProps[h] = B(i, h)), g = eb.cssHooks[b] || eb.cssHooks[h], void 0 === c) return g && "get" in g && void 0 !== (e = g.get(a, !1, d)) ? e : i[b];
                if (f = typeof c, "string" === f && (e = jc.exec(c)) && (c = (e[1] + 1) * e[2] + parseFloat(eb.css(a, b)), f = "number"), null != c && c === c && ("number" !== f || eb.cssNumber[h] || (c += "px"), cb.clearCloneStyle || "" !== c || 0 !== b.indexOf("background") || (i[b] = "inherit"), !(g && "set" in g && void 0 === (c = g.set(a, c, d))))) try {
                    i[b] = c
                } catch (j) {}
            }
        },
        css: function(a, b, c, d) {
            var e, f, g, h = eb.camelCase(b);
            return b = eb.cssProps[h] || (eb.cssProps[h] = B(a.style, h)), g = eb.cssHooks[b] || eb.cssHooks[h], g && "get" in g && (f = g.get(a, !0, c)), void 0 === f && (f = bc(a, b, d)), "normal" === f && b in lc && (f = lc[b]), "" === c || c ? (e = parseFloat(f), c === !0 || eb.isNumeric(e) ? e || 0 : f) : f
        }
    }), eb.each(["height", "width"], function(a, b) {
        eb.cssHooks[b] = {
            get: function(a, c, d) {
                return c ? hc.test(eb.css(a, "display")) && 0 === a.offsetWidth ? eb.swap(a, kc, function() {
                    return F(a, b, d)
                }) : F(a, b, d) : void 0
            },
            set: function(a, c, d) {
                var e = d && ac(a);
                return D(a, c, d ? E(a, b, d, cb.boxSizing && "border-box" === eb.css(a, "boxSizing", !1, e), e) : 0)
            }
        }
    }), cb.opacity || (eb.cssHooks.opacity = {
        get: function(a, b) {
            return gc.test((b && a.currentStyle ? a.currentStyle.filter : a.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : b ? "1" : ""
        },
        set: function(a, b) {
            var c = a.style,
                d = a.currentStyle,
                e = eb.isNumeric(b) ? "alpha(opacity=" + 100 * b + ")" : "",
                f = d && d.filter || c.filter || "";
            c.zoom = 1, (b >= 1 || "" === b) && "" === eb.trim(f.replace(fc, "")) && c.removeAttribute && (c.removeAttribute("filter"), "" === b || d && !d.filter) || (c.filter = fc.test(f) ? f.replace(fc, e) : f + " " + e)
        }
    }), eb.cssHooks.marginRight = A(cb.reliableMarginRight, function(a, b) {
        return b ? eb.swap(a, {
            display: "inline-block"
        }, bc, [a, "marginRight"]) : void 0
    }), eb.each({
        margin: "",
        padding: "",
        border: "Width"
    }, function(a, b) {
        eb.cssHooks[a + b] = {
            expand: function(c) {
                for (var d = 0, e = {}, f = "string" == typeof c ? c.split(" ") : [c]; 4 > d; d++) e[a + Bb[d] + b] = f[d] || f[d - 2] || f[0];
                return e
            }
        }, cc.test(a) || (eb.cssHooks[a + b].set = D)
    }), eb.fn.extend({
        css: function(a, b) {
            return Db(this, function(a, b, c) {
                var d, e, f = {},
                    g = 0;
                if (eb.isArray(b)) {
                    for (d = ac(a), e = b.length; e > g; g++) f[b[g]] = eb.css(a, b[g], !1, d);
                    return f
                }
                return void 0 !== c ? eb.style(a, b, c) : eb.css(a, b)
            }, a, b, arguments.length > 1)
        },
        show: function() {
            return C(this, !0)
        },
        hide: function() {
            return C(this)
        },
        toggle: function(a) {
            return "boolean" == typeof a ? a ? this.show() : this.hide() : this.each(function() {
                Cb(this) ? eb(this).show() : eb(this).hide()
            })
        }
    }), eb.Tween = G, G.prototype = {
        constructor: G,
        init: function(a, b, c, d, e, f) {
            this.elem = a, this.prop = c, this.easing = e || "swing", this.options = b, this.start = this.now = this.cur(), this.end = d, this.unit = f || (eb.cssNumber[c] ? "" : "px")
        },
        cur: function() {
            var a = G.propHooks[this.prop];
            return a && a.get ? a.get(this) : G.propHooks._default.get(this)
        },
        run: function(a) {
            var b, c = G.propHooks[this.prop];
            return this.pos = b = this.options.duration ? eb.easing[this.easing](a, this.options.duration * a, 0, 1, this.options.duration) : a, this.now = (this.end - this.start) * b + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), c && c.set ? c.set(this) : G.propHooks._default.set(this), this
        }
    }, G.prototype.init.prototype = G.prototype, G.propHooks = {
        _default: {
            get: function(a) {
                var b;
                return null == a.elem[a.prop] || a.elem.style && null != a.elem.style[a.prop] ? (b = eb.css(a.elem, a.prop, ""), b && "auto" !== b ? b : 0) : a.elem[a.prop]
            },
            set: function(a) {
                eb.fx.step[a.prop] ? eb.fx.step[a.prop](a) : a.elem.style && (null != a.elem.style[eb.cssProps[a.prop]] || eb.cssHooks[a.prop]) ? eb.style(a.elem, a.prop, a.now + a.unit) : a.elem[a.prop] = a.now
            }
        }
    }, G.propHooks.scrollTop = G.propHooks.scrollLeft = {
        set: function(a) {
            a.elem.nodeType && a.elem.parentNode && (a.elem[a.prop] = a.now)
        }
    }, eb.easing = {
        linear: function(a) {
            return a
        },
        swing: function(a) {
            return .5 - Math.cos(a * Math.PI) / 2
        }
    }, eb.fx = G.prototype.init, eb.fx.step = {};
    var nc, oc, pc = /^(?:toggle|show|hide)$/,
        qc = new RegExp("^(?:([+-])=|)(" + Ab + ")([a-z%]*)$", "i"),
        rc = /queueHooks$/,
        sc = [K],
        tc = {
            "*": [function(a, b) {
                var c = this.createTween(a, b),
                    d = c.cur(),
                    e = qc.exec(b),
                    f = e && e[3] || (eb.cssNumber[a] ? "" : "px"),
                    g = (eb.cssNumber[a] || "px" !== f && +d) && qc.exec(eb.css(c.elem, a)),
                    h = 1,
                    i = 20;
                if (g && g[3] !== f) {
                    f = f || g[3], e = e || [], g = +d || 1;
                    do h = h || ".5", g /= h, eb.style(c.elem, a, g + f); while (h !== (h = c.cur() / d) && 1 !== h && --i)
                }
                return e && (g = c.start = +g || +d || 0, c.unit = f, c.end = e[1] ? g + (e[1] + 1) * e[2] : +e[2]), c
            }]
        };
    eb.Animation = eb.extend(M, {
            tweener: function(a, b) {
                eb.isFunction(a) ? (b = a, a = ["*"]) : a = a.split(" ");
                for (var c, d = 0, e = a.length; e > d; d++) c = a[d], tc[c] = tc[c] || [], tc[c].unshift(b)
            },
            prefilter: function(a, b) {
                b ? sc.unshift(a) : sc.push(a)
            }
        }), eb.speed = function(a, b, c) {
            var d = a && "object" == typeof a ? eb.extend({}, a) : {
                complete: c || !c && b || eb.isFunction(a) && a,
                duration: a,
                easing: c && b || b && !eb.isFunction(b) && b
            };
            return d.duration = eb.fx.off ? 0 : "number" == typeof d.duration ? d.duration : d.duration in eb.fx.speeds ? eb.fx.speeds[d.duration] : eb.fx.speeds._default, (null == d.queue || d.queue === !0) && (d.queue = "fx"), d.old = d.complete, d.complete = function() {
                eb.isFunction(d.old) && d.old.call(this), d.queue && eb.dequeue(this, d.queue)
            }, d
        }, eb.fn.extend({
            fadeTo: function(a, b, c, d) {
                return this.filter(Cb).css("opacity", 0).show().end().animate({
                    opacity: b
                }, a, c, d)
            },
            animate: function(a, b, c, d) {
                var e = eb.isEmptyObject(a),
                    f = eb.speed(b, c, d),
                    g = function() {
                        var b = M(this, eb.extend({}, a), f);
                        (e || eb._data(this, "finish")) && b.stop(!0)
                    };
                return g.finish = g, e || f.queue === !1 ? this.each(g) : this.queue(f.queue, g)
            },
            stop: function(a, b, c) {
                var d = function(a) {
                    var b = a.stop;
                    delete a.stop, b(c)
                };
                return "string" != typeof a && (c = b, b = a, a = void 0), b && a !== !1 && this.queue(a || "fx", []), this.each(function() {
                    var b = !0,
                        e = null != a && a + "queueHooks",
                        f = eb.timers,
                        g = eb._data(this);
                    if (e) g[e] && g[e].stop && d(g[e]);
                    else
                        for (e in g) g[e] && g[e].stop && rc.test(e) && d(g[e]);
                    for (e = f.length; e--;) f[e].elem !== this || null != a && f[e].queue !== a || (f[e].anim.stop(c), b = !1, f.splice(e, 1));
                    (b || !c) && eb.dequeue(this, a)
                })
            },
            finish: function(a) {
                return a !== !1 && (a = a || "fx"), this.each(function() {
                    var b, c = eb._data(this),
                        d = c[a + "queue"],
                        e = c[a + "queueHooks"],
                        f = eb.timers,
                        g = d ? d.length : 0;
                    for (c.finish = !0, eb.queue(this, a, []), e && e.stop && e.stop.call(this, !0), b = f.length; b--;) f[b].elem === this && f[b].queue === a && (f[b].anim.stop(!0), f.splice(b, 1));
                    for (b = 0; g > b; b++) d[b] && d[b].finish && d[b].finish.call(this);
                    delete c.finish
                })
            }
        }), eb.each(["toggle", "show", "hide"], function(a, b) {
            var c = eb.fn[b];
            eb.fn[b] = function(a, d, e) {
                return null == a || "boolean" == typeof a ? c.apply(this, arguments) : this.animate(I(b, !0), a, d, e)
            }
        }), eb.each({
            slideDown: I("show"),
            slideUp: I("hide"),
            slideToggle: I("toggle"),
            fadeIn: {
                opacity: "show"
            },
            fadeOut: {
                opacity: "hide"
            },
            fadeToggle: {
                opacity: "toggle"
            }
        }, function(a, b) {
            eb.fn[a] = function(a, c, d) {
                return this.animate(b, a, c, d)
            }
        }), eb.timers = [], eb.fx.tick = function() {
            var a, b = eb.timers,
                c = 0;
            for (nc = eb.now(); c < b.length; c++) a = b[c], a() || b[c] !== a || b.splice(c--, 1);
            b.length || eb.fx.stop(), nc = void 0
        }, eb.fx.timer = function(a) {
            eb.timers.push(a), a() ? eb.fx.start() : eb.timers.pop()
        }, eb.fx.interval = 13, eb.fx.start = function() {
            oc || (oc = setInterval(eb.fx.tick, eb.fx.interval))
        }, eb.fx.stop = function() {
            clearInterval(oc), oc = null
        }, eb.fx.speeds = {
            slow: 600,
            fast: 200,
            _default: 400
        }, eb.fn.delay = function(a, b) {
            return a = eb.fx ? eb.fx.speeds[a] || a : a, b = b || "fx", this.queue(b, function(b, c) {
                var d = setTimeout(b, a);
                c.stop = function() {
                    clearTimeout(d)
                }
            })
        },
        function() {
            var a, b, c, d, e;
            b = ob.createElement("div"), b.setAttribute("className", "t"), b.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", d = b.getElementsByTagName("a")[0], c = ob.createElement("select"), e = c.appendChild(ob.createElement("option")), a = b.getElementsByTagName("input")[0], d.style.cssText = "top:1px", cb.getSetAttribute = "t" !== b.className, cb.style = /top/.test(d.getAttribute("style")), cb.hrefNormalized = "/a" === d.getAttribute("href"), cb.checkOn = !!a.value, cb.optSelected = e.selected, cb.enctype = !!ob.createElement("form").enctype, c.disabled = !0, cb.optDisabled = !e.disabled, a = ob.createElement("input"), a.setAttribute("value", ""), cb.input = "" === a.getAttribute("value"), a.value = "t", a.setAttribute("type", "radio"), cb.radioValue = "t" === a.value
        }();
    var uc = /\r/g;
    eb.fn.extend({
        val: function(a) {
            var b, c, d, e = this[0]; {
                if (arguments.length) return d = eb.isFunction(a), this.each(function(c) {
                    var e;
                    1 === this.nodeType && (e = d ? a.call(this, c, eb(this).val()) : a, null == e ? e = "" : "number" == typeof e ? e += "" : eb.isArray(e) && (e = eb.map(e, function(a) {
                        return null == a ? "" : a + ""
                    })), b = eb.valHooks[this.type] || eb.valHooks[this.nodeName.toLowerCase()], b && "set" in b && void 0 !== b.set(this, e, "value") || (this.value = e))
                });
                if (e) return b = eb.valHooks[e.type] || eb.valHooks[e.nodeName.toLowerCase()], b && "get" in b && void 0 !== (c = b.get(e, "value")) ? c : (c = e.value, "string" == typeof c ? c.replace(uc, "") : null == c ? "" : c)
            }
        }
    }), eb.extend({
        valHooks: {
            option: {
                get: function(a) {
                    var b = eb.find.attr(a, "value");
                    return null != b ? b : eb.trim(eb.text(a))
                }
            },
            select: {
                get: function(a) {
                    for (var b, c, d = a.options, e = a.selectedIndex, f = "select-one" === a.type || 0 > e, g = f ? null : [], h = f ? e + 1 : d.length, i = 0 > e ? h : f ? e : 0; h > i; i++)
                        if (c = d[i], !(!c.selected && i !== e || (cb.optDisabled ? c.disabled : null !== c.getAttribute("disabled")) || c.parentNode.disabled && eb.nodeName(c.parentNode, "optgroup"))) {
                            if (b = eb(c).val(), f) return b;
                            g.push(b)
                        }
                    return g
                },
                set: function(a, b) {
                    for (var c, d, e = a.options, f = eb.makeArray(b), g = e.length; g--;)
                        if (d = e[g], eb.inArray(eb.valHooks.option.get(d), f) >= 0) try {
                            d.selected = c = !0
                        } catch (h) {
                            d.scrollHeight
                        } else d.selected = !1;
                    return c || (a.selectedIndex = -1), e
                }
            }
        }
    }), eb.each(["radio", "checkbox"], function() {
        eb.valHooks[this] = {
            set: function(a, b) {
                return eb.isArray(b) ? a.checked = eb.inArray(eb(a).val(), b) >= 0 : void 0
            }
        }, cb.checkOn || (eb.valHooks[this].get = function(a) {
            return null === a.getAttribute("value") ? "on" : a.value
        })
    });
    var vc, wc, xc = eb.expr.attrHandle,
        yc = /^(?:checked|selected)$/i,
        zc = cb.getSetAttribute,
        Ac = cb.input;
    eb.fn.extend({
        attr: function(a, b) {
            return Db(this, eb.attr, a, b, arguments.length > 1)
        },
        removeAttr: function(a) {
            return this.each(function() {
                eb.removeAttr(this, a)
            })
        }
    }), eb.extend({
        attr: function(a, b, c) {
            var d, e, f = a.nodeType;
            if (a && 3 !== f && 8 !== f && 2 !== f) return typeof a.getAttribute === xb ? eb.prop(a, b, c) : (1 === f && eb.isXMLDoc(a) || (b = b.toLowerCase(), d = eb.attrHooks[b] || (eb.expr.match.bool.test(b) ? wc : vc)), void 0 === c ? d && "get" in d && null !== (e = d.get(a, b)) ? e : (e = eb.find.attr(a, b), null == e ? void 0 : e) : null !== c ? d && "set" in d && void 0 !== (e = d.set(a, c, b)) ? e : (a.setAttribute(b, c + ""), c) : void eb.removeAttr(a, b))
        },
        removeAttr: function(a, b) {
            var c, d, e = 0,
                f = b && b.match(tb);
            if (f && 1 === a.nodeType)
                for (; c = f[e++];) d = eb.propFix[c] || c, eb.expr.match.bool.test(c) ? Ac && zc || !yc.test(c) ? a[d] = !1 : a[eb.camelCase("default-" + c)] = a[d] = !1 : eb.attr(a, c, ""), a.removeAttribute(zc ? c : d)
        },
        attrHooks: {
            type: {
                set: function(a, b) {
                    if (!cb.radioValue && "radio" === b && eb.nodeName(a, "input")) {
                        var c = a.value;
                        return a.setAttribute("type", b), c && (a.value = c), b
                    }
                }
            }
        }
    }), wc = {
        set: function(a, b, c) {
            return b === !1 ? eb.removeAttr(a, c) : Ac && zc || !yc.test(c) ? a.setAttribute(!zc && eb.propFix[c] || c, c) : a[eb.camelCase("default-" + c)] = a[c] = !0, c
        }
    }, eb.each(eb.expr.match.bool.source.match(/\w+/g), function(a, b) {
        var c = xc[b] || eb.find.attr;
        xc[b] = Ac && zc || !yc.test(b) ? function(a, b, d) {
            var e, f;
            return d || (f = xc[b], xc[b] = e, e = null != c(a, b, d) ? b.toLowerCase() : null, xc[b] = f), e
        } : function(a, b, c) {
            return c ? void 0 : a[eb.camelCase("default-" + b)] ? b.toLowerCase() : null
        }
    }), Ac && zc || (eb.attrHooks.value = {
        set: function(a, b, c) {
            return eb.nodeName(a, "input") ? void(a.defaultValue = b) : vc && vc.set(a, b, c)
        }
    }), zc || (vc = {
        set: function(a, b, c) {
            var d = a.getAttributeNode(c);
            return d || a.setAttributeNode(d = a.ownerDocument.createAttribute(c)), d.value = b += "", "value" === c || b === a.getAttribute(c) ? b : void 0
        }
    }, xc.id = xc.name = xc.coords = function(a, b, c) {
        var d;
        return c ? void 0 : (d = a.getAttributeNode(b)) && "" !== d.value ? d.value : null
    }, eb.valHooks.button = {
        get: function(a, b) {
            var c = a.getAttributeNode(b);
            return c && c.specified ? c.value : void 0
        },
        set: vc.set
    }, eb.attrHooks.contenteditable = {
        set: function(a, b, c) {
            vc.set(a, "" === b ? !1 : b, c)
        }
    }, eb.each(["width", "height"], function(a, b) {
        eb.attrHooks[b] = {
            set: function(a, c) {
                return "" === c ? (a.setAttribute(b, "auto"), c) : void 0
            }
        }
    })), cb.style || (eb.attrHooks.style = {
        get: function(a) {
            return a.style.cssText || void 0
        },
        set: function(a, b) {
            return a.style.cssText = b + ""
        }
    });
    var Bc = /^(?:input|select|textarea|button|object)$/i,
        Cc = /^(?:a|area)$/i;
    eb.fn.extend({
        prop: function(a, b) {
            return Db(this, eb.prop, a, b, arguments.length > 1)
        },
        removeProp: function(a) {
            return a = eb.propFix[a] || a, this.each(function() {
                try {
                    this[a] = void 0, delete this[a]
                } catch (b) {}
            })
        }
    }), eb.extend({
        propFix: {
            "for": "htmlFor",
            "class": "className"
        },
        prop: function(a, b, c) {
            var d, e, f, g = a.nodeType;
            if (a && 3 !== g && 8 !== g && 2 !== g) return f = 1 !== g || !eb.isXMLDoc(a), f && (b = eb.propFix[b] || b, e = eb.propHooks[b]), void 0 !== c ? e && "set" in e && void 0 !== (d = e.set(a, c, b)) ? d : a[b] = c : e && "get" in e && null !== (d = e.get(a, b)) ? d : a[b]
        },
        propHooks: {
            tabIndex: {
                get: function(a) {
                    var b = eb.find.attr(a, "tabindex");
                    return b ? parseInt(b, 10) : Bc.test(a.nodeName) || Cc.test(a.nodeName) && a.href ? 0 : -1
                }
            }
        }
    }), cb.hrefNormalized || eb.each(["href", "src"], function(a, b) {
        eb.propHooks[b] = {
            get: function(a) {
                return a.getAttribute(b, 4)
            }
        }
    }), cb.optSelected || (eb.propHooks.selected = {
        get: function(a) {
            var b = a.parentNode;
            return b && (b.selectedIndex, b.parentNode && b.parentNode.selectedIndex), null
        }
    }), eb.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function() {
        eb.propFix[this.toLowerCase()] = this
    }), cb.enctype || (eb.propFix.enctype = "encoding");
    var Dc = /[\t\r\n\f]/g;
    eb.fn.extend({
        addClass: function(a) {
            var b, c, d, e, f, g, h = 0,
                i = this.length,
                j = "string" == typeof a && a;
            if (eb.isFunction(a)) return this.each(function(b) {
                eb(this).addClass(a.call(this, b, this.className))
            });
            if (j)
                for (b = (a || "").match(tb) || []; i > h; h++)
                    if (c = this[h], d = 1 === c.nodeType && (c.className ? (" " + c.className + " ").replace(Dc, " ") : " ")) {
                        for (f = 0; e = b[f++];) d.indexOf(" " + e + " ") < 0 && (d += e + " ");
                        g = eb.trim(d), c.className !== g && (c.className = g)
                    }
            return this
        },
        removeClass: function(a) {
            var b, c, d, e, f, g, h = 0,
                i = this.length,
                j = 0 === arguments.length || "string" == typeof a && a;
            if (eb.isFunction(a)) return this.each(function(b) {
                eb(this).removeClass(a.call(this, b, this.className))
            });
            if (j)
                for (b = (a || "").match(tb) || []; i > h; h++)
                    if (c = this[h], d = 1 === c.nodeType && (c.className ? (" " + c.className + " ").replace(Dc, " ") : "")) {
                        for (f = 0; e = b[f++];)
                            for (; d.indexOf(" " + e + " ") >= 0;) d = d.replace(" " + e + " ", " ");
                        g = a ? eb.trim(d) : "", c.className !== g && (c.className = g)
                    }
            return this
        },
        toggleClass: function(a, b) {
            var c = typeof a;
            return "boolean" == typeof b && "string" === c ? b ? this.addClass(a) : this.removeClass(a) : this.each(eb.isFunction(a) ? function(c) {
                eb(this).toggleClass(a.call(this, c, this.className, b), b)
            } : function() {
                if ("string" === c)
                    for (var b, d = 0, e = eb(this), f = a.match(tb) || []; b = f[d++];) e.hasClass(b) ? e.removeClass(b) : e.addClass(b);
                else(c === xb || "boolean" === c) && (this.className && eb._data(this, "__className__", this.className), this.className = this.className || a === !1 ? "" : eb._data(this, "__className__") || "")
            })
        },
        hasClass: function(a) {
            for (var b = " " + a + " ", c = 0, d = this.length; d > c; c++)
                if (1 === this[c].nodeType && (" " + this[c].className + " ").replace(Dc, " ").indexOf(b) >= 0) return !0;
            return !1
        }
    }), eb.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function(a, b) {
        eb.fn[b] = function(a, c) {
            return arguments.length > 0 ? this.on(b, null, a, c) : this.trigger(b)
        }
    }), eb.fn.extend({
        hover: function(a, b) {
            return this.mouseenter(a).mouseleave(b || a)
        },
        bind: function(a, b, c) {
            return this.on(a, null, b, c)
        },
        unbind: function(a, b) {
            return this.off(a, null, b)
        },
        delegate: function(a, b, c, d) {
            return this.on(b, a, c, d)
        },
        undelegate: function(a, b, c) {
            return 1 === arguments.length ? this.off(a, "**") : this.off(b, a || "**", c)
        }
    });
    var Ec = eb.now(),
        Fc = /\?/,
        Gc = /(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;
    eb.parseJSON = function(b) {
        if (a.JSON && a.JSON.parse) return a.JSON.parse(b + "");
        var c, d = null,
            e = eb.trim(b + "");
        return e && !eb.trim(e.replace(Gc, function(a, b, e, f) {
            return c && b && (d = 0), 0 === d ? a : (c = e || b, d += !f - !e, "")
        })) ? Function("return " + e)() : eb.error("Invalid JSON: " + b)
    }, eb.parseXML = function(b) {
        var c, d;
        if (!b || "string" != typeof b) return null;
        try {
            a.DOMParser ? (d = new DOMParser, c = d.parseFromString(b, "text/xml")) : (c = new ActiveXObject("Microsoft.XMLDOM"), c.async = "false", c.loadXML(b))
        } catch (e) {
            c = void 0
        }
        return c && c.documentElement && !c.getElementsByTagName("parsererror").length || eb.error("Invalid XML: " + b), c
    };
    var Hc, Ic, Jc = /#.*$/,
        Kc = /([?&])_=[^&]*/,
        Lc = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm,
        Mc = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/,
        Nc = /^(?:GET|HEAD)$/,
        Oc = /^\/\//,
        Pc = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,
        Qc = {},
        Rc = {},
        Sc = "*/".concat("*");
    try {
        Ic = location.href
    } catch (Tc) {
        Ic = ob.createElement("a"), Ic.href = "", Ic = Ic.href
    }
    Hc = Pc.exec(Ic.toLowerCase()) || [], eb.extend({
        active: 0,
        lastModified: {},
        etag: {},
        ajaxSettings: {
            url: Ic,
            type: "GET",
            isLocal: Mc.test(Hc[1]),
            global: !0,
            processData: !0,
            async: !0,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            accepts: {
                "*": Sc,
                text: "text/plain",
                html: "text/html",
                xml: "application/xml, text/xml",
                json: "application/json, text/javascript"
            },
            contents: {
                xml: /xml/,
                html: /html/,
                json: /json/
            },
            responseFields: {
                xml: "responseXML",
                text: "responseText",
                json: "responseJSON"
            },
            converters: {
                "* text": String,
                "text html": !0,
                "text json": eb.parseJSON,
                "text xml": eb.parseXML
            },
            flatOptions: {
                url: !0,
                context: !0
            }
        },
        ajaxSetup: function(a, b) {
            return b ? P(P(a, eb.ajaxSettings), b) : P(eb.ajaxSettings, a)
        },
        ajaxPrefilter: N(Qc),
        ajaxTransport: N(Rc),
        ajax: function(a, b) {
            function c(a, b, c, d) {
                var e, k, r, s, u, w = b;
                2 !== t && (t = 2, h && clearTimeout(h), j = void 0, g = d || "", v.readyState = a > 0 ? 4 : 0, e = a >= 200 && 300 > a || 304 === a, c && (s = Q(l, v, c)), s = R(l, s, v, e), e ? (l.ifModified && (u = v.getResponseHeader("Last-Modified"), u && (eb.lastModified[f] = u), u = v.getResponseHeader("etag"), u && (eb.etag[f] = u)), 204 === a || "HEAD" === l.type ? w = "nocontent" : 304 === a ? w = "notmodified" : (w = s.state, k = s.data, r = s.error, e = !r)) : (r = w, (a || !w) && (w = "error", 0 > a && (a = 0))), v.status = a, v.statusText = (b || w) + "", e ? o.resolveWith(m, [k, w, v]) : o.rejectWith(m, [v, w, r]), v.statusCode(q), q = void 0, i && n.trigger(e ? "ajaxSuccess" : "ajaxError", [v, l, e ? k : r]), p.fireWith(m, [v, w]), i && (n.trigger("ajaxComplete", [v, l]), --eb.active || eb.event.trigger("ajaxStop")))
            }
            "object" == typeof a && (b = a, a = void 0), b = b || {};
            var d, e, f, g, h, i, j, k, l = eb.ajaxSetup({}, b),
                m = l.context || l,
                n = l.context && (m.nodeType || m.jquery) ? eb(m) : eb.event,
                o = eb.Deferred(),
                p = eb.Callbacks("once memory"),
                q = l.statusCode || {},
                r = {},
                s = {},
                t = 0,
                u = "canceled",
                v = {
                    readyState: 0,
                    getResponseHeader: function(a) {
                        var b;
                        if (2 === t) {
                            if (!k)
                                for (k = {}; b = Lc.exec(g);) k[b[1].toLowerCase()] = b[2];
                            b = k[a.toLowerCase()]
                        }
                        return null == b ? null : b
                    },
                    getAllResponseHeaders: function() {
                        return 2 === t ? g : null
                    },
                    setRequestHeader: function(a, b) {
                        var c = a.toLowerCase();
                        return t || (a = s[c] = s[c] || a, r[a] = b), this
                    },
                    overrideMimeType: function(a) {
                        return t || (l.mimeType = a), this
                    },
                    statusCode: function(a) {
                        var b;
                        if (a)
                            if (2 > t)
                                for (b in a) q[b] = [q[b], a[b]];
                            else v.always(a[v.status]);
                        return this
                    },
                    abort: function(a) {
                        var b = a || u;
                        return j && j.abort(b), c(0, b), this
                    }
                };
            if (o.promise(v).complete = p.add, v.success = v.done, v.error = v.fail, l.url = ((a || l.url || Ic) + "").replace(Jc, "").replace(Oc, Hc[1] + "//"), l.type = b.method || b.type || l.method || l.type, l.dataTypes = eb.trim(l.dataType || "*").toLowerCase().match(tb) || [""], null == l.crossDomain && (d = Pc.exec(l.url.toLowerCase()), l.crossDomain = !(!d || d[1] === Hc[1] && d[2] === Hc[2] && (d[3] || ("http:" === d[1] ? "80" : "443")) === (Hc[3] || ("http:" === Hc[1] ? "80" : "443")))), l.data && l.processData && "string" != typeof l.data && (l.data = eb.param(l.data, l.traditional)), O(Qc, l, b, v), 2 === t) return v;
            i = eb.event && l.global, i && 0 === eb.active++ && eb.event.trigger("ajaxStart"), l.type = l.type.toUpperCase(), l.hasContent = !Nc.test(l.type), f = l.url, l.hasContent || (l.data && (f = l.url += (Fc.test(f) ? "&" : "?") + l.data, delete l.data), l.cache === !1 && (l.url = Kc.test(f) ? f.replace(Kc, "$1_=" + Ec++) : f + (Fc.test(f) ? "&" : "?") + "_=" + Ec++)), l.ifModified && (eb.lastModified[f] && v.setRequestHeader("If-Modified-Since", eb.lastModified[f]), eb.etag[f] && v.setRequestHeader("If-None-Match", eb.etag[f])), (l.data && l.hasContent && l.contentType !== !1 || b.contentType) && v.setRequestHeader("Content-Type", l.contentType), v.setRequestHeader("Accept", l.dataTypes[0] && l.accepts[l.dataTypes[0]] ? l.accepts[l.dataTypes[0]] + ("*" !== l.dataTypes[0] ? ", " + Sc + "; q=0.01" : "") : l.accepts["*"]);
            for (e in l.headers) v.setRequestHeader(e, l.headers[e]);
            if (l.beforeSend && (l.beforeSend.call(m, v, l) === !1 || 2 === t)) return v.abort();
            u = "abort";
            for (e in {
                    success: 1,
                    error: 1,
                    complete: 1
                }) v[e](l[e]);
            if (j = O(Rc, l, b, v)) {
                v.readyState = 1, i && n.trigger("ajaxSend", [v, l]), l.async && l.timeout > 0 && (h = setTimeout(function() {
                    v.abort("timeout")
                }, l.timeout));
                try {
                    t = 1, j.send(r, c)
                } catch (w) {
                    if (!(2 > t)) throw w;
                    c(-1, w)
                }
            } else c(-1, "No Transport");
            return v
        },
        getJSON: function(a, b, c) {
            return eb.get(a, b, c, "json")
        },
        getScript: function(a, b) {
            return eb.get(a, void 0, b, "script")
        }
    }), eb.each(["get", "post"], function(a, b) {
        eb[b] = function(a, c, d, e) {
            return eb.isFunction(c) && (e = e || d, d = c, c = void 0), eb.ajax({
                url: a,
                type: b,
                dataType: e,
                data: c,
                success: d
            })
        }
    }), eb._evalUrl = function(a) {
        return eb.ajax({
            url: a,
            type: "GET",
            dataType: "script",
            async: !1,
            global: !1,
            "throws": !0
        })
    }, eb.fn.extend({
        wrapAll: function(a) {
            if (eb.isFunction(a)) return this.each(function(b) {
                eb(this).wrapAll(a.call(this, b))
            });
            if (this[0]) {
                var b = eb(a, this[0].ownerDocument).eq(0).clone(!0);
                this[0].parentNode && b.insertBefore(this[0]), b.map(function() {
                    for (var a = this; a.firstChild && 1 === a.firstChild.nodeType;) a = a.firstChild;
                    return a
                }).append(this)
            }
            return this
        },
        wrapInner: function(a) {
            return this.each(eb.isFunction(a) ? function(b) {
                eb(this).wrapInner(a.call(this, b))
            } : function() {
                var b = eb(this),
                    c = b.contents();
                c.length ? c.wrapAll(a) : b.append(a)
            })
        },
        wrap: function(a) {
            var b = eb.isFunction(a);
            return this.each(function(c) {
                eb(this).wrapAll(b ? a.call(this, c) : a)
            })
        },
        unwrap: function() {
            return this.parent().each(function() {
                eb.nodeName(this, "body") || eb(this).replaceWith(this.childNodes)
            }).end()
        }
    }), eb.expr.filters.hidden = function(a) {
        return a.offsetWidth <= 0 && a.offsetHeight <= 0 || !cb.reliableHiddenOffsets() && "none" === (a.style && a.style.display || eb.css(a, "display"))
    }, eb.expr.filters.visible = function(a) {
        return !eb.expr.filters.hidden(a)
    };
    var Uc = /%20/g,
        Vc = /\[\]$/,
        Wc = /\r?\n/g,
        Xc = /^(?:submit|button|image|reset|file)$/i,
        Yc = /^(?:input|select|textarea|keygen)/i;
    eb.param = function(a, b) {
        var c, d = [],
            e = function(a, b) {
                b = eb.isFunction(b) ? b() : null == b ? "" : b, d[d.length] = encodeURIComponent(a) + "=" + encodeURIComponent(b)
            };
        if (void 0 === b && (b = eb.ajaxSettings && eb.ajaxSettings.traditional), eb.isArray(a) || a.jquery && !eb.isPlainObject(a)) eb.each(a, function() {
            e(this.name, this.value)
        });
        else
            for (c in a) S(c, a[c], b, e);
        return d.join("&").replace(Uc, "+")
    }, eb.fn.extend({
        serialize: function() {
            return eb.param(this.serializeArray())
        },
        serializeArray: function() {
            return this.map(function() {
                var a = eb.prop(this, "elements");
                return a ? eb.makeArray(a) : this
            }).filter(function() {
                var a = this.type;
                return this.name && !eb(this).is(":disabled") && Yc.test(this.nodeName) && !Xc.test(a) && (this.checked || !Eb.test(a))
            }).map(function(a, b) {
                var c = eb(this).val();
                return null == c ? null : eb.isArray(c) ? eb.map(c, function(a) {
                    return {
                        name: b.name,
                        value: a.replace(Wc, "\r\n")
                    }
                }) : {
                    name: b.name,
                    value: c.replace(Wc, "\r\n")
                }
            }).get()
        }
    }), eb.ajaxSettings.xhr = void 0 !== a.ActiveXObject ? function() {
        return !this.isLocal && /^(get|post|head|put|delete|options)$/i.test(this.type) && T() || U()
    } : T;
    var Zc = 0,
        $c = {},
        _c = eb.ajaxSettings.xhr();
    a.attachEvent && a.attachEvent("onunload", function() {
        for (var a in $c) $c[a](void 0, !0)
    }), cb.cors = !!_c && "withCredentials" in _c, _c = cb.ajax = !!_c, _c && eb.ajaxTransport(function(a) {
        if (!a.crossDomain || cb.cors) {
            var b;
            return {
                send: function(c, d) {
                    var e, f = a.xhr(),
                        g = ++Zc;
                    if (f.open(a.type, a.url, a.async, a.username, a.password), a.xhrFields)
                        for (e in a.xhrFields) f[e] = a.xhrFields[e];
                    a.mimeType && f.overrideMimeType && f.overrideMimeType(a.mimeType), a.crossDomain || c["X-Requested-With"] || (c["X-Requested-With"] = "XMLHttpRequest");
                    for (e in c) void 0 !== c[e] && f.setRequestHeader(e, c[e] + "");
                    f.send(a.hasContent && a.data || null), b = function(c, e) {
                        var h, i, j;
                        if (b && (e || 4 === f.readyState))
                            if (delete $c[g], b = void 0, f.onreadystatechange = eb.noop, e) 4 !== f.readyState && f.abort();
                            else {
                                j = {}, h = f.status, "string" == typeof f.responseText && (j.text = f.responseText);
                                try {
                                    i = f.statusText
                                } catch (k) {
                                    i = ""
                                }
                                h || !a.isLocal || a.crossDomain ? 1223 === h && (h = 204) : h = j.text ? 200 : 404
                            }
                        j && d(h, i, j, f.getAllResponseHeaders())
                    }, a.async ? 4 === f.readyState ? setTimeout(b) : f.onreadystatechange = $c[g] = b : b()
                },
                abort: function() {
                    b && b(void 0, !0)
                }
            }
        }
    }), eb.ajaxSetup({
        accepts: {
            script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
        },
        contents: {
            script: /(?:java|ecma)script/
        },
        converters: {
            "text script": function(a) {
                return eb.globalEval(a), a
            }
        }
    }), eb.ajaxPrefilter("script", function(a) {
        void 0 === a.cache && (a.cache = !1), a.crossDomain && (a.type = "GET", a.global = !1)
    }), eb.ajaxTransport("script", function(a) {
        if (a.crossDomain) {
            var b, c = ob.head || eb("head")[0] || ob.documentElement;
            return {
                send: function(d, e) {
                    b = ob.createElement("script"), b.async = !0, a.scriptCharset && (b.charset = a.scriptCharset), b.src = a.url, b.onload = b.onreadystatechange = function(a, c) {
                        (c || !b.readyState || /loaded|complete/.test(b.readyState)) && (b.onload = b.onreadystatechange = null, b.parentNode && b.parentNode.removeChild(b), b = null, c || e(200, "success"))
                    }, c.insertBefore(b, c.firstChild)
                },
                abort: function() {
                    b && b.onload(void 0, !0)
                }
            }
        }
    });
    var ad = [],
        bd = /(=)\?(?=&|$)|\?\?/;
    eb.ajaxSetup({
        jsonp: "callback",
        jsonpCallback: function() {
            var a = ad.pop() || eb.expando + "_" + Ec++;
            return this[a] = !0, a
        }
    }), eb.ajaxPrefilter("json jsonp", function(b, c, d) {
        var e, f, g, h = b.jsonp !== !1 && (bd.test(b.url) ? "url" : "string" == typeof b.data && !(b.contentType || "").indexOf("application/x-www-form-urlencoded") && bd.test(b.data) && "data");
        return h || "jsonp" === b.dataTypes[0] ? (e = b.jsonpCallback = eb.isFunction(b.jsonpCallback) ? b.jsonpCallback() : b.jsonpCallback, h ? b[h] = b[h].replace(bd, "$1" + e) : b.jsonp !== !1 && (b.url += (Fc.test(b.url) ? "&" : "?") + b.jsonp + "=" + e), b.converters["script json"] = function() {
            return g || eb.error(e + " was not called"), g[0]
        }, b.dataTypes[0] = "json", f = a[e], a[e] = function() {
            g = arguments
        }, d.always(function() {
            a[e] = f, b[e] && (b.jsonpCallback = c.jsonpCallback, ad.push(e)), g && eb.isFunction(f) && f(g[0]), g = f = void 0
        }), "script") : void 0
    }), eb.parseHTML = function(a, b, c) {
        if (!a || "string" != typeof a) return null;
        "boolean" == typeof b && (c = b, b = !1), b = b || ob;
        var d = lb.exec(a),
            e = !c && [];
        return d ? [b.createElement(d[1])] : (d = eb.buildFragment([a], b, e), e && e.length && eb(e).remove(), eb.merge([], d.childNodes))
    };
    var cd = eb.fn.load;
    eb.fn.load = function(a, b, c) {
        if ("string" != typeof a && cd) return cd.apply(this, arguments);
        var d, e, f, g = this,
            h = a.indexOf(" ");
        return h >= 0 && (d = eb.trim(a.slice(h, a.length)), a = a.slice(0, h)), eb.isFunction(b) ? (c = b, b = void 0) : b && "object" == typeof b && (f = "POST"), g.length > 0 && eb.ajax({
            url: a,
            type: f,
            dataType: "html",
            data: b
        }).done(function(a) {
            e = arguments, g.html(d ? eb("<div>").append(eb.parseHTML(a)).find(d) : a)
        }).complete(c && function(a, b) {
            g.each(c, e || [a.responseText, b, a])
        }), this
    }, eb.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function(a, b) {
        eb.fn[b] = function(a) {
            return this.on(b, a)
        }
    }), eb.expr.filters.animated = function(a) {
        return eb.grep(eb.timers, function(b) {
            return a === b.elem
        }).length
    };
    var dd = a.document.documentElement;
    eb.offset = {
        setOffset: function(a, b, c) {
            var d, e, f, g, h, i, j, k = eb.css(a, "position"),
                l = eb(a),
                m = {};
            "static" === k && (a.style.position = "relative"), h = l.offset(), f = eb.css(a, "top"), i = eb.css(a, "left"), j = ("absolute" === k || "fixed" === k) && eb.inArray("auto", [f, i]) > -1, j ? (d = l.position(), g = d.top, e = d.left) : (g = parseFloat(f) || 0, e = parseFloat(i) || 0), eb.isFunction(b) && (b = b.call(a, c, h)), null != b.top && (m.top = b.top - h.top + g), null != b.left && (m.left = b.left - h.left + e), "using" in b ? b.using.call(a, m) : l.css(m)
        }
    }, eb.fn.extend({
        offset: function(a) {
            if (arguments.length) return void 0 === a ? this : this.each(function(b) {
                eb.offset.setOffset(this, a, b)
            });
            var b, c, d = {
                    top: 0,
                    left: 0
                },
                e = this[0],
                f = e && e.ownerDocument;
            if (f) return b = f.documentElement, eb.contains(b, e) ? (typeof e.getBoundingClientRect !== xb && (d = e.getBoundingClientRect()), c = V(f), {
                top: d.top + (c.pageYOffset || b.scrollTop) - (b.clientTop || 0),
                left: d.left + (c.pageXOffset || b.scrollLeft) - (b.clientLeft || 0)
            }) : d
        },
        position: function() {
            if (this[0]) {
                var a, b, c = {
                        top: 0,
                        left: 0
                    },
                    d = this[0];
                return "fixed" === eb.css(d, "position") ? b = d.getBoundingClientRect() : (a = this.offsetParent(), b = this.offset(), eb.nodeName(a[0], "html") || (c = a.offset()), c.top += eb.css(a[0], "borderTopWidth", !0), c.left += eb.css(a[0], "borderLeftWidth", !0)), {
                    top: b.top - c.top - eb.css(d, "marginTop", !0),
                    left: b.left - c.left - eb.css(d, "marginLeft", !0)
                }
            }
        },
        offsetParent: function() {
            return this.map(function() {
                for (var a = this.offsetParent || dd; a && !eb.nodeName(a, "html") && "static" === eb.css(a, "position");) a = a.offsetParent;
                return a || dd
            })
        }
    }), eb.each({
        scrollLeft: "pageXOffset",
        scrollTop: "pageYOffset"
    }, function(a, b) {
        var c = /Y/.test(b);
        eb.fn[a] = function(d) {
            return Db(this, function(a, d, e) {
                var f = V(a);
                return void 0 === e ? f ? b in f ? f[b] : f.document.documentElement[d] : a[d] : void(f ? f.scrollTo(c ? eb(f).scrollLeft() : e, c ? e : eb(f).scrollTop()) : a[d] = e)
            }, a, d, arguments.length, null)
        }
    }), eb.each(["top", "left"], function(a, b) {
        eb.cssHooks[b] = A(cb.pixelPosition, function(a, c) {
            return c ? (c = bc(a, b), dc.test(c) ? eb(a).position()[b] + "px" : c) : void 0
        })
    }), eb.each({
        Height: "height",
        Width: "width"
    }, function(a, b) {
        eb.each({
            padding: "inner" + a,
            content: b,
            "": "outer" + a
        }, function(c, d) {
            eb.fn[d] = function(d, e) {
                var f = arguments.length && (c || "boolean" != typeof d),
                    g = c || (d === !0 || e === !0 ? "margin" : "border");
                return Db(this, function(b, c, d) {
                    var e;
                    return eb.isWindow(b) ? b.document.documentElement["client" + a] : 9 === b.nodeType ? (e = b.documentElement, Math.max(b.body["scroll" + a], e["scroll" + a], b.body["offset" + a], e["offset" + a], e["client" + a])) : void 0 === d ? eb.css(b, c, g) : eb.style(b, c, d, g)
                }, b, f ? d : void 0, f, null)
            }
        })
    }), eb.fn.size = function() {
        return this.length
    }, eb.fn.andSelf = eb.fn.addBack, "function" == typeof define && define.amd && define("jquery", [], function() {
        return eb
    });
    var ed = a.jQuery,
        fd = a.$;
    return eb.noConflict = function(b) {
        return a.$ === eb && (a.$ = fd), b && a.jQuery === eb && (a.jQuery = ed), eb
    }, typeof b === xb && (a.jQuery = a.$ = eb), eb
}),
function(a) {
    "use strict";
    a.matchMedia = a.matchMedia || function(a) {
        var b, c = a.documentElement,
            d = c.firstElementChild || c.firstChild,
            e = a.createElement("body"),
            f = a.createElement("div");
        return f.id = "mq-test-1", f.style.cssText = "position:absolute;top:-100em", e.style.background = "none", e.appendChild(f),
            function(a) {
                return f.innerHTML = '&shy;<style media="' + a + '"> #mq-test-1 { width: 42px; }</style>', c.insertBefore(e, d), b = 42 === f.offsetWidth, c.removeChild(e), {
                    matches: b,
                    media: a
                }
            }
    }(a.document)
}(this),
function(a) {
    "use strict";
    if (a.matchMedia && a.matchMedia("all").addListener) return !1;
    var b = a.matchMedia,
        c = b("only all").matches,
        d = !1,
        e = 0,
        f = [],
        g = function() {
            a.clearTimeout(e), e = a.setTimeout(function() {
                for (var c = 0, d = f.length; d > c; c++) {
                    var e = f[c].mql,
                        g = f[c].listeners || [],
                        h = b(e.media).matches;
                    if (h !== e.matches) {
                        e.matches = h;
                        for (var i = 0, j = g.length; j > i; i++) g[i].call(a, e)
                    }
                }
            }, 30)
        };
    a.matchMedia = function(e) {
        var h = b(e),
            i = [],
            j = 0;
        return h.addListener = function(b) {
            c && (d || (d = !0, a.addEventListener("resize", g, !0)), 0 === j && (j = f.push({
                mql: h,
                listeners: i
            })), i.push(b))
        }, h.removeListener = function(a) {
            for (var b = 0, c = i.length; c > b; b++) i[b] === a && i.splice(b, 1)
        }, h
    }
}(this),
function(a, b, c) {
    var d = window.matchMedia;
    "undefined" != typeof module && module.exports ? module.exports = c(d) : "function" == typeof define && define.amd ? define(function() {
        return b[a] = c(d)
    }) : b[a] = c(d)
}("enquire", this, function(a) {
    "use strict";

    function b(a, b) {
        var c, d = 0,
            e = a.length;
        for (d; e > d && (c = b(a[d], d), c !== !1); d++);
    }

    function c(a) {
        return "[object Array]" === Object.prototype.toString.apply(a)
    }

    function d(a) {
        return "function" == typeof a
    }

    function e(a) {
        this.options = a, !a.deferSetup && this.setup()
    }

    function f(b, c) {
        this.query = b, this.isUnconditional = c, this.handlers = [], this.mql = a(b);
        var d = this;
        this.listener = function(a) {
            d.mql = a, d.assess()
        }, this.mql.addListener(this.listener)
    }

    function g() {
        if (!a) throw new Error("matchMedia not present, legacy browsers require a polyfill");
        this.queries = {}, this.browserIsIncapable = !a("only all").matches
    }
    return e.prototype = {
        setup: function() {
            this.options.setup && this.options.setup(), this.initialised = !0
        },
        on: function() {
            !this.initialised && this.setup(), this.options.match && this.options.match()
        },
        off: function() {
            this.options.unmatch && this.options.unmatch()
        },
        destroy: function() {
            this.options.destroy ? this.options.destroy() : this.off()
        },
        equals: function(a) {
            return this.options === a || this.options.match === a
        }
    }, f.prototype = {
        addHandler: function(a) {
            var b = new e(a);
            this.handlers.push(b), this.matches() && b.on()
        },
        removeHandler: function(a) {
            var c = this.handlers;
            b(c, function(b, d) {
                return b.equals(a) ? (b.destroy(), !c.splice(d, 1)) : void 0
            })
        },
        matches: function() {
            return this.mql.matches || this.isUnconditional
        },
        clear: function() {
            b(this.handlers, function(a) {
                a.destroy()
            }), this.mql.removeListener(this.listener), this.handlers.length = 0
        },
        assess: function() {
            var a = this.matches() ? "on" : "off";
            b(this.handlers, function(b) {
                b[a]()
            })
        }
    }, g.prototype = {
        register: function(a, e, g) {
            var h = this.queries,
                i = g && this.browserIsIncapable;
            return h[a] || (h[a] = new f(a, i)), d(e) && (e = {
                match: e
            }), c(e) || (e = [e]), b(e, function(b) {
                d(b) && (b = {
                    match: b
                }), h[a].addHandler(b)
            }), this
        },
        unregister: function(a, b) {
            var c = this.queries[a];
            return c && (b ? c.removeHandler(b) : (c.clear(), delete this.queries[a])), this
        }
    }, new g
}), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.affix"),
                f = "object" == typeof b && b;
            e || d.data("bs.affix", e = new c(this, f)), "string" == typeof b && e[b]()
        })
    }
    var c = function(b, d) {
        this.options = a.extend({}, c.DEFAULTS, d), this.$target = a(this.options.target).on("scroll.bs.affix.data-api", a.proxy(this.checkPosition, this)).on("click.bs.affix.data-api", a.proxy(this.checkPositionWithEventLoop, this)), this.$element = a(b), this.affixed = this.unpin = this.pinnedOffset = null, this.checkPosition()
    };
    c.VERSION = "3.3.1", c.RESET = "affix affix-top affix-bottom", c.DEFAULTS = {
        offset: 0,
        target: window
    }, c.prototype.getState = function(a, b, c, d) {
        var e = this.$target.scrollTop(),
            f = this.$element.offset(),
            g = this.$target.height();
        if (null != c && "top" == this.affixed) return c > e ? "top" : !1;
        if ("bottom" == this.affixed) return null != c ? e + this.unpin <= f.top ? !1 : "bottom" : a - d >= e + g ? !1 : "bottom";
        var h = null == this.affixed,
            i = h ? e : f.top,
            j = h ? g : b;
        return null != c && c >= i ? "top" : null != d && i + j >= a - d ? "bottom" : !1
    }, c.prototype.getPinnedOffset = function() {
        if (this.pinnedOffset) return this.pinnedOffset;
        this.$element.removeClass(c.RESET).addClass("affix");
        var a = this.$target.scrollTop(),
            b = this.$element.offset();
        return this.pinnedOffset = b.top - a
    }, c.prototype.checkPositionWithEventLoop = function() {
        setTimeout(a.proxy(this.checkPosition, this), 1)
    }, c.prototype.checkPosition = function() {
        if (this.$element.is(":visible")) {
            var b = this.$element.height(),
                d = this.options.offset,
                e = d.top,
                f = d.bottom,
                g = a("body").height();
            "object" != typeof d && (f = e = d), "function" == typeof e && (e = d.top(this.$element)), "function" == typeof f && (f = d.bottom(this.$element));
            var h = this.getState(g, b, e, f);
            if (this.affixed != h) {
                null != this.unpin && this.$element.css("top", "");
                var i = "affix" + (h ? "-" + h : ""),
                    j = a.Event(i + ".bs.affix");
                if (this.$element.trigger(j), j.isDefaultPrevented()) return;
                this.affixed = h, this.unpin = "bottom" == h ? this.getPinnedOffset() : null, this.$element.removeClass(c.RESET).addClass(i).trigger(i.replace("affix", "affixed") + ".bs.affix")
            }
            "bottom" == h && this.$element.offset({
                top: g - b - f
            })
        }
    };
    var d = a.fn.affix;
    a.fn.affix = b, a.fn.affix.Constructor = c, a.fn.affix.noConflict = function() {
        return a.fn.affix = d, this
    }, a(window).on("load", function() {
        a('[data-spy="affix"]').each(function() {
            var c = a(this),
                d = c.data();
            d.offset = d.offset || {}, null != d.offsetBottom && (d.offset.bottom = d.offsetBottom), null != d.offsetTop && (d.offset.top = d.offsetTop), b.call(c, d)
        })
    })
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var c = a(this),
                e = c.data("bs.alert");
            e || c.data("bs.alert", e = new d(this)), "string" == typeof b && e[b].call(c)
        })
    }
    var c = '[data-dismiss="alert"]',
        d = function(b) {
            a(b).on("click", c, this.close)
        };
    d.VERSION = "3.3.1", d.TRANSITION_DURATION = 150, d.prototype.close = function(b) {
        function c() {
            g.detach().trigger("closed.bs.alert").remove()
        }
        var e = a(this),
            f = e.attr("data-target");
        f || (f = e.attr("href"), f = f && f.replace(/.*(?=#[^\s]*$)/, ""));
        var g = a(f);
        b && b.preventDefault(), g.length || (g = e.closest(".alert")), g.trigger(b = a.Event("close.bs.alert")), b.isDefaultPrevented() || (g.removeClass("in"), a.support.transition && g.hasClass("fade") ? g.one("bsTransitionEnd", c).emulateTransitionEnd(d.TRANSITION_DURATION) : c())
    };
    var e = a.fn.alert;
    a.fn.alert = b, a.fn.alert.Constructor = d, a.fn.alert.noConflict = function() {
        return a.fn.alert = e, this
    }, a(document).on("click.bs.alert.data-api", c, d.prototype.close)
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.button"),
                f = "object" == typeof b && b;
            e || d.data("bs.button", e = new c(this, f)), "toggle" == b ? e.toggle() : b && e.setState(b)
        })
    }
    var c = function(b, d) {
        this.$element = a(b), this.options = a.extend({}, c.DEFAULTS, d), this.isLoading = !1
    };
    c.VERSION = "3.3.1", c.DEFAULTS = {
        loadingText: "loading..."
    }, c.prototype.setState = function(b) {
        var c = "disabled",
            d = this.$element,
            e = d.is("input") ? "val" : "html",
            f = d.data();
        b += "Text", null == f.resetText && d.data("resetText", d[e]()), setTimeout(a.proxy(function() {
            d[e](null == f[b] ? this.options[b] : f[b]), "loadingText" == b ? (this.isLoading = !0, d.addClass(c).attr(c, c)) : this.isLoading && (this.isLoading = !1, d.removeClass(c).removeAttr(c))
        }, this), 0)
    }, c.prototype.toggle = function() {
        var a = !0,
            b = this.$element.closest('[data-toggle="buttons"]');
        if (b.length) {
            var c = this.$element.find("input");
            "radio" == c.prop("type") && (c.prop("checked") && this.$element.hasClass("active") ? a = !1 : b.find(".active").removeClass("active")), a && c.prop("checked", !this.$element.hasClass("active")).trigger("change")
        } else this.$element.attr("aria-pressed", !this.$element.hasClass("active"));
        a && this.$element.toggleClass("active")
    };
    var d = a.fn.button;
    a.fn.button = b, a.fn.button.Constructor = c, a.fn.button.noConflict = function() {
        return a.fn.button = d, this
    }, a(document).on("click.bs.button.data-api", '[data-toggle^="button"]', function(c) {
        var d = a(c.target);
        d.hasClass("btn") || (d = d.closest(".btn")), b.call(d, "toggle"), c.preventDefault()
    }).on("focus.bs.button.data-api blur.bs.button.data-api", '[data-toggle^="button"]', function(b) {
        a(b.target).closest(".btn").toggleClass("focus", /^focus(in)?$/.test(b.type))
    })
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.carousel"),
                f = a.extend({}, c.DEFAULTS, d.data(), "object" == typeof b && b),
                g = "string" == typeof b ? b : f.slide;
            e || d.data("bs.carousel", e = new c(this, f)), "number" == typeof b ? e.to(b) : g ? e[g]() : f.interval && e.pause().cycle()
        })
    }
    var c = function(b, c) {
        this.$element = a(b), this.$indicators = this.$element.find(".carousel-indicators"), this.options = c, this.paused = this.sliding = this.interval = this.$active = this.$items = null, this.options.keyboard && this.$element.on("keydown.bs.carousel", a.proxy(this.keydown, this)), "hover" == this.options.pause && !("ontouchstart" in document.documentElement) && this.$element.on("mouseenter.bs.carousel", a.proxy(this.pause, this)).on("mouseleave.bs.carousel", a.proxy(this.cycle, this))
    };
    c.VERSION = "3.3.1", c.TRANSITION_DURATION = 600, c.DEFAULTS = {
        interval: 5e3,
        pause: "hover",
        wrap: !0,
        keyboard: !0
    }, c.prototype.keydown = function(a) {
        if (!/input|textarea/i.test(a.target.tagName)) {
            switch (a.which) {
                case 37:
                    this.prev();
                    break;
                case 39:
                    this.next();
                    break;
                default:
                    return
            }
            a.preventDefault()
        }
    }, c.prototype.cycle = function(b) {
        return b || (this.paused = !1), this.interval && clearInterval(this.interval), this.options.interval && !this.paused && (this.interval = setInterval(a.proxy(this.next, this), this.options.interval)), this
    }, c.prototype.getItemIndex = function(a) {
        return this.$items = a.parent().children(".item"), this.$items.index(a || this.$active)
    }, c.prototype.getItemForDirection = function(a, b) {
        var c = "prev" == a ? -1 : 1,
            d = this.getItemIndex(b),
            e = (d + c) % this.$items.length;
        return this.$items.eq(e)
    }, c.prototype.to = function(a) {
        var b = this,
            c = this.getItemIndex(this.$active = this.$element.find(".item.active"));
        return a > this.$items.length - 1 || 0 > a ? void 0 : this.sliding ? this.$element.one("slid.bs.carousel", function() {
            b.to(a)
        }) : c == a ? this.pause().cycle() : this.slide(a > c ? "next" : "prev", this.$items.eq(a))
    }, c.prototype.pause = function(b) {
        return b || (this.paused = !0), this.$element.find(".next, .prev").length && a.support.transition && (this.$element.trigger(a.support.transition.end), this.cycle(!0)), this.interval = clearInterval(this.interval), this
    }, c.prototype.next = function() {
        return this.sliding ? void 0 : this.slide("next")
    }, c.prototype.prev = function() {
        return this.sliding ? void 0 : this.slide("prev")
    }, c.prototype.slide = function(b, d) {
        var e = this.$element.find(".item.active"),
            f = d || this.getItemForDirection(b, e),
            g = this.interval,
            h = "next" == b ? "left" : "right",
            i = "next" == b ? "first" : "last",
            j = this;
        if (!f.length) {
            if (!this.options.wrap) return;
            f = this.$element.find(".item")[i]()
        }
        if (f.hasClass("active")) return this.sliding = !1;
        var k = f[0],
            l = a.Event("slide.bs.carousel", {
                relatedTarget: k,
                direction: h
            });
        if (this.$element.trigger(l), !l.isDefaultPrevented()) {
            if (this.sliding = !0, g && this.pause(), this.$indicators.length) {
                this.$indicators.find(".active").removeClass("active");
                var m = a(this.$indicators.children()[this.getItemIndex(f)]);
                m && m.addClass("active")
            }
            var n = a.Event("slid.bs.carousel", {
                relatedTarget: k,
                direction: h
            });
            return a.support.transition && this.$element.hasClass("slide") ? (f.addClass(b), f[0].offsetWidth, e.addClass(h), f.addClass(h), e.one("bsTransitionEnd", function() {
                f.removeClass([b, h].join(" ")).addClass("active"), e.removeClass(["active", h].join(" ")), j.sliding = !1, setTimeout(function() {
                    j.$element.trigger(n)
                }, 0)
            }).emulateTransitionEnd(c.TRANSITION_DURATION)) : (e.removeClass("active"), f.addClass("active"), this.sliding = !1, this.$element.trigger(n)), g && this.cycle(), this
        }
    };
    var d = a.fn.carousel;
    a.fn.carousel = b, a.fn.carousel.Constructor = c, a.fn.carousel.noConflict = function() {
        return a.fn.carousel = d, this
    };
    var e = function(c) {
        var d, e = a(this),
            f = a(e.attr("data-target") || (d = e.attr("href")) && d.replace(/.*(?=#[^\s]+$)/, ""));
        if (f.hasClass("carousel")) {
            var g = a.extend({}, f.data(), e.data()),
                h = e.attr("data-slide-to");
            h && (g.interval = !1), b.call(f, g), h && f.data("bs.carousel").to(h), c.preventDefault()
        }
    };
    a(document).on("click.bs.carousel.data-api", "[data-slide]", e).on("click.bs.carousel.data-api", "[data-slide-to]", e), a(window).on("load", function() {
        a('[data-ride="carousel"]').each(function() {
            var c = a(this);
            b.call(c, c.data())
        })
    })
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        var c, d = b.attr("data-target") || (c = b.attr("href")) && c.replace(/.*(?=#[^\s]+$)/, "");
        return a(d)
    }

    function c(b) {
        return this.each(function() {
            var c = a(this),
                e = c.data("bs.collapse"),
                f = a.extend({}, d.DEFAULTS, c.data(), "object" == typeof b && b);
            !e && f.toggle && "show" == b && (f.toggle = !1), e || c.data("bs.collapse", e = new d(this, f)), "string" == typeof b && e[b]()
        })
    }
    var d = function(b, c) {
        this.$element = a(b), this.options = a.extend({}, d.DEFAULTS, c), this.$trigger = a(this.options.trigger).filter('[href="#' + b.id + '"], [data-target="#' + b.id + '"]'), this.transitioning = null, this.options.parent ? this.$parent = this.getParent() : this.addAriaAndCollapsedClass(this.$element, this.$trigger), this.options.toggle && this.toggle()
    };
    d.VERSION = "3.3.1", d.TRANSITION_DURATION = 350, d.DEFAULTS = {
        toggle: !0,
        trigger: '[data-toggle="collapse"]'
    }, d.prototype.dimension = function() {
        var a = this.$element.hasClass("width");
        return a ? "width" : "height"
    }, d.prototype.show = function() {
        if (!this.transitioning && !this.$element.hasClass("in")) {
            var b, e = this.$parent && this.$parent.find("> .panel").children(".in, .collapsing");
            if (!(e && e.length && (b = e.data("bs.collapse"), b && b.transitioning))) {
                var f = a.Event("show.bs.collapse");
                if (this.$element.trigger(f), !f.isDefaultPrevented()) {
                    e && e.length && (c.call(e, "hide"), b || e.data("bs.collapse", null));
                    var g = this.dimension();
                    this.$element.removeClass("collapse").addClass("collapsing")[g](0).attr("aria-expanded", !0), this.$trigger.removeClass("collapsed").attr("aria-expanded", !0), this.transitioning = 1;
                    var h = function() {
                        this.$element.removeClass("collapsing").addClass("collapse in")[g](""), this.transitioning = 0, this.$element.trigger("shown.bs.collapse")
                    };
                    if (!a.support.transition) return h.call(this);
                    var i = a.camelCase(["scroll", g].join("-"));
                    this.$element.one("bsTransitionEnd", a.proxy(h, this)).emulateTransitionEnd(d.TRANSITION_DURATION)[g](this.$element[0][i])
                }
            }
        }
    }, d.prototype.hide = function() {
        if (!this.transitioning && this.$element.hasClass("in")) {
            var b = a.Event("hide.bs.collapse");
            if (this.$element.trigger(b), !b.isDefaultPrevented()) {
                var c = this.dimension();
                this.$element[c](this.$element[c]())[0].offsetHeight, this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded", !1), this.$trigger.addClass("collapsed").attr("aria-expanded", !1), this.transitioning = 1;
                var e = function() {
                    this.transitioning = 0, this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse")
                };
                return a.support.transition ? void this.$element[c](0).one("bsTransitionEnd", a.proxy(e, this)).emulateTransitionEnd(d.TRANSITION_DURATION) : e.call(this)
            }
        }
    }, d.prototype.toggle = function() {
        this[this.$element.hasClass("in") ? "hide" : "show"]()
    }, d.prototype.getParent = function() {
        return a(this.options.parent).find('[data-toggle="collapse"][data-parent="' + this.options.parent + '"]').each(a.proxy(function(c, d) {
            var e = a(d);
            this.addAriaAndCollapsedClass(b(e), e)
        }, this)).end()
    }, d.prototype.addAriaAndCollapsedClass = function(a, b) {
        var c = a.hasClass("in");
        a.attr("aria-expanded", c), b.toggleClass("collapsed", !c).attr("aria-expanded", c)
    };
    var e = a.fn.collapse;
    a.fn.collapse = c, a.fn.collapse.Constructor = d, a.fn.collapse.noConflict = function() {
        return a.fn.collapse = e, this
    }, a(document).on("click.bs.collapse.data-api", '[data-toggle="collapse"]', function(d) {
        var e = a(this);
        e.attr("data-target") || d.preventDefault();
        var f = b(e),
            g = f.data("bs.collapse"),
            h = g ? "toggle" : a.extend({}, e.data(), {
                trigger: this
            });
        c.call(f, h)
    })
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        b && 3 === b.which || (a(e).remove(), a(f).each(function() {
            var d = a(this),
                e = c(d),
                f = {
                    relatedTarget: this
                };
            e.hasClass("open") && (e.trigger(b = a.Event("hide.bs.dropdown", f)), b.isDefaultPrevented() || (d.attr("aria-expanded", "false"), e.removeClass("open").trigger("hidden.bs.dropdown", f)))
        }))
    }

    function c(b) {
        var c = b.attr("data-target");
        c || (c = b.attr("href"), c = c && /#[A-Za-z]/.test(c) && c.replace(/.*(?=#[^\s]*$)/, ""));
        var d = c && a(c);
        return d && d.length ? d : b.parent()
    }

    function d(b) {
        return this.each(function() {
            var c = a(this),
                d = c.data("bs.dropdown");
            d || c.data("bs.dropdown", d = new g(this)), "string" == typeof b && d[b].call(c)
        })
    }
    var e = ".dropdown-backdrop",
        f = '[data-toggle="dropdown"]',
        g = function(b) {
            a(b).on("click.bs.dropdown", this.toggle)
        };
    g.VERSION = "3.3.1", g.prototype.toggle = function(d) {
        var e = a(this);
        if (!e.is(".disabled, :disabled")) {
            var f = c(e),
                g = f.hasClass("open");
            if (b(), !g) {
                "ontouchstart" in document.documentElement && !f.closest(".navbar-nav").length && a('<div class="dropdown-backdrop"/>').insertAfter(a(this)).on("click", b);
                var h = {
                    relatedTarget: this
                };
                if (f.trigger(d = a.Event("show.bs.dropdown", h)), d.isDefaultPrevented()) return;
                e.trigger("focus").attr("aria-expanded", "true"), f.toggleClass("open").trigger("shown.bs.dropdown", h)
            }
            return !1
        }
    }, g.prototype.keydown = function(b) {
        if (/(38|40|27|32)/.test(b.which) && !/input|textarea/i.test(b.target.tagName)) {
            var d = a(this);
            if (b.preventDefault(), b.stopPropagation(), !d.is(".disabled, :disabled")) {
                var e = c(d),
                    g = e.hasClass("open");
                if (!g && 27 != b.which || g && 27 == b.which) return 27 == b.which && e.find(f).trigger("focus"), d.trigger("click");
                var h = " li:not(.divider):visible a",
                    i = e.find('[role="menu"]' + h + ', [role="listbox"]' + h);
                if (i.length) {
                    var j = i.index(b.target);
                    38 == b.which && j > 0 && j--, 40 == b.which && j < i.length - 1 && j++, ~j || (j = 0), i.eq(j).trigger("focus")
                }
            }
        }
    };
    var h = a.fn.dropdown;
    a.fn.dropdown = d, a.fn.dropdown.Constructor = g, a.fn.dropdown.noConflict = function() {
        return a.fn.dropdown = h, this
    }, a(document).on("click.bs.dropdown.data-api", b).on("click.bs.dropdown.data-api", ".dropdown form", function(a) {
        a.stopPropagation()
    }).on("click.bs.dropdown.data-api", f, g.prototype.toggle).on("keydown.bs.dropdown.data-api", f, g.prototype.keydown).on("keydown.bs.dropdown.data-api", '[role="menu"]', g.prototype.keydown).on("keydown.bs.dropdown.data-api", '[role="listbox"]', g.prototype.keydown)
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.tab");
            e || d.data("bs.tab", e = new c(this)), "string" == typeof b && e[b]()
        })
    }
    var c = function(b) {
        this.element = a(b)
    };
    c.VERSION = "3.3.1", c.TRANSITION_DURATION = 150, c.prototype.show = function() {
        var b = this.element,
            c = b.closest("ul:not(.dropdown-menu)"),
            d = b.data("target");
        if (d || (d = b.attr("href"), d = d && d.replace(/.*(?=#[^\s]*$)/, "")), !b.parent("li").hasClass("active")) {
            var e = c.find(".active:last a"),
                f = a.Event("hide.bs.tab", {
                    relatedTarget: b[0]
                }),
                g = a.Event("show.bs.tab", {
                    relatedTarget: e[0]
                });
            if (e.trigger(f), b.trigger(g), !g.isDefaultPrevented() && !f.isDefaultPrevented()) {
                var h = a(d);
                this.activate(b.closest("li"), c), this.activate(h, h.parent(), function() {
                    e.trigger({
                        type: "hidden.bs.tab",
                        relatedTarget: b[0]
                    }), b.trigger({
                        type: "shown.bs.tab",
                        relatedTarget: e[0]
                    })
                })
            }
        }
    }, c.prototype.activate = function(b, d, e) {
        function f() {
            g.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded", !1), b.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded", !0), h ? (b[0].offsetWidth, b.addClass("in")) : b.removeClass("fade"), b.parent(".dropdown-menu") && b.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded", !0), e && e()
        }
        var g = d.find("> .active"),
            h = e && a.support.transition && (g.length && g.hasClass("fade") || !!d.find("> .fade").length);
        g.length && h ? g.one("bsTransitionEnd", f).emulateTransitionEnd(c.TRANSITION_DURATION) : f(), g.removeClass("in")
    };
    var d = a.fn.tab;
    a.fn.tab = b, a.fn.tab.Constructor = c, a.fn.tab.noConflict = function() {
        return a.fn.tab = d, this
    };
    var e = function(c) {
        c.preventDefault(), b.call(a(this), "show")
    };
    a(document).on("click.bs.tab.data-api", '[data-toggle="tab"]', e).on("click.bs.tab.data-api", '[data-toggle="pill"]', e)
}(jQuery), + function(a) {
    "use strict";

    function b() {
        var a = document.createElement("bootstrap"),
            b = {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd otransitionend",
                transition: "transitionend"
            };
        for (var c in b)
            if (void 0 !== a.style[c]) return {
                end: b[c]
            };
        return !1
    }
    a.fn.emulateTransitionEnd = function(b) {
        var c = !1,
            d = this;
        a(this).one("bsTransitionEnd", function() {
            c = !0
        });
        var e = function() {
            c || a(d).trigger(a.support.transition.end)
        };
        return setTimeout(e, b), this
    }, a(function() {
        a.support.transition = b(), a.support.transition && (a.event.special.bsTransitionEnd = {
            bindType: a.support.transition.end,
            delegateType: a.support.transition.end,
            handle: function(b) {
                return a(b.target).is(this) ? b.handleObj.handler.apply(this, arguments) : void 0
            }
        })
    })
}(jQuery), + function(a) {
    "use strict";

    function b(c, d) {
        var e = a.proxy(this.process, this);
        this.$body = a("body"), this.$scrollElement = a(a(c).is("body") ? window : c), this.options = a.extend({}, b.DEFAULTS, d), this.selector = (this.options.target || "") + " .nav li > a", this.offsets = [], this.targets = [], this.activeTarget = null, this.scrollHeight = 0, this.$scrollElement.on("scroll.bs.scrollspy", e), this.refresh(), this.process()
    }

    function c(c) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.scrollspy"),
                f = "object" == typeof c && c;
            e || d.data("bs.scrollspy", e = new b(this, f)), "string" == typeof c && e[c]()
        })
    }
    b.VERSION = "3.3.1", b.DEFAULTS = {
        offset: 10
    }, b.prototype.getScrollHeight = function() {
        return this.$scrollElement[0].scrollHeight || Math.max(this.$body[0].scrollHeight, document.documentElement.scrollHeight)
    }, b.prototype.refresh = function() {
        var b = "offset",
            c = 0;
        a.isWindow(this.$scrollElement[0]) || (b = "position", c = this.$scrollElement.scrollTop()), this.offsets = [], this.targets = [], this.scrollHeight = this.getScrollHeight();
        var d = this;
        this.$body.find(this.selector).map(function() {
            var d = a(this),
                e = d.data("target") || d.attr("href"),
                f = /^#./.test(e) && a(e);
            return f && f.length && f.is(":visible") && [
                [f[b]().top + c, e]
            ] || null
        }).sort(function(a, b) {
            return a[0] - b[0]
        }).each(function() {
            d.offsets.push(this[0]), d.targets.push(this[1])
        })
    }, b.prototype.process = function() {
        var a, b = this.$scrollElement.scrollTop() + this.options.offset,
            c = this.getScrollHeight(),
            d = this.options.offset + c - this.$scrollElement.height(),
            e = this.offsets,
            f = this.targets,
            g = this.activeTarget;
        if (this.scrollHeight != c && this.refresh(), b >= d) return g != (a = f[f.length - 1]) && this.activate(a);
        if (g && b < e[0]) return this.activeTarget = null, this.clear();
        for (a = e.length; a--;) g != f[a] && b >= e[a] && (!e[a + 1] || b <= e[a + 1]) && this.activate(f[a])
    }, b.prototype.activate = function(b) {
        this.activeTarget = b, this.clear();
        var c = this.selector + '[data-target="' + b + '"],' + this.selector + '[href="' + b + '"]',
            d = a(c).parents("li").addClass("active");
        d.parent(".dropdown-menu").length && (d = d.closest("li.dropdown").addClass("active")), d.trigger("activate.bs.scrollspy")
    }, b.prototype.clear = function() {
        a(this.selector).parentsUntil(this.options.target, ".active").removeClass("active")
    };
    var d = a.fn.scrollspy;
    a.fn.scrollspy = c, a.fn.scrollspy.Constructor = b, a.fn.scrollspy.noConflict = function() {
        return a.fn.scrollspy = d, this
    }, a(window).on("load.bs.scrollspy.data-api", function() {
        a('[data-spy="scroll"]').each(function() {
            var b = a(this);
            c.call(b, b.data())
        })
    })
}(jQuery), + function(a) {
    "use strict";

    function b(b, d) {
        return this.each(function() {
            var e = a(this),
                f = e.data("bs.modal"),
                g = a.extend({}, c.DEFAULTS, e.data(), "object" == typeof b && b);
            f || e.data("bs.modal", f = new c(this, g)), "string" == typeof b ? f[b](d) : g.show && f.show(d)
        })
    }
    var c = function(b, c) {
        this.options = c, this.$body = a(document.body), this.$element = a(b), this.$backdrop = this.isShown = null, this.scrollbarWidth = 0, this.options.remote && this.$element.find(".modal-content").load(this.options.remote, a.proxy(function() {
            this.$element.trigger("loaded.bs.modal")
        }, this))
    };
    c.VERSION = "3.3.1", c.TRANSITION_DURATION = 300, c.BACKDROP_TRANSITION_DURATION = 150, c.DEFAULTS = {
        backdrop: !0,
        keyboard: !0,
        show: !0
    }, c.prototype.toggle = function(a) {
        return this.isShown ? this.hide() : this.show(a)
    }, c.prototype.show = function(b) {
        var d = this,
            e = a.Event("show.bs.modal", {
                relatedTarget: b
            });
        this.$element.trigger(e), this.isShown || e.isDefaultPrevented() || (this.isShown = !0, this.checkScrollbar(), this.setScrollbar(), this.$body.addClass("modal-open"), this.escape(), this.resize(), this.$element.on("click.dismiss.bs.modal", '[data-dismiss="modal"]', a.proxy(this.hide, this)), this.backdrop(function() {
            var e = a.support.transition && d.$element.hasClass("fade");
            d.$element.parent().length || d.$element.appendTo(d.$body), d.$element.show().scrollTop(0), d.options.backdrop && d.adjustBackdrop(), d.adjustDialog(), e && d.$element[0].offsetWidth, d.$element.addClass("in").attr("aria-hidden", !1), d.enforceFocus();
            var f = a.Event("shown.bs.modal", {
                relatedTarget: b
            });
            e ? d.$element.find(".modal-dialog").one("bsTransitionEnd", function() {
                d.$element.trigger("focus").trigger(f)
            }).emulateTransitionEnd(c.TRANSITION_DURATION) : d.$element.trigger("focus").trigger(f)
        }))
    }, c.prototype.hide = function(b) {
        b && b.preventDefault(), b = a.Event("hide.bs.modal"), this.$element.trigger(b), this.isShown && !b.isDefaultPrevented() && (this.isShown = !1, this.escape(), this.resize(), a(document).off("focusin.bs.modal"), this.$element.removeClass("in").attr("aria-hidden", !0).off("click.dismiss.bs.modal"), a.support.transition && this.$element.hasClass("fade") ? this.$element.one("bsTransitionEnd", a.proxy(this.hideModal, this)).emulateTransitionEnd(c.TRANSITION_DURATION) : this.hideModal())
    }, c.prototype.enforceFocus = function() {
        a(document).off("focusin.bs.modal").on("focusin.bs.modal", a.proxy(function(a) {
            this.$element[0] === a.target || this.$element.has(a.target).length || this.$element.trigger("focus")
        }, this))
    }, c.prototype.escape = function() {
        this.isShown && this.options.keyboard ? this.$element.on("keydown.dismiss.bs.modal", a.proxy(function(a) {
            27 == a.which && this.hide()
        }, this)) : this.isShown || this.$element.off("keydown.dismiss.bs.modal")
    }, c.prototype.resize = function() {
        this.isShown ? a(window).on("resize.bs.modal", a.proxy(this.handleUpdate, this)) : a(window).off("resize.bs.modal")
    }, c.prototype.hideModal = function() {
        var a = this;
        this.$element.hide(), this.backdrop(function() {
            a.$body.removeClass("modal-open"), a.resetAdjustments(), a.resetScrollbar(), a.$element.trigger("hidden.bs.modal")
        })
    }, c.prototype.removeBackdrop = function() {
        this.$backdrop && this.$backdrop.remove(), this.$backdrop = null
    }, c.prototype.backdrop = function(b) {
        var d = this,
            e = this.$element.hasClass("fade") ? "fade" : "";
        if (this.isShown && this.options.backdrop) {
            var f = a.support.transition && e;
            if (this.$backdrop = a('<div class="modal-backdrop ' + e + '" />').prependTo(this.$element).on("click.dismiss.bs.modal", a.proxy(function(a) {
                    a.target === a.currentTarget && ("static" == this.options.backdrop ? this.$element[0].focus.call(this.$element[0]) : this.hide.call(this))
                }, this)), f && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !b) return;
            f ? this.$backdrop.one("bsTransitionEnd", b).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION) : b()
        } else if (!this.isShown && this.$backdrop) {
            this.$backdrop.removeClass("in");
            var g = function() {
                d.removeBackdrop(), b && b()
            };
            a.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one("bsTransitionEnd", g).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION) : g()
        } else b && b()
    }, c.prototype.handleUpdate = function() {
        this.options.backdrop && this.adjustBackdrop(), this.adjustDialog()
    }, c.prototype.adjustBackdrop = function() {
        this.$backdrop.css("height", 0).css("height", this.$element[0].scrollHeight)
    }, c.prototype.adjustDialog = function() {
        var a = this.$element[0].scrollHeight > document.documentElement.clientHeight;
        this.$element.css({
            paddingLeft: !this.bodyIsOverflowing && a ? this.scrollbarWidth : "",
            paddingRight: this.bodyIsOverflowing && !a ? this.scrollbarWidth : ""
        })
    }, c.prototype.resetAdjustments = function() {
        this.$element.css({
            paddingLeft: "",
            paddingRight: ""
        })
    }, c.prototype.checkScrollbar = function() {
        this.bodyIsOverflowing = document.body.scrollHeight > document.documentElement.clientHeight, this.scrollbarWidth = this.measureScrollbar()
    }, c.prototype.setScrollbar = function() {
        var a = parseInt(this.$body.css("padding-right") || 0, 10);
        this.bodyIsOverflowing && this.$body.css("padding-right", a + this.scrollbarWidth)
    }, c.prototype.resetScrollbar = function() {
        this.$body.css("padding-right", "")
    }, c.prototype.measureScrollbar = function() {
        var a = document.createElement("div");
        a.className = "modal-scrollbar-measure", this.$body.append(a);
        var b = a.offsetWidth - a.clientWidth;
        return this.$body[0].removeChild(a), b
    };
    var d = a.fn.modal;
    a.fn.modal = b, a.fn.modal.Constructor = c, a.fn.modal.noConflict = function() {
        return a.fn.modal = d, this
    }, a(document).on("click.bs.modal.data-api", '[data-toggle="modal"]', function(c) {
        var d = a(this),
            e = d.attr("href"),
            f = a(d.attr("data-target") || e && e.replace(/.*(?=#[^\s]+$)/, "")),
            g = f.data("bs.modal") ? "toggle" : a.extend({
                remote: !/#/.test(e) && e
            }, f.data(), d.data());
        d.is("a") && c.preventDefault(), f.one("show.bs.modal", function(a) {
            a.isDefaultPrevented() || f.one("hidden.bs.modal", function() {
                d.is(":visible") && d.trigger("focus")
            })
        }), b.call(f, g, this)
    })
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.tooltip"),
                f = "object" == typeof b && b,
                g = f && f.selector;
            (e || "destroy" != b) && (g ? (e || d.data("bs.tooltip", e = {}), e[g] || (e[g] = new c(this, f))) : e || d.data("bs.tooltip", e = new c(this, f)), "string" == typeof b && e[b]())
        })
    }
    var c = function(a, b) {
        this.type = this.options = this.enabled = this.timeout = this.hoverState = this.$element = null, this.init("tooltip", a, b)
    };
    c.VERSION = "3.3.1", c.TRANSITION_DURATION = 150, c.DEFAULTS = {
        animation: !0,
        placement: "top",
        selector: !1,
        template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
        trigger: "hover focus",
        title: "",
        delay: 0,
        html: !1,
        container: !1,
        viewport: {
            selector: "body",
            padding: 0
        }
    }, c.prototype.init = function(b, c, d) {
        this.enabled = !0, this.type = b, this.$element = a(c), this.options = this.getOptions(d), this.$viewport = this.options.viewport && a(this.options.viewport.selector || this.options.viewport);
        for (var e = this.options.trigger.split(" "), f = e.length; f--;) {
            var g = e[f];
            if ("click" == g) this.$element.on("click." + this.type, this.options.selector, a.proxy(this.toggle, this));
            else if ("manual" != g) {
                var h = "hover" == g ? "mouseenter" : "focusin",
                    i = "hover" == g ? "mouseleave" : "focusout";
                this.$element.on(h + "." + this.type, this.options.selector, a.proxy(this.enter, this)), this.$element.on(i + "." + this.type, this.options.selector, a.proxy(this.leave, this))
            }
        }
        this.options.selector ? this._options = a.extend({}, this.options, {
            trigger: "manual",
            selector: ""
        }) : this.fixTitle()
    }, c.prototype.getDefaults = function() {
        return c.DEFAULTS
    }, c.prototype.getOptions = function(b) {
        return b = a.extend({}, this.getDefaults(), this.$element.data(), b), b.delay && "number" == typeof b.delay && (b.delay = {
            show: b.delay,
            hide: b.delay
        }), b
    }, c.prototype.getDelegateOptions = function() {
        var b = {},
            c = this.getDefaults();
        return this._options && a.each(this._options, function(a, d) {
            c[a] != d && (b[a] = d)
        }), b
    }, c.prototype.enter = function(b) {
        var c = b instanceof this.constructor ? b : a(b.currentTarget).data("bs." + this.type);
        return c && c.$tip && c.$tip.is(":visible") ? void(c.hoverState = "in") : (c || (c = new this.constructor(b.currentTarget, this.getDelegateOptions()), a(b.currentTarget).data("bs." + this.type, c)), clearTimeout(c.timeout), c.hoverState = "in", c.options.delay && c.options.delay.show ? void(c.timeout = setTimeout(function() {
            "in" == c.hoverState && c.show()
        }, c.options.delay.show)) : c.show())
    }, c.prototype.leave = function(b) {
        var c = b instanceof this.constructor ? b : a(b.currentTarget).data("bs." + this.type);
        return c || (c = new this.constructor(b.currentTarget, this.getDelegateOptions()), a(b.currentTarget).data("bs." + this.type, c)), clearTimeout(c.timeout), c.hoverState = "out", c.options.delay && c.options.delay.hide ? void(c.timeout = setTimeout(function() {
            "out" == c.hoverState && c.hide()
        }, c.options.delay.hide)) : c.hide()
    }, c.prototype.show = function() {
        var b = a.Event("show.bs." + this.type);
        if (this.hasContent() && this.enabled) {
            this.$element.trigger(b);
            var d = a.contains(this.$element[0].ownerDocument.documentElement, this.$element[0]);
            if (b.isDefaultPrevented() || !d) return;
            var e = this,
                f = this.tip(),
                g = this.getUID(this.type);
            this.setContent(), f.attr("id", g), this.$element.attr("aria-describedby", g), this.options.animation && f.addClass("fade");
            var h = "function" == typeof this.options.placement ? this.options.placement.call(this, f[0], this.$element[0]) : this.options.placement,
                i = /\s?auto?\s?/i,
                j = i.test(h);
            j && (h = h.replace(i, "") || "top"), f.detach().css({
                top: 0,
                left: 0,
                display: "block"
            }).addClass(h).data("bs." + this.type, this), this.options.container ? f.appendTo(this.options.container) : f.insertAfter(this.$element);
            var k = this.getPosition(),
                l = f[0].offsetWidth,
                m = f[0].offsetHeight;
            if (j) {
                var n = h,
                    o = this.options.container ? a(this.options.container) : this.$element.parent(),
                    p = this.getPosition(o);
                h = "bottom" == h && k.bottom + m > p.bottom ? "top" : "top" == h && k.top - m < p.top ? "bottom" : "right" == h && k.right + l > p.width ? "left" : "left" == h && k.left - l < p.left ? "right" : h, f.removeClass(n).addClass(h)
            }
            var q = this.getCalculatedOffset(h, k, l, m);
            this.applyPlacement(q, h);
            var r = function() {
                var a = e.hoverState;
                e.$element.trigger("shown.bs." + e.type), e.hoverState = null, "out" == a && e.leave(e)
            };
            a.support.transition && this.$tip.hasClass("fade") ? f.one("bsTransitionEnd", r).emulateTransitionEnd(c.TRANSITION_DURATION) : r()
        }
    }, c.prototype.applyPlacement = function(b, c) {
        var d = this.tip(),
            e = d[0].offsetWidth,
            f = d[0].offsetHeight,
            g = parseInt(d.css("margin-top"), 10),
            h = parseInt(d.css("margin-left"), 10);
        isNaN(g) && (g = 0), isNaN(h) && (h = 0), b.top = b.top + g, b.left = b.left + h, a.offset.setOffset(d[0], a.extend({
            using: function(a) {
                d.css({
                    top: Math.round(a.top),
                    left: Math.round(a.left)
                })
            }
        }, b), 0), d.addClass("in");
        var i = d[0].offsetWidth,
            j = d[0].offsetHeight;
        "top" == c && j != f && (b.top = b.top + f - j);
        var k = this.getViewportAdjustedDelta(c, b, i, j);
        k.left ? b.left += k.left : b.top += k.top;
        var l = /top|bottom/.test(c),
            m = l ? 2 * k.left - e + i : 2 * k.top - f + j,
            n = l ? "offsetWidth" : "offsetHeight";
        d.offset(b), this.replaceArrow(m, d[0][n], l)
    }, c.prototype.replaceArrow = function(a, b, c) {
        this.arrow().css(c ? "left" : "top", 50 * (1 - a / b) + "%").css(c ? "top" : "left", "")
    }, c.prototype.setContent = function() {
        var a = this.tip(),
            b = this.getTitle();
        a.find(".tooltip-inner")[this.options.html ? "html" : "text"](b), a.removeClass("fade in top bottom left right")
    }, c.prototype.hide = function(b) {
        function d() {
            "in" != e.hoverState && f.detach(), e.$element.removeAttr("aria-describedby").trigger("hidden.bs." + e.type), b && b()
        }
        var e = this,
            f = this.tip(),
            g = a.Event("hide.bs." + this.type);
        return this.$element.trigger(g), g.isDefaultPrevented() ? void 0 : (f.removeClass("in"), a.support.transition && this.$tip.hasClass("fade") ? f.one("bsTransitionEnd", d).emulateTransitionEnd(c.TRANSITION_DURATION) : d(), this.hoverState = null, this)
    }, c.prototype.fixTitle = function() {
        var a = this.$element;
        (a.attr("title") || "string" != typeof a.attr("data-original-title")) && a.attr("data-original-title", a.attr("title") || "").attr("title", "")
    }, c.prototype.hasContent = function() {
        return this.getTitle()
    }, c.prototype.getPosition = function(b) {
        b = b || this.$element;
        var c = b[0],
            d = "BODY" == c.tagName,
            e = c.getBoundingClientRect();
        null == e.width && (e = a.extend({}, e, {
            width: e.right - e.left,
            height: e.bottom - e.top
        }));
        var f = d ? {
                top: 0,
                left: 0
            } : b.offset(),
            g = {
                scroll: d ? document.documentElement.scrollTop || document.body.scrollTop : b.scrollTop()
            },
            h = d ? {
                width: a(window).width(),
                height: a(window).height()
            } : null;
        return a.extend({}, e, g, h, f)
    }, c.prototype.getCalculatedOffset = function(a, b, c, d) {
        return "bottom" == a ? {
            top: b.top + b.height,
            left: b.left + b.width / 2 - c / 2
        } : "top" == a ? {
            top: b.top - d,
            left: b.left + b.width / 2 - c / 2
        } : "left" == a ? {
            top: b.top + b.height / 2 - d / 2,
            left: b.left - c
        } : {
            top: b.top + b.height / 2 - d / 2,
            left: b.left + b.width
        }
    }, c.prototype.getViewportAdjustedDelta = function(a, b, c, d) {
        var e = {
            top: 0,
            left: 0
        };
        if (!this.$viewport) return e;
        var f = this.options.viewport && this.options.viewport.padding || 0,
            g = this.getPosition(this.$viewport);
        if (/right|left/.test(a)) {
            var h = b.top - f - g.scroll,
                i = b.top + f - g.scroll + d;
            h < g.top ? e.top = g.top - h : i > g.top + g.height && (e.top = g.top + g.height - i)
        } else {
            var j = b.left - f,
                k = b.left + f + c;
            j < g.left ? e.left = g.left - j : k > g.width && (e.left = g.left + g.width - k)
        }
        return e
    }, c.prototype.getTitle = function() {
        var a, b = this.$element,
            c = this.options;
        return a = b.attr("data-original-title") || ("function" == typeof c.title ? c.title.call(b[0]) : c.title)
    }, c.prototype.getUID = function(a) {
        do a += ~~(1e6 * Math.random()); while (document.getElementById(a));
        return a
    }, c.prototype.tip = function() {
        return this.$tip = this.$tip || a(this.options.template)
    }, c.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    }, c.prototype.enable = function() {
        this.enabled = !0
    }, c.prototype.disable = function() {
        this.enabled = !1
    }, c.prototype.toggleEnabled = function() {
        this.enabled = !this.enabled
    }, c.prototype.toggle = function(b) {
        var c = this;
        b && (c = a(b.currentTarget).data("bs." + this.type), c || (c = new this.constructor(b.currentTarget, this.getDelegateOptions()), a(b.currentTarget).data("bs." + this.type, c))), c.tip().hasClass("in") ? c.leave(c) : c.enter(c)
    }, c.prototype.destroy = function() {
        var a = this;
        clearTimeout(this.timeout), this.hide(function() {
            a.$element.off("." + a.type).removeData("bs." + a.type)
        })
    };
    var d = a.fn.tooltip;
    a.fn.tooltip = b, a.fn.tooltip.Constructor = c, a.fn.tooltip.noConflict = function() {
        return a.fn.tooltip = d, this
    }
}(jQuery), + function(a) {
    "use strict";

    function b(b) {
        return this.each(function() {
            var d = a(this),
                e = d.data("bs.popover"),
                f = "object" == typeof b && b,
                g = f && f.selector;
            (e || "destroy" != b) && (g ? (e || d.data("bs.popover", e = {}), e[g] || (e[g] = new c(this, f))) : e || d.data("bs.popover", e = new c(this, f)), "string" == typeof b && e[b]())
        })
    }
    var c = function(a, b) {
        this.init("popover", a, b)
    };
    if (!a.fn.tooltip) throw new Error("Popover requires tooltip.js");
    c.VERSION = "3.3.1", c.DEFAULTS = a.extend({}, a.fn.tooltip.Constructor.DEFAULTS, {
        placement: "right",
        trigger: "click",
        content: "",
        template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
    }), c.prototype = a.extend({}, a.fn.tooltip.Constructor.prototype), c.prototype.constructor = c, c.prototype.getDefaults = function() {
        return c.DEFAULTS
    }, c.prototype.setContent = function() {
        var a = this.tip(),
            b = this.getTitle(),
            c = this.getContent();
        a.find(".popover-title")[this.options.html ? "html" : "text"](b), a.find(".popover-content").children().detach().end()[this.options.html ? "string" == typeof c ? "html" : "append" : "text"](c), a.removeClass("fade top bottom left right in"), a.find(".popover-title").html() || a.find(".popover-title").hide()
    }, c.prototype.hasContent = function() {
        return this.getTitle() || this.getContent()
    }, c.prototype.getContent = function() {
        var a = this.$element,
            b = this.options;
        return a.attr("data-content") || ("function" == typeof b.content ? b.content.call(a[0]) : b.content)
    }, c.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".arrow")
    }, c.prototype.tip = function() {
        return this.$tip || (this.$tip = a(this.options.template)), this.$tip
    };
    var d = a.fn.popover;
    a.fn.popover = b, a.fn.popover.Constructor = c, a.fn.popover.noConflict = function() {
        return a.fn.popover = d, this
    }
}(jQuery), ! function(a) {
    function b() {
        h = !0, i.$wndw = a(window), i.$html = a("html"), i.$body = a("body"), a.each([e, f, g], function(a, b) {
            b.add = function(a) {
                a = a.split(" ");
                for (var c in a) b[a[c]] = b.mm(a[c])
            }
        }), e.mm = function(a) {
            return "mm-" + a
        }, e.add("wrapper menu inline panel nopanel list nolist subtitle selected label spacer current highest hidden opened subopened subopen fullsubopen subclose"), e.umm = function(a) {
            return "mm-" == a.slice(0, 3) && (a = a.slice(3)), a
        }, f.mm = function(a) {
            return "mm-" + a
        }, f.add("parent"), g.mm = function(a) {
            return a + ".mm"
        }, g.add("toggle open close setSelected transitionend webkitTransitionEnd mousedown mouseup touchstart touchmove touchend scroll resize click keydown keyup"), a[c]._c = e, a[c]._d = f, a[c]._e = g, a[c].glbl = i
    }
    var c = "mmenu",
        d = "4.7.5";
    if (!a[c]) {
        var e = {},
            f = {},
            g = {},
            h = !1,
            i = {
                $wndw: null,
                $html: null,
                $body: null
            };
        a[c] = function(b, d, e) {
            this.$menu = b, this.opts = d, this.conf = e, this.vars = {}, "function" == typeof this.___deprecated && this.___deprecated(), this._initMenu(), this._initAnchors(), this._initEvents();
            var f = this.$menu.children(this.conf.panelNodetype);
            for (var g in a[c].addons) a[c].addons[g]._add.call(this), a[c].addons[g]._add = function() {}, a[c].addons[g]._setup.call(this);
            return this._init(f), "function" == typeof this.___debug && this.___debug(), this
        }, a[c].version = d, a[c].addons = {}, a[c].uniqueId = 0, a[c].defaults = {
            classes: "",
            slidingSubmenus: !0,
            onClick: {
                setSelected: !0
            }
        }, a[c].configuration = {
            panelNodetype: "ul, ol, div",
            transitionDuration: 400,
            openingInterval: 25,
            classNames: {
                panel: "Panel",
                selected: "Selected",
                label: "Label",
                spacer: "Spacer"
            }
        }, a[c].prototype = {
            _init: function(b) {
                b = b.not("." + e.nopanel), b = this._initPanels(b);
                for (var d in a[c].addons) a[c].addons[d]._init.call(this, b);
                this._update()
            },
            _initMenu: function() {
                this.opts.offCanvas && this.conf.clone && (this.$menu = this.$menu.clone(!0), this.$menu.add(this.$menu.find("*")).filter("[id]").each(function() {
                    a(this).attr("id", e.mm(a(this).attr("id")))
                })), this.$menu.contents().each(function() {
                    3 == a(this)[0].nodeType && a(this).remove()
                }), this.$menu.parent().addClass(e.wrapper);
                var b = [e.menu];
                b.push(e.mm(this.opts.slidingSubmenus ? "horizontal" : "vertical")), this.opts.classes && b.push(this.opts.classes), this.$menu.addClass(b.join(" "))
            },
            _initPanels: function(b) {
                var c = this;
                this.__findAddBack(b, "ul, ol").not("." + e.nolist).addClass(e.list);
                var d = this.__findAddBack(b, "." + e.list).find("> li");
                this.__refactorClass(d, this.conf.classNames.selected, "selected"), this.__refactorClass(d, this.conf.classNames.label, "label"), this.__refactorClass(d, this.conf.classNames.spacer, "spacer"), d.off(g.setSelected).on(g.setSelected, function(b, c) {
                    b.stopPropagation(), d.removeClass(e.selected), "boolean" != typeof c && (c = !0), c && a(this).addClass(e.selected)
                }), this.__refactorClass(this.__findAddBack(b, "." + this.conf.classNames.panel), this.conf.classNames.panel, "panel"), b.add(this.__findAddBack(b, "." + e.list).children().children().filter(this.conf.panelNodetype).not("." + e.nopanel)).addClass(e.panel);
                var h = this.__findAddBack(b, "." + e.panel),
                    i = a("." + e.panel, this.$menu);
                if (h.each(function() {
                        var b = a(this),
                            d = b.attr("id") || c.__getUniqueId();
                        b.attr("id", d)
                    }), h.each(function() {
                        var b = a(this),
                            d = b.is("ul, ol") ? b : b.find("ul ,ol").first(),
                            g = b.parent(),
                            h = g.children("a, span"),
                            i = g.closest("." + e.panel);
                        if (g.parent().is("." + e.list) && !b.data(f.parent)) {
                            b.data(f.parent, g);
                            var j = a('<a class="' + e.subopen + '" href="#' + b.attr("id") + '" />').insertBefore(h);
                            h.is("a") || j.addClass(e.fullsubopen), c.opts.slidingSubmenus && d.prepend('<li class="' + e.subtitle + '"><a class="' + e.subclose + '" href="#' + i.attr("id") + '">' + h.text() + "</a></li>")
                        }
                    }), this.opts.slidingSubmenus) {
                    var j = this.__findAddBack(b, "." + e.list).find("> li." + e.selected);
                    j.parents("li").removeClass(e.selected).end().add(j.parents("li")).each(function() {
                        var b = a(this),
                            c = b.find("> ." + e.panel);
                        c.length && (b.parents("." + e.panel).addClass(e.subopened), c.addClass(e.opened))
                    }).closest("." + e.panel).addClass(e.opened).parents("." + e.panel).addClass(e.subopened)
                } else {
                    var j = a("li." + e.selected, i);
                    j.parents("li").removeClass(e.selected).end().add(j.parents("li")).addClass(e.opened)
                }
                var k = i.filter("." + e.opened);
                return k.length || (k = h.first()), k.addClass(e.opened).last().addClass(e.current), this.opts.slidingSubmenus && h.not(k.last()).addClass(e.hidden).end().appendTo(this.$menu), h
            },
            _initAnchors: function() {
                var b = this;
                i.$body.on(g.click, "a", function(d) {
                    var f = a(this),
                        h = !1,
                        j = b.$menu.find(f).length;
                    for (var k in a[c].addons)
                        if (a[c].addons[k]._clickAnchor && (h = a[c].addons[k]._clickAnchor.call(b, f, j))) break;
                    if (!h && j) {
                        var l = f.attr("href") || "";
                        if ("#" == l.slice(0, 1)) try {
                            a(l, b.$menu).is("." + e.panel) && (h = !0, a(l).trigger(b.opts.slidingSubmenus ? g.open : g.toggle))
                        } catch (m) {}
                    }
                    if (h && d.preventDefault(), !h && j && f.is("." + e.list + " > li > a") && !f.is('[rel="external"]') && !f.is('[target="_blank"]')) {
                        b.__valueOrFn(b.opts.onClick.setSelected, f) && f.parent().trigger(g.setSelected);
                        var n = b.__valueOrFn(b.opts.onClick.preventDefault, f, "#" == l.slice(0, 1));
                        n && d.preventDefault(), b.__valueOrFn(b.opts.onClick.blockUI, f, !n) && i.$html.addClass(e.blocking), b.__valueOrFn(b.opts.onClick.close, f, n) && b.$menu.trigger(g.close)
                    }
                })
            },
            _initEvents: function() {
                var b = this;
                this.$menu.on(g.toggle + " " + g.open + " " + g.close, "." + e.panel, function(a) {
                    a.stopPropagation()
                }), this.opts.slidingSubmenus ? this.$menu.on(g.open, "." + e.panel, function() {
                    return b._openSubmenuHorizontal(a(this))
                }) : this.$menu.on(g.toggle, "." + e.panel, function() {
                    var b = a(this);
                    b.trigger(b.parent().hasClass(e.opened) ? g.close : g.open)
                }).on(g.open, "." + e.panel, function() {
                    a(this).parent().addClass(e.opened)
                }).on(g.close, "." + e.panel, function() {
                    a(this).parent().removeClass(e.opened)
                })
            },
            _openSubmenuHorizontal: function(b) {
                if (b.hasClass(e.current)) return !1;
                var c = a("." + e.panel, this.$menu),
                    d = c.filter("." + e.current);
                return c.removeClass(e.highest).removeClass(e.current).not(b).not(d).addClass(e.hidden), b.hasClass(e.opened) ? d.addClass(e.highest).removeClass(e.opened).removeClass(e.subopened) : (b.addClass(e.highest), d.addClass(e.subopened)), b.removeClass(e.hidden).addClass(e.current), setTimeout(function() {
                    b.removeClass(e.subopened).addClass(e.opened)
                }, this.conf.openingInterval), "open"
            },
            _update: function(a) {
                if (this.updates || (this.updates = []), "function" == typeof a) this.updates.push(a);
                else
                    for (var b = 0, c = this.updates.length; c > b; b++) this.updates[b].call(this, a)
            },
            __valueOrFn: function(a, b, c) {
                return "function" == typeof a ? a.call(b[0]) : "undefined" == typeof a && "undefined" != typeof c ? c : a
            },
            __refactorClass: function(a, b, c) {
                return a.filter("." + b).removeClass(b).addClass(e[c])
            },
            __findAddBack: function(a, b) {
                return a.find(b).add(a.filter(b))
            },
            __transitionend: function(a, b, c) {
                var d = !1,
                    e = function() {
                        d || b.call(a[0]), d = !0
                    };
                a.one(g.transitionend, e), a.one(g.webkitTransitionEnd, e), setTimeout(e, 1.1 * c)
            },
            __getUniqueId: function() {
                return e.mm(a[c].uniqueId++)
            }
        }, a.fn[c] = function(d, e) {
            return h || b(), d = a.extend(!0, {}, a[c].defaults, d), e = a.extend(!0, {}, a[c].configuration, e), this.each(function() {
                var b = a(this);
                b.data(c) || b.data(c, new a[c](b, d, e))
            })
        }, a[c].support = {
            touch: "ontouchstart" in window || navigator.msMaxTouchPoints
        }
    }
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "offCanvas";
    a[b].addons[c] = {
        _init: function() {},
        _setup: function() {
            if (this.opts[c]) {
                var b = this,
                    e = this.opts[c],
                    h = this.conf[c];
                "string" != typeof h.pageSelector && (h.pageSelector = "> " + h.pageNodetype), g.$allMenus = (g.$allMenus || a()).add(this.$menu), this.vars.opened = !1;
                var i = [d.offcanvas];
                "left" != e.position && i.push(d.mm(e.position)), "back" != e.zposition && i.push(d.mm(e.zposition)), this.$menu.addClass(i.join(" ")).parent().removeClass(d.wrapper), this.setPage(g.$page), this[c + "_initBlocker"](), this[c + "_initWindow"](), this.$menu.on(f.open + " " + f.opening + " " + f.opened + " " + f.close + " " + f.closing + " " + f.closed + " " + f.setPage, function(a) {
                    a.stopPropagation()
                }).on(f.open + " " + f.close + " " + f.setPage, function(a) {
                    b[a.type]()
                }), this.$menu[h.menuInjectMethod + "To"](h.menuWrapperSelector)
            }
        },
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("offcanvas slideout modal background opening blocker page"), e.add("style"), f.add("opening opened closing closed setPage"), g = a[b].glbl
        },
        _clickAnchor: function(a) {
            if (!this.opts[c]) return !1;
            var b = this.$menu.attr("id");
            if (b && b.length && (this.conf.clone && (b = d.umm(b)), a.is('[href="#' + b + '"]'))) return this.open(), !0;
            if (g.$page) {
                var b = g.$page.attr("id");
                return b && b.length && a.is('[href="#' + b + '"]') ? (this.close(), !0) : !1
            }
        }
    }, a[b].defaults[c] = {
        position: "left",
        zposition: "back",
        modal: !1,
        moveBackground: !0
    }, a[b].configuration[c] = {
        pageNodetype: "div",
        pageSelector: null,
        menuWrapperSelector: "body",
        menuInjectMethod: "prepend"
    }, a[b].prototype.open = function() {
        if (this.vars.opened) return !1;
        var a = this;
        return this._openSetup(), setTimeout(function() {
            a._openFinish()
        }, this.conf.openingInterval), "open"
    }, a[b].prototype._openSetup = function() {
        var a = this;
        g.$allMenus.not(this.$menu).trigger(f.close), g.$page.data(e.style, g.$page.attr("style") || ""), g.$wndw.trigger(f.resize, [!0]);
        var b = [d.opened];
        this.opts[c].modal && b.push(d.modal), this.opts[c].moveBackground && b.push(d.background), "left" != this.opts[c].position && b.push(d.mm(this.opts[c].position)), "back" != this.opts[c].zposition && b.push(d.mm(this.opts[c].zposition)), this.opts.classes && b.push(this.opts.classes), g.$html.addClass(b.join(" ")), setTimeout(function() {
            a.vars.opened = !0
        }, this.conf.openingInterval), this.$menu.addClass(d.current + " " + d.opened)
    }, a[b].prototype._openFinish = function() {
        var a = this;
        this.__transitionend(g.$page, function() {
            a.$menu.trigger(f.opened)
        }, this.conf.transitionDuration), g.$html.addClass(d.opening), this.$menu.trigger(f.opening)
    }, a[b].prototype.close = function() {
        if (!this.vars.opened) return !1;
        var a = this;
        return this.__transitionend(g.$page, function() {
            a.$menu.removeClass(d.current).removeClass(d.opened), g.$html.removeClass(d.opened).removeClass(d.modal).removeClass(d.background).removeClass(d.mm(a.opts[c].position)).removeClass(d.mm(a.opts[c].zposition)), a.opts.classes && g.$html.removeClass(a.opts.classes), g.$page.attr("style", g.$page.data(e.style)), a.vars.opened = !1, a.$menu.trigger(f.closed)
        }, this.conf.transitionDuration), g.$html.removeClass(d.opening), this.$menu.trigger(f.closing), "close"
    }, a[b].prototype.setPage = function(b) {
        b || (b = a(this.conf[c].pageSelector, g.$body), b.length > 1 && (b = b.wrapAll("<" + this.conf[c].pageNodetype + " />").parent())), b.addClass(d.page + " " + d.slideout), g.$page = b
    }, a[b].prototype[c + "_initWindow"] = function() {
        g.$wndw.on(f.keydown, function(a) {
            return g.$html.hasClass(d.opened) && 9 == a.keyCode ? (a.preventDefault(), !1) : void 0
        });
        var e = 0;
        g.$wndw.on(f.resize, function(a, b) {
            if (b || g.$html.hasClass(d.opened)) {
                var c = g.$wndw.height();
                (b || c != e) && (e = c, g.$page.css("minHeight", c))
            }
        }), a[b].prototype[c + "_initWindow"] = function() {}
    }, a[b].prototype[c + "_initBlocker"] = function() {
        var e = a('<div id="' + d.blocker + '" class="' + d.slideout + '" />').appendTo(g.$body);
        e.on(f.touchstart, function(a) {
            a.preventDefault(), a.stopPropagation(), e.trigger(f.mousedown)
        }).on(f.mousedown, function(a) {
            a.preventDefault(), g.$html.hasClass(d.modal) || g.$allMenus.trigger(f.close)
        }), a[b].prototype[c + "_initBlocker"] = function() {}
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "buttonbars";
    a[b].addons[c] = {
        _init: function(b) {
            this.opts[c], this.conf[c], this.__refactorClass(a("div", b), this.conf.classNames[c].buttonbar, "buttonbar"), a("." + d.buttonbar, b).each(function() {
                var b = a(this),
                    c = b.children().not("input"),
                    e = b.children().filter("input");
                b.addClass(d.buttonbar + "-" + c.length), e.each(function() {
                    var b = a(this),
                        d = c.filter('label[for="' + b.attr("id") + '"]');
                    d.length && b.insertBefore(d)
                })
            })
        },
        _setup: function() {},
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("buttonbar"), g = a[b].glbl
        }
    }, a[b].defaults[c] = {}, a[b].configuration.classNames[c] = {
        buttonbar: "Buttonbar"
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "counters";
    a[b].addons[c] = {
        _init: function(b) {
            var f = this,
                g = this.opts[c];
            this.conf[c], this.__refactorClass(a("em", b), this.conf.classNames[c].counter, "counter"), g.add && b.each(function() {
                var b = a(this).data(e.parent);
                b && (b.find("> em." + d.counter).length || b.prepend(a('<em class="' + d.counter + '" />')))
            }), g.update && b.each(function() {
                var b = a(this),
                    c = b.data(e.parent);
                if (c) {
                    var g = c.find("> em." + d.counter);
                    g.length && (b.is("." + d.list) || (b = b.find("> ." + d.list)), b.length && !b.data(e.updatecounter) && (b.data(e.updatecounter, !0), f._update(function() {
                        var a = b.children().not("." + d.label).not("." + d.subtitle).not("." + d.hidden).not("." + d.search).not("." + d.noresultsmsg);
                        g.html(a.length)
                    })))
                }
            })
        },
        _setup: function() {
            var d = this.opts[c];
            "boolean" == typeof d && (d = {
                add: d,
                update: d
            }), "object" != typeof d && (d = {}), d = a.extend(!0, {}, a[b].defaults[c], d), this.opts[c] = d
        },
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("counter search noresultsmsg"), e.add("updatecounter"), g = a[b].glbl
        }
    }, a[b].defaults[c] = {
        add: !1,
        update: !1
    }, a[b].configuration.classNames[c] = {
        counter: "Counter"
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    function b(a, b, c) {
        return b > a && (a = b), a > c && (a = c), a
    }
    var c = "mmenu",
        d = "dragOpen";
    a[c].addons[d] = {
        _init: function() {},
        _setup: function() {
            if (this.opts.offCanvas) {
                var f = this,
                    i = this.opts[d],
                    j = this.conf[d];
                if ("boolean" == typeof i && (i = {
                        open: i
                    }), "object" != typeof i && (i = {}), i = a.extend(!0, {}, a[c].defaults[d], i), i.open) {
                    if (Hammer.VERSION < 2) return;
                    var k, l, m, n, o = {},
                        p = 0,
                        q = !1,
                        r = !1,
                        s = 0,
                        t = 0;
                    switch (this.opts.offCanvas.position) {
                        case "left":
                        case "right":
                            o.events = "panleft panright", o.typeLower = "x", o.typeUpper = "X", r = "width";
                            break;
                        case "top":
                        case "bottom":
                            o.events = "panup pandown", o.typeLower = "y", o.typeUpper = "Y", r = "height"
                    }
                    switch (this.opts.offCanvas.position) {
                        case "left":
                        case "top":
                            o.negative = !1;
                            break;
                        case "right":
                        case "bottom":
                            o.negative = !0
                    }
                    switch (this.opts.offCanvas.position) {
                        case "left":
                            o.open_dir = "right", o.close_dir = "left";
                            break;
                        case "right":
                            o.open_dir = "left", o.close_dir = "right";
                            break;
                        case "top":
                            o.open_dir = "down", o.close_dir = "up";
                            break;
                        case "bottom":
                            o.open_dir = "up", o.close_dir = "down"
                    }
                    var u = this.__valueOrFn(i.pageNode, this.$menu, h.$page);
                    "string" == typeof u && (u = a(u));
                    var v = h.$page;
                    switch (this.opts.offCanvas.zposition) {
                        case "front":
                            v = this.$menu;
                            break;
                        case "next":
                            v = v.add(this.$menu)
                    }
                    var w = new Hammer(u[0], i.vendors.hammer);
                    w.on("panstart", function(a) {
                        switch (n = a.center[o.typeLower], f.opts.offCanvas.position) {
                            case "right":
                            case "bottom":
                                n >= h.$wndw[r]() - i.maxStartPos && (p = 1);
                                break;
                            default:
                                n <= i.maxStartPos && (p = 1)
                        }
                        q = o.open_dir
                    }).on(o.events + " panend", function(a) {
                        p > 0 && a.preventDefault()
                    }).on(o.events, function(a) {
                        if (k = a["delta" + o.typeUpper], o.negative && (k = -k), k != s && (q = k >= s ? o.open_dir : o.close_dir), s = k, s > i.threshold && 1 == p) {
                            if (h.$html.hasClass(e.opened)) return;
                            p = 2, f._openSetup(), f.$menu.trigger(g.opening), h.$html.addClass(e.dragging), t = b(h.$wndw[r]() * j[r].perc, j[r].min, j[r].max)
                        }
                        2 == p && (l = b(s, 10, t) - ("front" == f.opts.offCanvas.zposition ? t : 0), o.negative && (l = -l), m = "translate" + o.typeUpper + "(" + l + "px )", v.css({
                            "-webkit-transform": "-webkit-" + m,
                            transform: m
                        }))
                    }).on("panend", function() {
                        2 == p && (h.$html.removeClass(e.dragging), v.css("transform", ""), f[q == o.open_dir ? "_openFinish" : "close"]()), p = 0
                    })
                }
            }
        },
        _add: function() {
            return "function" != typeof Hammer ? (a[c].addons[d]._init = function() {}, void(a[c].addons[d]._setup = function() {})) : (e = a[c]._c, f = a[c]._d, g = a[c]._e, e.add("dragging"), void(h = a[c].glbl))
        }
    }, a[c].defaults[d] = {
        open: !1,
        maxStartPos: 100,
        threshold: 50,
        vendors: {
            hammer: {}
        }
    }, a[c].configuration[d] = {
        width: {
            perc: .8,
            min: 140,
            max: 440
        },
        height: {
            perc: .8,
            min: 140,
            max: 880
        }
    };
    var e, f, g, h
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "fixedElements";
    a[b].addons[c] = {
        _init: function() {
            if (this.opts.offCanvas) {
                var a = this.conf.classNames[c].fixedTop,
                    b = this.conf.classNames[c].fixedBottom,
                    e = this.__refactorClass(g.$page.find("." + a), a, "fixed-top"),
                    f = this.__refactorClass(g.$page.find("." + b), b, "fixed-bottom");
                e.add(f).appendTo(g.$body).addClass(d.slideout)
            }
        },
        _setup: function() {},
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("fixed-top fixed-bottom"), g = a[b].glbl
        }
    }, a[b].defaults[c] = {}, a[b].configuration.classNames[c] = {
        fixedTop: "FixedTop",
        fixedBottom: "FixedBottom"
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "footer";
    a[b].addons[c] = {
        _init: function(e) {
            var g = this,
                h = this.opts[c],
                i = a("div." + d.footer, this.$menu);
            i.length && (h.update && e.each(function() {
                var b = a(this),
                    e = a("." + g.conf.classNames[c].panelFooter, b),
                    j = e.html();
                j || (j = h.title);
                var k = function() {
                    i[j ? "show" : "hide"](), i.html(j)
                };
                b.on(f.open, k), b.hasClass(d.current) && k()
            }), a[b].addons.buttonbars && a[b].addons.buttonbars._init.call(this, i))
        },
        _setup: function() {
            var e = this.opts[c];
            if ("boolean" == typeof e && (e = {
                    add: e,
                    update: e
                }), "object" != typeof e && (e = {}), e = a.extend(!0, {}, a[b].defaults[c], e), this.opts[c] = e, e.add) {
                var f = e.content ? e.content : e.title;
                a('<div class="' + d.footer + '" />').appendTo(this.$menu).append(f), this.$menu.addClass(d.hasfooter)
            }
        },
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("footer hasfooter"), g = a[b].glbl
        }
    }, a[b].defaults[c] = {
        add: !1,
        content: !1,
        title: "",
        update: !1
    }, a[b].configuration.classNames[c] = {
        panelFooter: "Footer"
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "header";
    a[b].addons[c] = {
        _init: function(e) {
            var h = this,
                i = this.opts[c],
                j = (this.conf[c], a("." + d.header, this.$menu));
            if (j.length) {
                if (i.update) {
                    var k = j.find("." + d.title),
                        l = j.find("." + d.prev),
                        m = j.find("." + d.next),
                        n = j.find("." + d.close),
                        o = !1;
                    g.$page && (o = "#" + g.$page.attr("id"), n.attr("href", o)), e.each(function() {
                        var b = a(this),
                            e = b.find("." + h.conf.classNames[c].panelHeader),
                            g = b.find("." + h.conf.classNames[c].panelPrev),
                            j = b.find("." + h.conf.classNames[c].panelNext),
                            n = e.html(),
                            o = g.attr("href"),
                            p = j.attr("href"),
                            q = g.html(),
                            r = j.html();
                        n || (n = b.find("." + d.subclose).html()), n || (n = i.title), o || (o = b.find("." + d.subclose).attr("href"));
                        var s = function() {
                            k[n ? "show" : "hide"](), k.html(n), l[o ? "attr" : "removeAttr"]("href", o), l[o || q ? "show" : "hide"](), l.html(q), m[p ? "attr" : "removeAttr"]("href", p), m[p || r ? "show" : "hide"](), m.html(r)
                        };
                        b.on(f.open, s), b.hasClass(d.current) && s()
                    })
                }
                a[b].addons.buttonbars && a[b].addons.buttonbars._init.call(this, j)
            }
        },
        _setup: function() {
            var e = this.opts[c];
            if (this.conf[c], "boolean" == typeof e && (e = {
                    add: e,
                    update: e
                }), "object" != typeof e && (e = {}), "undefined" == typeof e.content && (e.content = ["prev", "title", "next"]), e = a.extend(!0, {}, a[b].defaults[c], e), this.opts[c] = e, e.add) {
                if (e.content instanceof Array) {
                    for (var f = a("<div />"), g = 0, h = e.content.length; h > g; g++) switch (e.content[g]) {
                        case "prev":
                        case "next":
                        case "close":
                            f.append('<a class="' + d[e.content[g]] + '" href="#"></a>');
                            break;
                        case "title":
                            f.append('<span class="' + d.title + '"></span>');
                            break;
                        default:
                            f.append(e.content[g])
                    }
                    f = f.html()
                } else var f = e.content;
                a('<div class="' + d.header + '" />').prependTo(this.$menu).append(f), this.$menu.addClass(d.hasheader)
            }
        },
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("header hasheader prev next close title"), g = a[b].glbl
        }
    }, a[b].defaults[c] = {
        add: !1,
        title: "Menu",
        update: !1
    }, a[b].configuration.classNames[c] = {
        panelHeader: "Header",
        panelNext: "Next",
        panelPrev: "Prev"
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "labels";
    a[b].addons[c] = {
        _init: function(b) {
            var e = this.opts[c];
            this.__refactorClass(a("li", this.$menu), this.conf.classNames[c].collapsed, "collapsed"), e.collapse && a("." + d.label, b).each(function() {
                var b = a(this),
                    c = b.nextUntil("." + d.label, "." + d.collapsed);
                c.length && (b.children("." + d.subopen).length || (b.wrapInner("<span />"), b.prepend('<a href="#" class="' + d.subopen + " " + d.fullsubopen + '" />')))
            })
        },
        _setup: function() {
            var d = this.opts[c];
            "boolean" == typeof d && (d = {
                collapse: d
            }), "object" != typeof d && (d = {}), d = a.extend(!0, {}, a[b].defaults[c], d), this.opts[c] = d
        },
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("collapsed uncollapsed"), g = a[b].glbl
        },
        _clickAnchor: function(a, b) {
            if (b) {
                var c = a.parent();
                if (c.is("." + d.label)) {
                    var e = c.nextUntil("." + d.label, "." + d.collapsed);
                    return c.toggleClass(d.opened), e[c.hasClass(d.opened) ? "addClass" : "removeClass"](d.uncollapsed), !0
                }
            }
            return !1
        }
    }, a[b].defaults[c] = {
        collapse: !1
    }, a[b].configuration.classNames[c] = {
        collapsed: "Collapsed"
    };
    var d, e, f, g
}(jQuery), ! function(a) {
    function b(a) {
        switch (a) {
            case 9:
            case 16:
            case 17:
            case 18:
            case 37:
            case 38:
            case 39:
            case 40:
                return !0
        }
        return !1
    }
    var c = "mmenu",
        d = "searchfield";
    a[c].addons[d] = {
        _init: function(c) {
            var h = this,
                i = this.opts[d],
                j = this.conf[d];
            if (i.add) {
                switch (i.addTo) {
                    case "menu":
                        var k = this.$menu;
                        break;
                    case "panels":
                        var k = c;
                        break;
                    default:
                        var k = a(i.addTo, this.$menu).filter("." + e.panel)
                }
                k.length && k.each(function() {
                    var b = a(this),
                        c = b.is("." + e.menu) ? j.form ? "form" : "div" : "li";
                    if (!b.children(c + "." + e.search).length) {
                        if (b.is("." + e.menu)) var d = h.$menu,
                            f = "prependTo";
                        else var d = b.children().first(),
                            f = d.is("." + e.subtitle) ? "insertAfter" : "insertBefore";
                        var g = a("<" + c + ' class="' + e.search + '" />');
                        if ("form" == c && "object" == typeof j.form)
                            for (var k in j.form) g.attr(k, j.form[k]);
                        g.append('<input placeholder="' + i.placeholder + '" type="text" autocomplete="off" />'), g[f](d)
                    }
                    i.noResults && (b.is("." + e.menu) && (b = b.children("." + e.panel).first()), c = b.is("." + e.list) ? "li" : "div", b.children(c + "." + e.noresultsmsg).length || a("<" + c + ' class="' + e.noresultsmsg + '" />').html(i.noResults).appendTo(b))
                })
            }
            if (this.$menu.children("." + e.search).length && this.$menu.addClass(e.hassearch), i.search) {
                var l = a("." + e.search, this.$menu);
                l.length && l.each(function() {
                    var c = a(this);
                    if ("menu" == i.addTo) var d = a("." + e.panel, h.$menu),
                        j = h.$menu;
                    else var d = c.closest("." + e.panel),
                        j = d;
                    var k = c.children("input"),
                        l = h.__findAddBack(d, "." + e.list).children("li"),
                        m = l.filter("." + e.label),
                        n = l.not("." + e.subtitle).not("." + e.label).not("." + e.search).not("." + e.noresultsmsg),
                        o = "> a";
                    i.showLinksOnly || (o += ", > span"), k.off(g.keyup + " " + g.change).on(g.keyup, function(a) {
                        b(a.keyCode) || c.trigger(g.search)
                    }).on(g.change, function() {
                        c.trigger(g.search)
                    }), c.off(g.reset + " " + g.search).on(g.reset + " " + g.search, function(a) {
                        a.stopPropagation()
                    }).on(g.reset, function() {
                        c.trigger(g.search, [""])
                    }).on(g.search, function(b, c) {
                        "string" == typeof c ? k.val(c) : c = k.val(), c = c.toLowerCase(), d.scrollTop(0), n.add(m).addClass(e.hidden), n.each(function() {
                            var b = a(this);
                            a(o, b).text().toLowerCase().indexOf(c) > -1 && b.add(b.prevAll("." + e.label).first()).removeClass(e.hidden)
                        }), a(d.get().reverse()).each(function(b) {
                            var c = a(this),
                                d = c.data(f.parent);
                            if (d) {
                                var j = c.add(c.find("> ." + e.list)).find("> li").not("." + e.subtitle).not("." + e.search).not("." + e.noresultsmsg).not("." + e.label).not("." + e.hidden);
                                j.length ? d.removeClass(e.hidden).removeClass(e.nosubresults).prevAll("." + e.label).first().removeClass(e.hidden) : "menu" == i.addTo && (c.hasClass(e.opened) && setTimeout(function() {
                                    d.trigger(g.open)
                                }, 1.5 * (b + 1) * h.conf.openingInterval), d.addClass(e.nosubresults))
                            }
                        }), j[n.not("." + e.hidden).length ? "removeClass" : "addClass"](e.noresults), h._update()
                    })
                })
            }
        },
        _setup: function() {
            var b = this.opts[d];
            this.conf[d], "boolean" == typeof b && (b = {
                add: b,
                search: b
            }), "object" != typeof b && (b = {}), b = a.extend(!0, {}, a[c].defaults[d], b), "boolean" != typeof b.showLinksOnly && (b.showLinksOnly = "menu" == b.addTo), this.opts[d] = b
        },
        _add: function() {
            e = a[c]._c, f = a[c]._d, g = a[c]._e, e.add("search hassearch noresultsmsg noresults nosubresults"), g.add("search reset change"), h = a[c].glbl
        }
    }, a[c].defaults[d] = {
        add: !1,
        addTo: "menu",
        search: !1,
        placeholder: "Search",
        noResults: "No results found."
    }, a[c].configuration[d] = {
        form: !1
    };
    var e, f, g, h
}(jQuery), ! function(a) {
    var b = "mmenu",
        c = "toggles";
    a[b].addons[c] = {
        _init: function(b) {
            var e = this;
            this.opts[c], this.conf[c], this.__refactorClass(a("input", b), this.conf.classNames[c].toggle, "toggle"), this.__refactorClass(a("input", b), this.conf.classNames[c].check, "check"), a("input." + d.toggle + ", input." + d.check, b).each(function() {
                var b = a(this),
                    c = b.closest("li"),
                    f = b.hasClass(d.toggle) ? "toggle" : "check",
                    g = b.attr("id") || e.__getUniqueId();
                c.children('label[for="' + g + '"]').length || (b.attr("id", g), c.prepend(b), a('<label for="' + g + '" class="' + d[f] + '"></label>').insertBefore(c.children("a, span").last()))
            })
        },
        _setup: function() {},
        _add: function() {
            d = a[b]._c, e = a[b]._d, f = a[b]._e, d.add("toggle check"), g = a[b].glbl
        }
    }, a[b].defaults[c] = {}, a[b].configuration.classNames[c] = {
        toggle: "Toggle",
        check: "Check"
    };
    var d, e, f, g
}(jQuery), "function" != typeof Object.create && (Object.create = function(a) {
        function b() {}
        return b.prototype = a, new b
    }),
    function(a, b, c) {
        var d = {
            init: function(b, c) {
                var d = this;
                d.$elem = a(c), d.options = a.extend({}, a.fn.owlCarousel.options, d.$elem.data(), b), d.userOptions = b, d.loadContent()
            },
            loadContent: function() {
                function b(a) {
                    var b, c = "";
                    if ("function" == typeof d.options.jsonSuccess) d.options.jsonSuccess.apply(this, [a]);
                    else {
                        for (b in a.owl) a.owl.hasOwnProperty(b) && (c += a.owl[b].item);
                        d.$elem.html(c)
                    }
                    d.logIn()
                }
                var c, d = this;
                "function" == typeof d.options.beforeInit && d.options.beforeInit.apply(this, [d.$elem]), "string" == typeof d.options.jsonPath ? (c = d.options.jsonPath, a.getJSON(c, b)) : d.logIn()
            },
            logIn: function() {
                var a = this;
                a.$elem.data("owl-originalStyles", a.$elem.attr("style")).data("owl-originalClasses", a.$elem.attr("class")), a.$elem.css({
                    opacity: 0
                }), a.orignalItems = a.options.items, a.checkBrowser(), a.wrapperWidth = 0, a.checkVisible = null, a.setVars()
            },
            setVars: function() {
                var a = this;
                return 0 === a.$elem.children().length ? !1 : (a.baseClass(), a.eventTypes(), a.$userItems = a.$elem.children(), a.itemsAmount = a.$userItems.length, a.wrapItems(), a.$owlItems = a.$elem.find(".owl-item"), a.$owlWrapper = a.$elem.find(".owl-wrapper"), a.playDirection = "next", a.prevItem = 0, a.prevArr = [0], a.currentItem = 0, a.customEvents(), void a.onStartup())
            },
            onStartup: function() {
                var a = this;
                a.updateItems(), a.calculateAll(), a.buildControls(), a.updateControls(), a.response(), a.moveEvents(), a.stopOnHover(), a.owlStatus(), a.options.transitionStyle !== !1 && a.transitionTypes(a.options.transitionStyle), a.options.autoPlay === !0 && (a.options.autoPlay = 5e3), a.play(), a.$elem.find(".owl-wrapper").css("display", "block"), a.$elem.is(":visible") ? a.$elem.css("opacity", 1) : a.watchVisibility(), a.onstartup = !1, a.eachMoveUpdate(), "function" == typeof a.options.afterInit && a.options.afterInit.apply(this, [a.$elem])
            },
            eachMoveUpdate: function() {
                var a = this;
                a.options.lazyLoad === !0 && a.lazyLoad(), a.options.autoHeight === !0 && a.autoHeight(), a.onVisibleItems(), "function" == typeof a.options.afterAction && a.options.afterAction.apply(this, [a.$elem])
            },
            updateVars: function() {
                var a = this;
                "function" == typeof a.options.beforeUpdate && a.options.beforeUpdate.apply(this, [a.$elem]), a.watchVisibility(), a.updateItems(), a.calculateAll(), a.updatePosition(), a.updateControls(), a.eachMoveUpdate(), "function" == typeof a.options.afterUpdate && a.options.afterUpdate.apply(this, [a.$elem])
            },
            reload: function() {
                var a = this;
                b.setTimeout(function() {
                    a.updateVars()
                }, 0)
            },
            watchVisibility: function() {
                var a = this;
                return a.$elem.is(":visible") !== !1 ? !1 : (a.$elem.css({
                    opacity: 0
                }), b.clearInterval(a.autoPlayInterval), b.clearInterval(a.checkVisible), void(a.checkVisible = b.setInterval(function() {
                    a.$elem.is(":visible") && (a.reload(), a.$elem.animate({
                        opacity: 1
                    }, 200), b.clearInterval(a.checkVisible))
                }, 500)))
            },
            wrapItems: function() {
                var a = this;
                a.$userItems.wrapAll('<div class="owl-wrapper">').wrap('<div class="owl-item"></div>'), a.$elem.find(".owl-wrapper").wrap('<div class="owl-wrapper-outer">'), a.wrapperOuter = a.$elem.find(".owl-wrapper-outer"), a.$elem.css("display", "block")
            },
            baseClass: function() {
                var a = this,
                    b = a.$elem.hasClass(a.options.baseClass),
                    c = a.$elem.hasClass(a.options.theme);
                b || a.$elem.addClass(a.options.baseClass), c || a.$elem.addClass(a.options.theme)
            },
            updateItems: function() {
                var b, c, d = this;
                if (d.options.responsive === !1) return !1;
                if (d.options.singleItem === !0) return d.options.items = d.orignalItems = 1, d.options.itemsCustom = !1, d.options.itemsDesktop = !1, d.options.itemsDesktopSmall = !1, d.options.itemsTablet = !1, d.options.itemsTabletSmall = !1, d.options.itemsMobile = !1, !1;
                if (b = a(d.options.responsiveBaseWidth).width(), b > (d.options.itemsDesktop[0] || d.orignalItems) && (d.options.items = d.orignalItems), d.options.itemsCustom !== !1)
                    for (d.options.itemsCustom.sort(function(a, b) {
                            return a[0] - b[0]
                        }), c = 0; c < d.options.itemsCustom.length; c += 1) d.options.itemsCustom[c][0] <= b && (d.options.items = d.options.itemsCustom[c][1]);
                else b <= d.options.itemsDesktop[0] && d.options.itemsDesktop !== !1 && (d.options.items = d.options.itemsDesktop[1]), b <= d.options.itemsDesktopSmall[0] && d.options.itemsDesktopSmall !== !1 && (d.options.items = d.options.itemsDesktopSmall[1]), b <= d.options.itemsTablet[0] && d.options.itemsTablet !== !1 && (d.options.items = d.options.itemsTablet[1]), b <= d.options.itemsTabletSmall[0] && d.options.itemsTabletSmall !== !1 && (d.options.items = d.options.itemsTabletSmall[1]), b <= d.options.itemsMobile[0] && d.options.itemsMobile !== !1 && (d.options.items = d.options.itemsMobile[1]);
                d.options.items > d.itemsAmount && d.options.itemsScaleUp === !0 && (d.options.items = d.itemsAmount)
            },
            response: function() {
                var c, d, e = this;
                return e.options.responsive !== !0 ? !1 : (d = a(b).width(), e.resizer = function() {
                    a(b).width() !== d && (e.options.autoPlay !== !1 && b.clearInterval(e.autoPlayInterval), b.clearTimeout(c), c = b.setTimeout(function() {
                        d = a(b).width(), e.updateVars()
                    }, e.options.responsiveRefreshRate))
                }, void a(b).resize(e.resizer))
            },
            updatePosition: function() {
                var a = this;
                a.jumpTo(a.currentItem), a.options.autoPlay !== !1 && a.checkAp()
            },
            appendItemsSizes: function() {
                var b = this,
                    c = 0,
                    d = b.itemsAmount - b.options.items;
                b.$owlItems.each(function(e) {
                    var f = a(this);
                    f.css({
                        width: b.itemWidth
                    }).data("owl-item", Number(e)), (e % b.options.items === 0 || e === d) && (e > d || (c += 1)), f.data("owl-roundPages", c)
                })
            },
            appendWrapperSizes: function() {
                var a = this,
                    b = a.$owlItems.length * a.itemWidth;
                a.$owlWrapper.css({
                    width: 2 * b,
                    left: 0
                }), a.appendItemsSizes()
            },
            calculateAll: function() {
                var a = this;
                a.calculateWidth(), a.appendWrapperSizes(), a.loops(), a.max()
            },
            calculateWidth: function() {
                var a = this;
                a.itemWidth = Math.round(a.$elem.width() / a.options.items)
            },
            max: function() {
                var a = this,
                    b = -1 * (a.itemsAmount * a.itemWidth - a.options.items * a.itemWidth);
                return a.options.items > a.itemsAmount ? (a.maximumItem = 0, b = 0, a.maximumPixels = 0) : (a.maximumItem = a.itemsAmount - a.options.items, a.maximumPixels = b), b
            },
            min: function() {
                return 0
            },
            loops: function() {
                var b, c, d, e = this,
                    f = 0,
                    g = 0;
                for (e.positionsInArray = [0], e.pagesInArray = [], b = 0; b < e.itemsAmount; b += 1) g += e.itemWidth, e.positionsInArray.push(-g), e.options.scrollPerPage === !0 && (c = a(e.$owlItems[b]), d = c.data("owl-roundPages"), d !== f && (e.pagesInArray[f] = e.positionsInArray[b], f = d))
            },
            buildControls: function() {
                var b = this;
                (b.options.navigation === !0 || b.options.pagination === !0) && (b.owlControls = a('<div class="owl-controls"/>').toggleClass("clickable", !b.browser.isTouch).appendTo(b.$elem)), b.options.pagination === !0 && b.buildPagination(), b.options.navigation === !0 && b.buildButtons()
            },
            buildButtons: function() {
                var b = this,
                    c = a('<div class="owl-buttons"/>');
                b.owlControls.append(c), b.buttonPrev = a("<div/>", {
                    "class": "owl-prev",
                    html: b.options.navigationText[0] || ""
                }), b.buttonNext = a("<div/>", {
                    "class": "owl-next",
                    html: b.options.navigationText[1] || ""
                }), c.append(b.buttonPrev).append(b.buttonNext), c.on("touchstart.owlControls mousedown.owlControls", 'div[class^="owl"]', function(a) {
                    a.preventDefault()
                }), c.on("touchend.owlControls mouseup.owlControls", 'div[class^="owl"]', function(c) {
                    c.preventDefault(), a(this).hasClass("owl-next") ? b.next() : b.prev()
                })
            },
            buildPagination: function() {
                var b = this;
                b.paginationWrapper = a('<div class="owl-pagination"/>'), b.owlControls.append(b.paginationWrapper), b.paginationWrapper.on("touchend.owlControls mouseup.owlControls", ".owl-page", function(c) {
                    c.preventDefault(), Number(a(this).data("owl-page")) !== b.currentItem && b.goTo(Number(a(this).data("owl-page")), !0)
                })
            },
            updatePagination: function() {
                var b, c, d, e, f, g, h = this;
                if (h.options.pagination === !1) return !1;
                for (h.paginationWrapper.html(""), b = 0, c = h.itemsAmount - h.itemsAmount % h.options.items, e = 0; e < h.itemsAmount; e += 1) e % h.options.items === 0 && (b += 1, c === e && (d = h.itemsAmount - h.options.items), f = a("<div/>", {
                    "class": "owl-page"
                }), g = a("<span></span>", {
                    text: h.options.paginationNumbers === !0 ? b : "",
                    "class": h.options.paginationNumbers === !0 ? "owl-numbers" : ""
                }), f.append(g), f.data("owl-page", c === e ? d : e), f.data("owl-roundPages", b), h.paginationWrapper.append(f));
                h.checkPagination()
            },
            checkPagination: function() {
                var b = this;
                return b.options.pagination === !1 ? !1 : void b.paginationWrapper.find(".owl-page").each(function() {
                    a(this).data("owl-roundPages") === a(b.$owlItems[b.currentItem]).data("owl-roundPages") && (b.paginationWrapper.find(".owl-page").removeClass("active"), a(this).addClass("active"))
                })
            },
            checkNavigation: function() {
                var a = this;
                return a.options.navigation === !1 ? !1 : void(a.options.rewindNav === !1 && (0 === a.currentItem && 0 === a.maximumItem ? (a.buttonPrev.addClass("disabled"), a.buttonNext.addClass("disabled")) : 0 === a.currentItem && 0 !== a.maximumItem ? (a.buttonPrev.addClass("disabled"), a.buttonNext.removeClass("disabled")) : a.currentItem === a.maximumItem ? (a.buttonPrev.removeClass("disabled"), a.buttonNext.addClass("disabled")) : 0 !== a.currentItem && a.currentItem !== a.maximumItem && (a.buttonPrev.removeClass("disabled"), a.buttonNext.removeClass("disabled"))))
            },
            updateControls: function() {
                var a = this;
                a.updatePagination(), a.checkNavigation(), a.owlControls && (a.options.items >= a.itemsAmount ? a.owlControls.hide() : a.owlControls.show())
            },
            destroyControls: function() {
                var a = this;
                a.owlControls && a.owlControls.remove()
            },
            next: function(a) {
                var b = this;
                if (b.isTransition) return !1;
                if (b.currentItem += b.options.scrollPerPage === !0 ? b.options.items : 1, b.currentItem > b.maximumItem + (b.options.scrollPerPage === !0 ? b.options.items - 1 : 0)) {
                    if (b.options.rewindNav !== !0) return b.currentItem = b.maximumItem, !1;
                    b.currentItem = 0, a = "rewind"
                }
                b.goTo(b.currentItem, a)
            },
            prev: function(a) {
                var b = this;
                if (b.isTransition) return !1;
                if (b.options.scrollPerPage === !0 && b.currentItem > 0 && b.currentItem < b.options.items ? b.currentItem = 0 : b.currentItem -= b.options.scrollPerPage === !0 ? b.options.items : 1, b.currentItem < 0) {
                    if (b.options.rewindNav !== !0) return b.currentItem = 0, !1;
                    b.currentItem = b.maximumItem, a = "rewind"
                }
                b.goTo(b.currentItem, a)
            },
            goTo: function(a, c, d) {
                var e, f = this;
                return f.isTransition ? !1 : ("function" == typeof f.options.beforeMove && f.options.beforeMove.apply(this, [f.$elem]), a >= f.maximumItem ? a = f.maximumItem : 0 >= a && (a = 0), f.currentItem = f.owl.currentItem = a, f.options.transitionStyle !== !1 && "drag" !== d && 1 === f.options.items && f.browser.support3d === !0 ? (f.swapSpeed(0), f.browser.support3d === !0 ? f.transition3d(f.positionsInArray[a]) : f.css2slide(f.positionsInArray[a], 1), f.afterGo(), f.singleItemTransition(), !1) : (e = f.positionsInArray[a], f.browser.support3d === !0 ? (f.isCss3Finish = !1, c === !0 ? (f.swapSpeed("paginationSpeed"), b.setTimeout(function() {
                    f.isCss3Finish = !0
                }, f.options.paginationSpeed)) : "rewind" === c ? (f.swapSpeed(f.options.rewindSpeed), b.setTimeout(function() {
                    f.isCss3Finish = !0
                }, f.options.rewindSpeed)) : (f.swapSpeed("slideSpeed"), b.setTimeout(function() {
                    f.isCss3Finish = !0
                }, f.options.slideSpeed)), f.transition3d(e)) : c === !0 ? f.css2slide(e, f.options.paginationSpeed) : "rewind" === c ? f.css2slide(e, f.options.rewindSpeed) : f.css2slide(e, f.options.slideSpeed), void f.afterGo()))
            },
            jumpTo: function(a) {
                var b = this;
                "function" == typeof b.options.beforeMove && b.options.beforeMove.apply(this, [b.$elem]), a >= b.maximumItem || -1 === a ? a = b.maximumItem : 0 >= a && (a = 0), b.swapSpeed(0), b.browser.support3d === !0 ? b.transition3d(b.positionsInArray[a]) : b.css2slide(b.positionsInArray[a], 1), b.currentItem = b.owl.currentItem = a, b.afterGo()
            },
            afterGo: function() {
                var a = this;
                a.prevArr.push(a.currentItem), a.prevItem = a.owl.prevItem = a.prevArr[a.prevArr.length - 2], a.prevArr.shift(0), a.prevItem !== a.currentItem && (a.checkPagination(), a.checkNavigation(), a.eachMoveUpdate(), a.options.autoPlay !== !1 && a.checkAp()), "function" == typeof a.options.afterMove && a.prevItem !== a.currentItem && a.options.afterMove.apply(this, [a.$elem])
            },
            stop: function() {
                var a = this;
                a.apStatus = "stop", b.clearInterval(a.autoPlayInterval)
            },
            checkAp: function() {
                var a = this;
                "stop" !== a.apStatus && a.play()
            },
            play: function() {
                var a = this;
                return a.apStatus = "play", a.options.autoPlay === !1 ? !1 : (b.clearInterval(a.autoPlayInterval), void(a.autoPlayInterval = b.setInterval(function() {
                    a.next(!0)
                }, a.options.autoPlay)))
            },
            swapSpeed: function(a) {
                var b = this;
                "slideSpeed" === a ? b.$owlWrapper.css(b.addCssSpeed(b.options.slideSpeed)) : "paginationSpeed" === a ? b.$owlWrapper.css(b.addCssSpeed(b.options.paginationSpeed)) : "string" != typeof a && b.$owlWrapper.css(b.addCssSpeed(a))
            },
            addCssSpeed: function(a) {
                return {
                    "-webkit-transition": "all " + a + "ms ease",
                    "-moz-transition": "all " + a + "ms ease",
                    "-o-transition": "all " + a + "ms ease",
                    transition: "all " + a + "ms ease"
                }
            },
            removeTransition: function() {
                return {
                    "-webkit-transition": "",
                    "-moz-transition": "",
                    "-o-transition": "",
                    transition: ""
                }
            },
            doTranslate: function(a) {
                return {
                    "-webkit-transform": "translate3d(" + a + "px, 0px, 0px)",
                    "-moz-transform": "translate3d(" + a + "px, 0px, 0px)",
                    "-o-transform": "translate3d(" + a + "px, 0px, 0px)",
                    "-ms-transform": "translate3d(" + a + "px, 0px, 0px)",
                    transform: "translate3d(" + a + "px, 0px,0px)"
                }
            },
            transition3d: function(a) {
                var b = this;
                b.$owlWrapper.css(b.doTranslate(a))
            },
            css2move: function(a) {
                var b = this;
                b.$owlWrapper.css({
                    left: a
                })
            },
            css2slide: function(a, b) {
                var c = this;
                c.isCssFinish = !1, c.$owlWrapper.stop(!0, !0).animate({
                    left: a
                }, {
                    duration: b || c.options.slideSpeed,
                    complete: function() {
                        c.isCssFinish = !0
                    }
                })
            },
            checkBrowser: function() {
                var a, d, e, f, g = this,
                    h = "translate3d(0px, 0px, 0px)",
                    i = c.createElement("div");
                i.style.cssText = "  -moz-transform:" + h + "; -ms-transform:" + h + "; -o-transform:" + h + "; -webkit-transform:" + h + "; transform:" + h, a = /translate3d\(0px, 0px, 0px\)/g, d = i.style.cssText.match(a), e = null !== d && 1 === d.length, f = "ontouchstart" in b || b.navigator.msMaxTouchPoints, g.browser = {
                    support3d: e,
                    isTouch: f
                }
            },
            moveEvents: function() {
                var a = this;
                (a.options.mouseDrag !== !1 || a.options.touchDrag !== !1) && (a.gestures(), a.disabledEvents())
            },
            eventTypes: function() {
                var a = this,
                    b = ["s", "e", "x"];
                a.ev_types = {}, a.options.mouseDrag === !0 && a.options.touchDrag === !0 ? b = ["touchstart.owl mousedown.owl", "touchmove.owl mousemove.owl", "touchend.owl touchcancel.owl mouseup.owl"] : a.options.mouseDrag === !1 && a.options.touchDrag === !0 ? b = ["touchstart.owl", "touchmove.owl", "touchend.owl touchcancel.owl"] : a.options.mouseDrag === !0 && a.options.touchDrag === !1 && (b = ["mousedown.owl", "mousemove.owl", "mouseup.owl"]), a.ev_types.start = b[0], a.ev_types.move = b[1], a.ev_types.end = b[2]
            },
            disabledEvents: function() {
                var b = this;
                b.$elem.on("dragstart.owl", function(a) {
                    a.preventDefault()
                }), b.$elem.on("mousedown.disableTextSelect", function(b) {
                    return a(b.target).is("input, textarea, select, option")
                })
            },
            gestures: function() {
                function d(a) {
                    if (void 0 !== a.touches) return {
                        x: a.touches[0].pageX,
                        y: a.touches[0].pageY
                    };
                    if (void 0 === a.touches) {
                        if (void 0 !== a.pageX) return {
                            x: a.pageX,
                            y: a.pageY
                        };
                        if (void 0 === a.pageX) return {
                            x: a.clientX,
                            y: a.clientY
                        }
                    }
                }

                function e(b) {
                    "on" === b ? (a(c).on(i.ev_types.move, g), a(c).on(i.ev_types.end, h)) : "off" === b && (a(c).off(i.ev_types.move), a(c).off(i.ev_types.end))
                }

                function f(c) {
                    var f, g = c.originalEvent || c || b.event;
                    if (3 === g.which) return !1;
                    if (!(i.itemsAmount <= i.options.items)) {
                        if (i.isCssFinish === !1 && !i.options.dragBeforeAnimFinish) return !1;
                        if (i.isCss3Finish === !1 && !i.options.dragBeforeAnimFinish) return !1;
                        i.options.autoPlay !== !1 && b.clearInterval(i.autoPlayInterval), i.browser.isTouch === !0 || i.$owlWrapper.hasClass("grabbing") || i.$owlWrapper.addClass("grabbing"), i.newPosX = 0, i.newRelativeX = 0, a(this).css(i.removeTransition()), f = a(this).position(), j.relativePos = f.left, j.offsetX = d(g).x - f.left, j.offsetY = d(g).y - f.top, e("on"), j.sliding = !1, j.targetElement = g.target || g.srcElement
                    }
                }

                function g(e) {
                    var f, g, h = e.originalEvent || e || b.event;
                    i.newPosX = d(h).x - j.offsetX, i.newPosY = d(h).y - j.offsetY, i.newRelativeX = i.newPosX - j.relativePos, "function" == typeof i.options.startDragging && j.dragging !== !0 && 0 !== i.newRelativeX && (j.dragging = !0, i.options.startDragging.apply(i, [i.$elem])), (i.newRelativeX > 8 || i.newRelativeX < -8) && i.browser.isTouch === !0 && (void 0 !== h.preventDefault ? h.preventDefault() : h.returnValue = !1, j.sliding = !0), (i.newPosY > 10 || i.newPosY < -10) && j.sliding === !1 && a(c).off("touchmove.owl"), f = function() {
                        return i.newRelativeX / 5
                    }, g = function() {
                        return i.maximumPixels + i.newRelativeX / 5
                    }, i.newPosX = Math.max(Math.min(i.newPosX, f()), g()), i.browser.support3d === !0 ? i.transition3d(i.newPosX) : i.css2move(i.newPosX)
                }

                function h(c) {
                    var d, f, g, h = c.originalEvent || c || b.event;
                    h.target = h.target || h.srcElement, j.dragging = !1, i.browser.isTouch !== !0 && i.$owlWrapper.removeClass("grabbing"), i.dragDirection = i.owl.dragDirection = i.newRelativeX < 0 ? "left" : "right", 0 !== i.newRelativeX && (d = i.getNewPosition(), i.goTo(d, !1, "drag"), j.targetElement === h.target && i.browser.isTouch !== !0 && (a(h.target).on("click.disable", function(b) {
                        b.stopImmediatePropagation(), b.stopPropagation(), b.preventDefault(), a(b.target).off("click.disable")
                    }), f = a._data(h.target, "events").click, g = f.pop(), f.splice(0, 0, g))), e("off")
                }
                var i = this,
                    j = {
                        offsetX: 0,
                        offsetY: 0,
                        baseElWidth: 0,
                        relativePos: 0,
                        position: null,
                        minSwipe: null,
                        maxSwipe: null,
                        sliding: null,
                        dargging: null,
                        targetElement: null
                    };
                i.isCssFinish = !0, i.$elem.on(i.ev_types.start, ".owl-wrapper", f)
            },
            getNewPosition: function() {
                var a = this,
                    b = a.closestItem();
                return b > a.maximumItem ? (a.currentItem = a.maximumItem, b = a.maximumItem) : a.newPosX >= 0 && (b = 0, a.currentItem = 0), b
            },
            closestItem: function() {
                var b = this,
                    c = b.options.scrollPerPage === !0 ? b.pagesInArray : b.positionsInArray,
                    d = b.newPosX,
                    e = null;
                return a.each(c, function(f, g) {
                    d - b.itemWidth / 20 > c[f + 1] && d - b.itemWidth / 20 < g && "left" === b.moveDirection() ? (e = g, b.currentItem = b.options.scrollPerPage === !0 ? a.inArray(e, b.positionsInArray) : f) : d + b.itemWidth / 20 < g && d + b.itemWidth / 20 > (c[f + 1] || c[f] - b.itemWidth) && "right" === b.moveDirection() && (b.options.scrollPerPage === !0 ? (e = c[f + 1] || c[c.length - 1], b.currentItem = a.inArray(e, b.positionsInArray)) : (e = c[f + 1], b.currentItem = f + 1))
                }), b.currentItem
            },
            moveDirection: function() {
                var a, b = this;
                return b.newRelativeX < 0 ? (a = "right", b.playDirection = "next") : (a = "left", b.playDirection = "prev"), a
            },
            customEvents: function() {
                var a = this;
                a.$elem.on("owl.next", function() {
                    a.next()
                }), a.$elem.on("owl.prev", function() {
                    a.prev()
                }), a.$elem.on("owl.play", function(b, c) {
                    a.options.autoPlay = c, a.play(), a.hoverStatus = "play"
                }), a.$elem.on("owl.stop", function() {
                    a.stop(), a.hoverStatus = "stop"
                }), a.$elem.on("owl.goTo", function(b, c) {
                    a.goTo(c)
                }), a.$elem.on("owl.jumpTo", function(b, c) {
                    a.jumpTo(c)
                })
            },
            stopOnHover: function() {
                var a = this;
                a.options.stopOnHover === !0 && a.browser.isTouch !== !0 && a.options.autoPlay !== !1 && (a.$elem.on("mouseover", function() {
                    a.stop()
                }), a.$elem.on("mouseout", function() {
                    "stop" !== a.hoverStatus && a.play()
                }))
            },
            lazyLoad: function() {
                var b, c, d, e, f, g = this;
                if (g.options.lazyLoad === !1) return !1;
                for (b = 0; b < g.itemsAmount; b += 1) c = a(g.$owlItems[b]), "loaded" !== c.data("owl-loaded") && (d = c.data("owl-item"), e = c.find(".lazyOwl"), "string" == typeof e.data("src") ? (void 0 === c.data("owl-loaded") && (e.hide(), c.addClass("loading").data("owl-loaded", "checked")), f = g.options.lazyFollow === !0 ? d >= g.currentItem : !0, f && d < g.currentItem + g.options.items && e.length && g.lazyPreload(c, e)) : c.data("owl-loaded", "loaded"))
            },
            lazyPreload: function(a, c) {
                function d() {
                    a.data("owl-loaded", "loaded").removeClass("loading"), c.removeAttr("data-src"), "fade" === g.options.lazyEffect ? c.fadeIn(400) : c.show(), "function" == typeof g.options.afterLazyLoad && g.options.afterLazyLoad.apply(this, [g.$elem])
                }

                function e() {
                    h += 1, g.completeImg(c.get(0)) || f === !0 ? d() : 100 >= h ? b.setTimeout(e, 100) : d()
                }
                var f, g = this,
                    h = 0;
                "DIV" === c.prop("tagName") ? (c.css("background-image", "url(" + c.data("src") + ")"), f = !0) : c[0].src = c.data("src"), e()
            },
            autoHeight: function() {
                function c() {
                    var c = a(f.$owlItems[f.currentItem]).height();
                    f.wrapperOuter.css("height", c + "px"), f.wrapperOuter.hasClass("autoHeight") || b.setTimeout(function() {
                        f.wrapperOuter.addClass("autoHeight")
                    }, 0)
                }

                function d() {
                    e += 1, f.completeImg(g.get(0)) ? c() : 100 >= e ? b.setTimeout(d, 100) : f.wrapperOuter.css("height", "")
                }
                var e, f = this,
                    g = a(f.$owlItems[f.currentItem]).find("img");
                void 0 !== g.get(0) ? (e = 0, d()) : c()
            },
            completeImg: function(a) {
                var b;
                return a.complete ? (b = typeof a.naturalWidth, "undefined" !== b && 0 === a.naturalWidth ? !1 : !0) : !1
            },
            onVisibleItems: function() {
                var b, c = this;
                for (c.options.addClassActive === !0 && c.$owlItems.removeClass("active"), c.visibleItems = [], b = c.currentItem; b < c.currentItem + c.options.items; b += 1) c.visibleItems.push(b), c.options.addClassActive === !0 && a(c.$owlItems[b]).addClass("active");
                c.owl.visibleItems = c.visibleItems
            },
            transitionTypes: function(a) {
                var b = this;
                b.outClass = "owl-" + a + "-out", b.inClass = "owl-" + a + "-in"
            },
            singleItemTransition: function() {
                function a(a) {
                    return {
                        position: "relative",
                        left: a + "px"
                    }
                }
                var b = this,
                    c = b.outClass,
                    d = b.inClass,
                    e = b.$owlItems.eq(b.currentItem),
                    f = b.$owlItems.eq(b.prevItem),
                    g = Math.abs(b.positionsInArray[b.currentItem]) + b.positionsInArray[b.prevItem],
                    h = Math.abs(b.positionsInArray[b.currentItem]) + b.itemWidth / 2,
                    i = "webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend";
                b.isTransition = !0, b.$owlWrapper.addClass("owl-origin").css({
                    "-webkit-transform-origin": h + "px",
                    "-moz-perspective-origin": h + "px",
                    "perspective-origin": h + "px"
                }), f.css(a(g, 10)).addClass(c).on(i, function() {
                    b.endPrev = !0, f.off(i), b.clearTransStyle(f, c)
                }), e.addClass(d).on(i, function() {
                    b.endCurrent = !0, e.off(i), b.clearTransStyle(e, d)
                })
            },
            clearTransStyle: function(a, b) {
                var c = this;
                a.css({
                    position: "",
                    left: ""
                }).removeClass(b), c.endPrev && c.endCurrent && (c.$owlWrapper.removeClass("owl-origin"), c.endPrev = !1, c.endCurrent = !1, c.isTransition = !1)
            },
            owlStatus: function() {
                var a = this;
                a.owl = {
                    userOptions: a.userOptions,
                    baseElement: a.$elem,
                    userItems: a.$userItems,
                    owlItems: a.$owlItems,
                    currentItem: a.currentItem,
                    prevItem: a.prevItem,
                    visibleItems: a.visibleItems,
                    isTouch: a.browser.isTouch,
                    browser: a.browser,
                    dragDirection: a.dragDirection
                }
            },
            clearEvents: function() {
                var d = this;
                d.$elem.off(".owl owl mousedown.disableTextSelect"), a(c).off(".owl owl"), a(b).off("resize", d.resizer)
            },
            unWrap: function() {
                var a = this;
                0 !== a.$elem.children().length && (a.$owlWrapper.unwrap(), a.$userItems.unwrap().unwrap(), a.owlControls && a.owlControls.remove()), a.clearEvents(), a.$elem.attr("style", a.$elem.data("owl-originalStyles") || "").attr("class", a.$elem.data("owl-originalClasses"))
            },
            destroy: function() {
                var a = this;
                a.stop(), b.clearInterval(a.checkVisible), a.unWrap(), a.$elem.removeData()
            },
            reinit: function(b) {
                var c = this,
                    d = a.extend({}, c.userOptions, b);
                c.unWrap(), c.init(d, c.$elem)
            },
            addItem: function(a, b) {
                var c, d = this;
                return a ? 0 === d.$elem.children().length ? (d.$elem.append(a), d.setVars(), !1) : (d.unWrap(), c = void 0 === b || -1 === b ? -1 : b, c >= d.$userItems.length || -1 === c ? d.$userItems.eq(-1).after(a) : d.$userItems.eq(c).before(a), void d.setVars()) : !1
            },
            removeItem: function(a) {
                var b, c = this;
                return 0 === c.$elem.children().length ? !1 : (b = void 0 === a || -1 === a ? -1 : a, c.unWrap(), c.$userItems.eq(b).remove(), void c.setVars())
            }
        };
        a.fn.owlCarousel = function(b) {
            return this.each(function() {
                if (a(this).data("owl-init") === !0) return !1;
                a(this).data("owl-init", !0);
                var c = Object.create(d);
                c.init(b, this), a.data(this, "owlCarousel", c)
            })
        }, a.fn.owlCarousel.options = {
            items: 5,
            itemsCustom: !1,
            itemsDesktop: [1199, 4],
            itemsDesktopSmall: [979, 3],
            itemsTablet: [768, 2],
            itemsTabletSmall: !1,
            itemsMobile: [479, 1],
            singleItem: !1,
            itemsScaleUp: !1,
            slideSpeed: 200,
            paginationSpeed: 800,
            rewindSpeed: 1e3,
            autoPlay: !1,
            stopOnHover: !1,
            navigation: !1,
            navigationText: ["prev", "next"],
            rewindNav: !0,
            scrollPerPage: !1,
            pagination: !0,
            paginationNumbers: !1,
            responsive: !0,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: b,
            baseClass: "owl-carousel",
            theme: "owl-theme",
            lazyLoad: !1,
            lazyFollow: !0,
            lazyEffect: "fade",
            autoHeight: !1,
            jsonPath: !1,
            jsonSuccess: !1,
            dragBeforeAnimFinish: !0,
            mouseDrag: !0,
            touchDrag: !0,
            addClassActive: !1,
            transitionStyle: !1,
            beforeUpdate: !1,
            afterUpdate: !1,
            beforeInit: !1,
            afterInit: !1,
            beforeMove: !1,
            afterMove: !1,
            afterAction: !1,
            startDragging: !1,
            afterLazyLoad: !1
        }
    }(jQuery, window, document),
    function(a, b) {
        function c() {
            return new Date(Date.UTC.apply(Date, arguments))
        }

        function d() {
            var a = new Date;
            return c(a.getFullYear(), a.getMonth(), a.getDate())
        }

        function e(a, b) {
            return a.getUTCFullYear() === b.getUTCFullYear() && a.getUTCMonth() === b.getUTCMonth() && a.getUTCDate() === b.getUTCDate()
        }

        function f(a) {
            return function() {
                return this[a].apply(this, arguments)
            }
        }

        function g(b, c) {
            function d(a, b) {
                return b.toLowerCase()
            }
            var e, f = a(b).data(),
                g = {},
                h = new RegExp("^" + c.toLowerCase() + "([A-Z])");
            c = new RegExp("^" + c.toLowerCase());
            for (var i in f) c.test(i) && (e = i.replace(h, d), g[e] = f[i]);
            return g
        }

        function h(b) {
            var c = {};
            if (p[b] || (b = b.split("-")[0], p[b])) {
                var d = p[b];
                return a.each(o, function(a, b) {
                    b in d && (c[b] = d[b])
                }), c
            }
        }
        var i = function() {
                var b = {
                    get: function(a) {
                        return this.slice(a)[0]
                    },
                    contains: function(a) {
                        for (var b = a && a.valueOf(), c = 0, d = this.length; d > c; c++)
                            if (this[c].valueOf() === b) return c;
                        return -1
                    },
                    remove: function(a) {
                        this.splice(a, 1)
                    },
                    replace: function(b) {
                        b && (a.isArray(b) || (b = [b]), this.clear(), this.push.apply(this, b))
                    },
                    clear: function() {
                        this.length = 0
                    },
                    copy: function() {
                        var a = new i;
                        return a.replace(this), a
                    }
                };
                return function() {
                    var c = [];
                    return c.push.apply(c, arguments), a.extend(c, b), c
                }
            }(),
            j = function(b, c) {
                this._process_options(c), this.dates = new i, this.viewDate = this.o.defaultViewDate, this.focusDate = null, this.element = a(b), this.isInline = !1, this.isInput = this.element.is("input"), this.component = this.element.hasClass("date") ? this.element.find(".add-on, .input-group-addon, .btn") : !1, this.hasInput = this.component && this.element.find("input").length, this.component && 0 === this.component.length && (this.component = !1), this.picker = a(q.template), this._buildEvents(), this._attachEvents(), this.isInline ? this.picker.addClass("datepicker-inline").appendTo(this.element) : this.picker.addClass("datepicker-dropdown dropdown-menu"), this.o.rtl && this.picker.addClass("datepicker-rtl"), this.viewMode = this.o.startView, this.o.calendarWeeks && this.picker.find("tfoot .today, tfoot .clear").attr("colspan", function(a, b) {
                    return parseInt(b) + 1
                }), this._allow_update = !1, this.setStartDate(this._o.startDate), this.setEndDate(this._o.endDate), this.setDaysOfWeekDisabled(this.o.daysOfWeekDisabled), this.setDatesDisabled(this.o.datesDisabled), this.fillDow(), this.fillMonths(), this._allow_update = !0, this.update(), this.showMode(), this.isInline && this.show()
            };
        j.prototype = {
            constructor: j,
            _process_options: function(e) {
                this._o = a.extend({}, this._o, e);
                var f = this.o = a.extend({}, this._o),
                    g = f.language;
                switch (p[g] || (g = g.split("-")[0], p[g] || (g = n.language)), f.language = g, f.startView) {
                    case 2:
                    case "decade":
                        f.startView = 2;
                        break;
                    case 1:
                    case "year":
                        f.startView = 1;
                        break;
                    default:
                        f.startView = 0
                }
                switch (f.minViewMode) {
                    case 1:
                    case "months":
                        f.minViewMode = 1;
                        break;
                    case 2:
                    case "years":
                        f.minViewMode = 2;
                        break;
                    default:
                        f.minViewMode = 0
                }
                f.startView = Math.max(f.startView, f.minViewMode), f.multidate !== !0 && (f.multidate = Number(f.multidate) || !1, f.multidate !== !1 && (f.multidate = Math.max(0, f.multidate))), f.multidateSeparator = String(f.multidateSeparator), f.weekStart %= 7, f.weekEnd = (f.weekStart + 6) % 7;
                var h = q.parseFormat(f.format);
                if (f.startDate !== -1 / 0 && (f.startDate = f.startDate ? f.startDate instanceof Date ? this._local_to_utc(this._zero_time(f.startDate)) : q.parseDate(f.startDate, h, f.language) : -1 / 0), 1 / 0 !== f.endDate && (f.endDate = f.endDate ? f.endDate instanceof Date ? this._local_to_utc(this._zero_time(f.endDate)) : q.parseDate(f.endDate, h, f.language) : 1 / 0), f.daysOfWeekDisabled = f.daysOfWeekDisabled || [], a.isArray(f.daysOfWeekDisabled) || (f.daysOfWeekDisabled = f.daysOfWeekDisabled.split(/[,\s]*/)), f.daysOfWeekDisabled = a.map(f.daysOfWeekDisabled, function(a) {
                        return parseInt(a, 10)
                    }), f.datesDisabled = f.datesDisabled || [], !a.isArray(f.datesDisabled)) {
                    var i = [];
                    i.push(q.parseDate(f.datesDisabled, h, f.language)), f.datesDisabled = i
                }
                f.datesDisabled = a.map(f.datesDisabled, function(a) {
                    return q.parseDate(a, h, f.language)
                });
                var j = String(f.orientation).toLowerCase().split(/\s+/g),
                    k = f.orientation.toLowerCase();
                if (j = a.grep(j, function(a) {
                        return /^auto|left|right|top|bottom$/.test(a)
                    }), f.orientation = {
                        x: "auto",
                        y: "auto"
                    }, k && "auto" !== k)
                    if (1 === j.length) switch (j[0]) {
                        case "top":
                        case "bottom":
                            f.orientation.y = j[0];
                            break;
                        case "left":
                        case "right":
                            f.orientation.x = j[0]
                    } else k = a.grep(j, function(a) {
                        return /^left|right$/.test(a)
                    }), f.orientation.x = k[0] || "auto", k = a.grep(j, function(a) {
                        return /^top|bottom$/.test(a)
                    }), f.orientation.y = k[0] || "auto";
                    else;
                if (f.defaultViewDate) {
                    var l = f.defaultViewDate.year || (new Date).getFullYear(),
                        m = f.defaultViewDate.month || 0,
                        o = f.defaultViewDate.day || 1;
                    f.defaultViewDate = c(l, m, o)
                } else f.defaultViewDate = d();
                f.showOnFocus = f.showOnFocus !== b ? f.showOnFocus : !0
            },
            _events: [],
            _secondaryEvents: [],
            _applyEvents: function(a) {
                for (var c, d, e, f = 0; f < a.length; f++) c = a[f][0], 2 === a[f].length ? (d = b, e = a[f][1]) : 3 === a[f].length && (d = a[f][1], e = a[f][2]), c.on(e, d)
            },
            _unapplyEvents: function(a) {
                for (var c, d, e, f = 0; f < a.length; f++) c = a[f][0], 2 === a[f].length ? (e = b, d = a[f][1]) : 3 === a[f].length && (e = a[f][1], d = a[f][2]), c.off(d, e)
            },
            _buildEvents: function() {
                var b = {
                    keyup: a.proxy(function(b) {
                        -1 === a.inArray(b.keyCode, [27, 37, 39, 38, 40, 32, 13, 9]) && this.update()
                    }, this),
                    keydown: a.proxy(this.keydown, this)
                };
                this.o.showOnFocus === !0 && (b.focus = a.proxy(this.show, this)), this.isInput ? this._events = [
                    [this.element, b]
                ] : this.component && this.hasInput ? this._events = [
                    [this.element.find("input"), b],
                    [this.component, {
                        click: a.proxy(this.show, this)
                    }]
                ] : this.element.is("div") ? this.isInline = !0 : this._events = [
                    [this.element, {
                        click: a.proxy(this.show, this)
                    }]
                ], this._events.push([this.element, "*", {
                    blur: a.proxy(function(a) {
                        this._focused_from = a.target
                    }, this)
                }], [this.element, {
                    blur: a.proxy(function(a) {
                        this._focused_from = a.target
                    }, this)
                }]), this._secondaryEvents = [
                    [this.picker, {
                        click: a.proxy(this.click, this)
                    }],
                    [a(window), {
                        resize: a.proxy(this.place, this)
                    }],
                    [a(document), {
                        "mousedown touchstart": a.proxy(function(a) {
                            this.element.is(a.target) || this.element.find(a.target).length || this.picker.is(a.target) || this.picker.find(a.target).length || this.hide()
                        }, this)
                    }]
                ]
            },
            _attachEvents: function() {
                this._detachEvents(), this._applyEvents(this._events)
            },
            _detachEvents: function() {
                this._unapplyEvents(this._events)
            },
            _attachSecondaryEvents: function() {
                this._detachSecondaryEvents(), this._applyEvents(this._secondaryEvents)
            },
            _detachSecondaryEvents: function() {
                this._unapplyEvents(this._secondaryEvents)
            },
            _trigger: function(b, c) {
                var d = c || this.dates.get(-1),
                    e = this._utc_to_local(d);
                this.element.trigger({
                    type: b,
                    date: e,
                    dates: a.map(this.dates, this._utc_to_local),
                    format: a.proxy(function(a, b) {
                        0 === arguments.length ? (a = this.dates.length - 1, b = this.o.format) : "string" == typeof a && (b = a, a = this.dates.length - 1), b = b || this.o.format;
                        var c = this.dates.get(a);
                        return q.formatDate(c, b, this.o.language)
                    }, this)
                })
            },
            show: function() {
                return this.element.attr("readonly") && this.o.enableOnReadonly === !1 ? void 0 : (this.isInline || this.picker.appendTo(this.o.container), this.place(), this.picker.show(), this._attachSecondaryEvents(), this._trigger("show"), (window.navigator.msMaxTouchPoints || "ontouchstart" in document) && this.o.disableTouchKeyboard && a(this.element).blur(), this)
            },
            hide: function() {
                return this.isInline ? this : this.picker.is(":visible") ? (this.focusDate = null, this.picker.hide().detach(), this._detachSecondaryEvents(), this.viewMode = this.o.startView, this.showMode(), this.o.forceParse && (this.isInput && this.element.val() || this.hasInput && this.element.find("input").val()) && this.setValue(), this._trigger("hide"), this) : this
            },
            remove: function() {
                return this.hide(), this._detachEvents(), this._detachSecondaryEvents(), this.picker.remove(), delete this.element.data().datepicker, this.isInput || delete this.element.data().date, this
            },
            _utc_to_local: function(a) {
                return a && new Date(a.getTime() + 6e4 * a.getTimezoneOffset())
            },
            _local_to_utc: function(a) {
                return a && new Date(a.getTime() - 6e4 * a.getTimezoneOffset())
            },
            _zero_time: function(a) {
                return a && new Date(a.getFullYear(), a.getMonth(), a.getDate())
            },
            _zero_utc_time: function(a) {
                return a && new Date(Date.UTC(a.getUTCFullYear(), a.getUTCMonth(), a.getUTCDate()))
            },
            getDates: function() {
                return a.map(this.dates, this._utc_to_local)
            },
            getUTCDates: function() {
                return a.map(this.dates, function(a) {
                    return new Date(a)
                })
            },
            getDate: function() {
                return this._utc_to_local(this.getUTCDate())
            },
            getUTCDate: function() {
                var a = this.dates.get(-1);
                return "undefined" != typeof a ? new Date(a) : null
            },
            clearDates: function() {
                var a;
                this.isInput ? a = this.element : this.component && (a = this.element.find("input")), a && a.val("").change(), this.update(), this._trigger("changeDate"), this.o.autoclose && this.hide()
            },
            setDates: function() {
                var b = a.isArray(arguments[0]) ? arguments[0] : arguments;
                return this.update.apply(this, b), this._trigger("changeDate"), this.setValue(), this
            },
            setUTCDates: function() {
                var b = a.isArray(arguments[0]) ? arguments[0] : arguments;
                return this.update.apply(this, a.map(b, this._utc_to_local)), this._trigger("changeDate"), this.setValue(), this
            },
            setDate: f("setDates"),
            setUTCDate: f("setUTCDates"),
            setValue: function() {
                var a = this.getFormattedDate();
                return this.isInput ? this.element.val(a).change() : this.component && this.element.find("input").val(a).change(), this
            },
            getFormattedDate: function(c) {
                c === b && (c = this.o.format);
                var d = this.o.language;
                return a.map(this.dates, function(a) {
                    return q.formatDate(a, c, d)
                }).join(this.o.multidateSeparator)
            },
            setStartDate: function(a) {
                return this._process_options({
                    startDate: a
                }), this.update(), this.updateNavArrows(), this
            },
            setEndDate: function(a) {
                return this._process_options({
                    endDate: a
                }), this.update(), this.updateNavArrows(), this
            },
            setDaysOfWeekDisabled: function(a) {
                return this._process_options({
                    daysOfWeekDisabled: a
                }), this.update(), this.updateNavArrows(), this
            },
            setDatesDisabled: function(a) {
                this._process_options({
                    datesDisabled: a
                }), this.update(), this.updateNavArrows()
            },
            place: function() {
                if (this.isInline) return this;
                var b = this.picker.outerWidth(),
                    c = this.picker.outerHeight(),
                    d = 10,
                    e = a(this.o.container).width(),
                    f = a(this.o.container).height(),
                    g = a(this.o.container).scrollTop(),
                    h = a(this.o.container).offset(),
                    i = [];
                this.element.parents().each(function() {
                    var b = a(this).css("z-index");
                    "auto" !== b && 0 !== b && i.push(parseInt(b))
                });
                var j = Math.max.apply(Math, i) + 10,
                    k = this.component ? this.component.parent().offset() : this.element.offset(),
                    l = this.component ? this.component.outerHeight(!0) : this.element.outerHeight(!1),
                    m = this.component ? this.component.outerWidth(!0) : this.element.outerWidth(!1),
                    n = k.left - h.left,
                    o = k.top - h.top;
                this.picker.removeClass("datepicker-orient-top datepicker-orient-bottom datepicker-orient-right datepicker-orient-left"), "auto" !== this.o.orientation.x ? (this.picker.addClass("datepicker-orient-" + this.o.orientation.x), "right" === this.o.orientation.x && (n -= b - m)) : k.left < 0 ? (this.picker.addClass("datepicker-orient-left"), n -= k.left - d) : n + b > e ? (this.picker.addClass("datepicker-orient-right"), n = k.left + m - b) : this.picker.addClass("datepicker-orient-left");
                var p, q, r = this.o.orientation.y;
                if ("auto" === r && (p = -g + o - c, q = g + f - (o + l + c), r = Math.max(p, q) === q ? "top" : "bottom"), this.picker.addClass("datepicker-orient-" + r), "top" === r ? o += l : o -= c + parseInt(this.picker.css("padding-top")), this.o.rtl) {
                    var s = e - (n + m);
                    this.picker.css({
                        top: o,
                        right: s,
                        zIndex: j
                    })
                } else this.picker.css({
                    top: o,
                    left: n,
                    zIndex: j
                });
                return this
            },
            _allow_update: !0,
            update: function() {
                if (!this._allow_update) return this;
                var b = this.dates.copy(),
                    c = [],
                    d = !1;
                return arguments.length ? (a.each(arguments, a.proxy(function(a, b) {
                    b instanceof Date && (b = this._local_to_utc(b)), c.push(b)
                }, this)), d = !0) : (c = this.isInput ? this.element.val() : this.element.data("date") || this.element.find("input").val(), c = c && this.o.multidate ? c.split(this.o.multidateSeparator) : [c], delete this.element.data().date), c = a.map(c, a.proxy(function(a) {
                    return q.parseDate(a, this.o.format, this.o.language)
                }, this)), c = a.grep(c, a.proxy(function(a) {
                    return a < this.o.startDate || a > this.o.endDate || !a
                }, this), !0), this.dates.replace(c), this.dates.length ? this.viewDate = new Date(this.dates.get(-1)) : this.viewDate < this.o.startDate ? this.viewDate = new Date(this.o.startDate) : this.viewDate > this.o.endDate && (this.viewDate = new Date(this.o.endDate)), d ? this.setValue() : c.length && String(b) !== String(this.dates) && this._trigger("changeDate"), !this.dates.length && b.length && this._trigger("clearDate"), this.fill(), this
            },
            fillDow: function() {
                var a = this.o.weekStart,
                    b = "<tr>";
                if (this.o.calendarWeeks) {
                    this.picker.find(".datepicker-days thead tr:first-child .datepicker-switch").attr("colspan", function(a, b) {
                        return parseInt(b) + 1
                    });
                    var c = '<th class="cw">&#160;</th>';
                    b += c
                }
                for (; a < this.o.weekStart + 7;) b += '<th class="dow">' + p[this.o.language].daysMin[a++ % 7] + "</th>";
                b += "</tr>", this.picker.find(".datepicker-days thead").append(b)
            },
            fillMonths: function() {
                for (var a = "", b = 0; 12 > b;) a += '<span class="month">' + p[this.o.language].monthsShort[b++] + "</span>";
                this.picker.find(".datepicker-months td").html(a)
            },
            setRange: function(b) {
                b && b.length ? this.range = a.map(b, function(a) {
                    return a.valueOf()
                }) : delete this.range, this.fill()
            },
            getClassNames: function(b) {
                var c = [],
                    d = this.viewDate.getUTCFullYear(),
                    f = this.viewDate.getUTCMonth(),
                    g = new Date;
                return b.getUTCFullYear() < d || b.getUTCFullYear() === d && b.getUTCMonth() < f ? c.push("old") : (b.getUTCFullYear() > d || b.getUTCFullYear() === d && b.getUTCMonth() > f) && c.push("new"), this.focusDate && b.valueOf() === this.focusDate.valueOf() && c.push("focused"), this.o.todayHighlight && b.getUTCFullYear() === g.getFullYear() && b.getUTCMonth() === g.getMonth() && b.getUTCDate() === g.getDate() && c.push("today"), -1 !== this.dates.contains(b) && c.push("active"), (b.valueOf() < this.o.startDate || b.valueOf() > this.o.endDate || -1 !== a.inArray(b.getUTCDay(), this.o.daysOfWeekDisabled)) && c.push("disabled"), this.o.datesDisabled.length > 0 && a.grep(this.o.datesDisabled, function(a) {
                    return e(b, a)
                }).length > 0 && c.push("disabled", "disabled-date"), this.range && (b > this.range[0] && b < this.range[this.range.length - 1] && c.push("range"), -1 !== a.inArray(b.valueOf(), this.range) && c.push("selected")), c
            },
            fill: function() {
                var d, e = new Date(this.viewDate),
                    f = e.getUTCFullYear(),
                    g = e.getUTCMonth(),
                    h = this.o.startDate !== -1 / 0 ? this.o.startDate.getUTCFullYear() : -1 / 0,
                    i = this.o.startDate !== -1 / 0 ? this.o.startDate.getUTCMonth() : -1 / 0,
                    j = 1 / 0 !== this.o.endDate ? this.o.endDate.getUTCFullYear() : 1 / 0,
                    k = 1 / 0 !== this.o.endDate ? this.o.endDate.getUTCMonth() : 1 / 0,
                    l = p[this.o.language].today || p.en.today || "",
                    m = p[this.o.language].clear || p.en.clear || "";
                if (!isNaN(f) && !isNaN(g)) {
                    this.picker.find(".datepicker-days thead .datepicker-switch").text(p[this.o.language].months[g] + " " + f), this.picker.find("tfoot .today").text(l).toggle(this.o.todayBtn !== !1), this.picker.find("tfoot .clear").text(m).toggle(this.o.clearBtn !== !1), this.updateNavArrows(), this.fillMonths();
                    var n = c(f, g - 1, 28),
                        o = q.getDaysInMonth(n.getUTCFullYear(), n.getUTCMonth());
                    n.setUTCDate(o), n.setUTCDate(o - (n.getUTCDay() - this.o.weekStart + 7) % 7);
                    var r = new Date(n);
                    r.setUTCDate(r.getUTCDate() + 42), r = r.valueOf();
                    for (var s, t = []; n.valueOf() < r;) {
                        if (n.getUTCDay() === this.o.weekStart && (t.push("<tr>"), this.o.calendarWeeks)) {
                            var u = new Date(+n + (this.o.weekStart - n.getUTCDay() - 7) % 7 * 864e5),
                                v = new Date(Number(u) + (11 - u.getUTCDay()) % 7 * 864e5),
                                w = new Date(Number(w = c(v.getUTCFullYear(), 0, 1)) + (11 - w.getUTCDay()) % 7 * 864e5),
                                x = (v - w) / 864e5 / 7 + 1;
                            t.push('<td class="cw">' + x + "</td>")
                        }
                        if (s = this.getClassNames(n), s.push("day"), this.o.beforeShowDay !== a.noop) {
                            var y = this.o.beforeShowDay(this._utc_to_local(n));
                            y === b ? y = {} : "boolean" == typeof y ? y = {
                                enabled: y
                            } : "string" == typeof y && (y = {
                                classes: y
                            }), y.enabled === !1 && s.push("disabled"), y.classes && (s = s.concat(y.classes.split(/\s+/))), y.tooltip && (d = y.tooltip)
                        }
                        s = a.unique(s), t.push('<td class="' + s.join(" ") + '"' + (d ? ' title="' + d + '"' : "") + ">" + n.getUTCDate() + "</td>"), d = null, n.getUTCDay() === this.o.weekEnd && t.push("</tr>"), n.setUTCDate(n.getUTCDate() + 1)
                    }
                    this.picker.find(".datepicker-days tbody").empty().append(t.join(""));
                    var z = this.picker.find(".datepicker-months").find("th:eq(1)").text(f).end().find("span").removeClass("active");
                    if (a.each(this.dates, function(a, b) {
                            b.getUTCFullYear() === f && z.eq(b.getUTCMonth()).addClass("active")
                        }), (h > f || f > j) && z.addClass("disabled"), f === h && z.slice(0, i).addClass("disabled"), f === j && z.slice(k + 1).addClass("disabled"), this.o.beforeShowMonth !== a.noop) {
                        var A = this;
                        a.each(z, function(b, c) {
                            if (!a(c).hasClass("disabled")) {
                                var d = new Date(f, b, 1),
                                    e = A.o.beforeShowMonth(d);
                                e === !1 && a(c).addClass("disabled")
                            }
                        })
                    }
                    t = "", f = 10 * parseInt(f / 10, 10);
                    var B = this.picker.find(".datepicker-years").find("th:eq(1)").text(f + "-" + (f + 9)).end().find("td");
                    f -= 1;
                    for (var C, D = a.map(this.dates, function(a) {
                            return a.getUTCFullYear()
                        }), E = -1; 11 > E; E++) C = ["year"], -1 === E ? C.push("old") : 10 === E && C.push("new"), -1 !== a.inArray(f, D) && C.push("active"), (h > f || f > j) && C.push("disabled"), t += '<span class="' + C.join(" ") + '">' + f + "</span>", f += 1;
                    B.html(t)
                }
            },
            updateNavArrows: function() {
                if (this._allow_update) {
                    var a = new Date(this.viewDate),
                        b = a.getUTCFullYear(),
                        c = a.getUTCMonth();
                    switch (this.viewMode) {
                        case 0:
                            this.picker.find(".prev").css(this.o.startDate !== -1 / 0 && b <= this.o.startDate.getUTCFullYear() && c <= this.o.startDate.getUTCMonth() ? {
                                visibility: "hidden"
                            } : {
                                visibility: "visible"
                            }), this.picker.find(".next").css(1 / 0 !== this.o.endDate && b >= this.o.endDate.getUTCFullYear() && c >= this.o.endDate.getUTCMonth() ? {
                                visibility: "hidden"
                            } : {
                                visibility: "visible"
                            });
                            break;
                        case 1:
                        case 2:
                            this.picker.find(".prev").css(this.o.startDate !== -1 / 0 && b <= this.o.startDate.getUTCFullYear() ? {
                                visibility: "hidden"
                            } : {
                                visibility: "visible"
                            }), this.picker.find(".next").css(1 / 0 !== this.o.endDate && b >= this.o.endDate.getUTCFullYear() ? {
                                visibility: "hidden"
                            } : {
                                visibility: "visible"
                            })
                    }
                }
            },
            click: function(b) {
                b.preventDefault();
                var d, e, f, g = a(b.target).closest("span, td, th");
                if (1 === g.length) switch (g[0].nodeName.toLowerCase()) {
                    case "th":
                        switch (g[0].className) {
                            case "datepicker-switch":
                                this.showMode(1);
                                break;
                            case "prev":
                            case "next":
                                var h = q.modes[this.viewMode].navStep * ("prev" === g[0].className ? -1 : 1);
                                switch (this.viewMode) {
                                    case 0:
                                        this.viewDate = this.moveMonth(this.viewDate, h), this._trigger("changeMonth", this.viewDate);
                                        break;
                                    case 1:
                                    case 2:
                                        this.viewDate = this.moveYear(this.viewDate, h), 1 === this.viewMode && this._trigger("changeYear", this.viewDate)
                                }
                                this.fill();
                                break;
                            case "today":
                                var i = new Date;
                                i = c(i.getFullYear(), i.getMonth(), i.getDate(), 0, 0, 0), this.showMode(-2);
                                var j = "linked" === this.o.todayBtn ? null : "view";
                                this._setDate(i, j);
                                break;
                            case "clear":
                                this.clearDates()
                        }
                        break;
                    case "span":
                        g.hasClass("disabled") || (this.viewDate.setUTCDate(1), g.hasClass("month") ? (f = 1, e = g.parent().find("span").index(g), d = this.viewDate.getUTCFullYear(), this.viewDate.setUTCMonth(e), this._trigger("changeMonth", this.viewDate), 1 === this.o.minViewMode && this._setDate(c(d, e, f))) : (f = 1, e = 0, d = parseInt(g.text(), 10) || 0, this.viewDate.setUTCFullYear(d), this._trigger("changeYear", this.viewDate), 2 === this.o.minViewMode && this._setDate(c(d, e, f))), this.showMode(-1), this.fill());
                        break;
                    case "td":
                        g.hasClass("day") && !g.hasClass("disabled") && (f = parseInt(g.text(), 10) || 1, d = this.viewDate.getUTCFullYear(), e = this.viewDate.getUTCMonth(), g.hasClass("old") ? 0 === e ? (e = 11, d -= 1) : e -= 1 : g.hasClass("new") && (11 === e ? (e = 0, d += 1) : e += 1), this._setDate(c(d, e, f)))
                }
                this.picker.is(":visible") && this._focused_from && a(this._focused_from).focus(), delete this._focused_from
            },
            _toggle_multidate: function(a) {
                var b = this.dates.contains(a);
                if (a || this.dates.clear(), -1 !== b ? (this.o.multidate === !0 || this.o.multidate > 1 || this.o.toggleActive) && this.dates.remove(b) : this.o.multidate === !1 ? (this.dates.clear(), this.dates.push(a)) : this.dates.push(a), "number" == typeof this.o.multidate)
                    for (; this.dates.length > this.o.multidate;) this.dates.remove(0)
            },
            _setDate: function(a, b) {
                b && "date" !== b || this._toggle_multidate(a && new Date(a)), b && "view" !== b || (this.viewDate = a && new Date(a)), this.fill(), this.setValue(), b && "view" === b || this._trigger("changeDate");
                var c;
                this.isInput ? c = this.element : this.component && (c = this.element.find("input")), c && c.change(), !this.o.autoclose || b && "date" !== b || this.hide()
            },
            moveMonth: function(a, c) {
                if (!a) return b;
                if (!c) return a;
                var d, e, f = new Date(a.valueOf()),
                    g = f.getUTCDate(),
                    h = f.getUTCMonth(),
                    i = Math.abs(c);
                if (c = c > 0 ? 1 : -1, 1 === i) e = -1 === c ? function() {
                    return f.getUTCMonth() === h
                } : function() {
                    return f.getUTCMonth() !== d
                }, d = h + c, f.setUTCMonth(d), (0 > d || d > 11) && (d = (d + 12) % 12);
                else {
                    for (var j = 0; i > j; j++) f = this.moveMonth(f, c);
                    d = f.getUTCMonth(), f.setUTCDate(g), e = function() {
                        return d !== f.getUTCMonth()
                    }
                }
                for (; e();) f.setUTCDate(--g), f.setUTCMonth(d);
                return f
            },
            moveYear: function(a, b) {
                return this.moveMonth(a, 12 * b)
            },
            dateWithinRange: function(a) {
                return a >= this.o.startDate && a <= this.o.endDate
            },
            keydown: function(a) {
                if (!this.picker.is(":visible")) return void(27 === a.keyCode && this.show());
                var b, c, e, f = !1,
                    g = this.focusDate || this.viewDate;
                switch (a.keyCode) {
                    case 27:
                        this.focusDate ? (this.focusDate = null, this.viewDate = this.dates.get(-1) || this.viewDate, this.fill()) : this.hide(), a.preventDefault();
                        break;
                    case 37:
                    case 39:
                        if (!this.o.keyboardNavigation) break;
                        b = 37 === a.keyCode ? -1 : 1, a.ctrlKey ? (c = this.moveYear(this.dates.get(-1) || d(), b), e = this.moveYear(g, b), this._trigger("changeYear", this.viewDate)) : a.shiftKey ? (c = this.moveMonth(this.dates.get(-1) || d(), b), e = this.moveMonth(g, b), this._trigger("changeMonth", this.viewDate)) : (c = new Date(this.dates.get(-1) || d()), c.setUTCDate(c.getUTCDate() + b), e = new Date(g), e.setUTCDate(g.getUTCDate() + b)), this.dateWithinRange(e) && (this.focusDate = this.viewDate = e, this.setValue(), this.fill(), a.preventDefault());
                        break;
                    case 38:
                    case 40:
                        if (!this.o.keyboardNavigation) break;
                        b = 38 === a.keyCode ? -1 : 1, a.ctrlKey ? (c = this.moveYear(this.dates.get(-1) || d(), b), e = this.moveYear(g, b), this._trigger("changeYear", this.viewDate)) : a.shiftKey ? (c = this.moveMonth(this.dates.get(-1) || d(), b), e = this.moveMonth(g, b), this._trigger("changeMonth", this.viewDate)) : (c = new Date(this.dates.get(-1) || d()), c.setUTCDate(c.getUTCDate() + 7 * b), e = new Date(g), e.setUTCDate(g.getUTCDate() + 7 * b)), this.dateWithinRange(e) && (this.focusDate = this.viewDate = e, this.setValue(), this.fill(), a.preventDefault());
                        break;
                    case 32:
                        break;
                    case 13:
                        g = this.focusDate || this.dates.get(-1) || this.viewDate, this.o.keyboardNavigation && (this._toggle_multidate(g), f = !0), this.focusDate = null, this.viewDate = this.dates.get(-1) || this.viewDate, this.setValue(), this.fill(), this.picker.is(":visible") && (a.preventDefault(), "function" == typeof a.stopPropagation ? a.stopPropagation() : a.cancelBubble = !0, this.o.autoclose && this.hide());
                        break;
                    case 9:
                        this.focusDate = null, this.viewDate = this.dates.get(-1) || this.viewDate, this.fill(), this.hide()
                }
                if (f) {
                    this._trigger(this.dates.length ? "changeDate" : "clearDate");
                    var h;
                    this.isInput ? h = this.element : this.component && (h = this.element.find("input")), h && h.change()
                }
            },
            showMode: function(a) {
                a && (this.viewMode = Math.max(this.o.minViewMode, Math.min(2, this.viewMode + a))), this.picker.children("div").hide().filter(".datepicker-" + q.modes[this.viewMode].clsName).css("display", "block"), this.updateNavArrows()
            }
        };
        var k = function(b, c) {
            this.element = a(b), this.inputs = a.map(c.inputs, function(a) {
                return a.jquery ? a[0] : a
            }), delete c.inputs, m.call(a(this.inputs), c).bind("changeDate", a.proxy(this.dateUpdated, this)), this.pickers = a.map(this.inputs, function(b) {
                return a(b).data("datepicker")
            }), this.updateDates()
        };
        k.prototype = {
            updateDates: function() {
                this.dates = a.map(this.pickers, function(a) {
                    return a.getUTCDate()
                }), this.updateRanges()
            },
            updateRanges: function() {
                var b = a.map(this.dates, function(a) {
                    return a.valueOf()
                });
                a.each(this.pickers, function(a, c) {
                    c.setRange(b)
                })
            },
            dateUpdated: function(b) {
                if (!this.updating) {
                    this.updating = !0;
                    var c = a(b.target).data("datepicker"),
                        d = c.getUTCDate(),
                        e = a.inArray(b.target, this.inputs),
                        f = e - 1,
                        g = e + 1,
                        h = this.inputs.length;
                    if (-1 !== e) {
                        if (a.each(this.pickers, function(a, b) {
                                b.getUTCDate() || b.setUTCDate(d)
                            }), d < this.dates[f])
                            for (; f >= 0 && d < this.dates[f];) this.pickers[f--].setUTCDate(d);
                        else if (d > this.dates[g])
                            for (; h > g && d > this.dates[g];) this.pickers[g++].setUTCDate(d);
                        this.updateDates(), delete this.updating
                    }
                }
            },
            remove: function() {
                a.map(this.pickers, function(a) {
                    a.remove()
                }), delete this.element.data().datepicker
            }
        };
        var l = a.fn.datepicker,
            m = function(c) {
                var d = Array.apply(null, arguments);
                d.shift();
                var e;
                return this.each(function() {
                    var f = a(this),
                        i = f.data("datepicker"),
                        l = "object" == typeof c && c;
                    if (!i) {
                        var m = g(this, "date"),
                            o = a.extend({}, n, m, l),
                            p = h(o.language),
                            q = a.extend({}, n, p, m, l);
                        if (f.hasClass("input-daterange") || q.inputs) {
                            var r = {
                                inputs: q.inputs || f.find("input").toArray()
                            };
                            f.data("datepicker", i = new k(this, a.extend(q, r)))
                        } else f.data("datepicker", i = new j(this, q))
                    }
                    return "string" == typeof c && "function" == typeof i[c] && (e = i[c].apply(i, d), e !== b) ? !1 : void 0
                }), e !== b ? e : this
            };
        a.fn.datepicker = m;
        var n = a.fn.datepicker.defaults = {
                autoclose: !1,
                beforeShowDay: a.noop,
                beforeShowMonth: a.noop,
                calendarWeeks: !1,
                clearBtn: !1,
                toggleActive: !1,
                daysOfWeekDisabled: [],
                datesDisabled: [],
                endDate: 1 / 0,
                forceParse: !0,
                format: "mm/dd/yyyy",
                keyboardNavigation: !0,
                language: "en",
                minViewMode: 0,
                multidate: !1,
                multidateSeparator: ",",
                orientation: "auto",
                rtl: !1,
                startDate: -1 / 0,
                startView: 0,
                todayBtn: !1,
                todayHighlight: !1,
                weekStart: 0,
                disableTouchKeyboard: !1,
                enableOnReadonly: !0,
                container: "body"
            },
            o = a.fn.datepicker.locale_opts = ["format", "rtl", "weekStart"];
        a.fn.datepicker.Constructor = j;
        var p = a.fn.datepicker.dates = {
                en: {
                    days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
                    daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    daysMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"],
                    months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                    monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    today: "Today",
                    clear: "Clear"
                }
            },
            q = {
                modes: [{
                    clsName: "days",
                    navFnc: "Month",
                    navStep: 1
                }, {
                    clsName: "months",
                    navFnc: "FullYear",
                    navStep: 1
                }, {
                    clsName: "years",
                    navFnc: "FullYear",
                    navStep: 10
                }],
                isLeapYear: function(a) {
                    return a % 4 === 0 && a % 100 !== 0 || a % 400 === 0
                },
                getDaysInMonth: function(a, b) {
                    return [31, q.isLeapYear(a) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][b]
                },
                validParts: /dd?|DD?|mm?|MM?|yy(?:yy)?/g,
                nonpunctuation: /[^ -\/:-@\[\u3400-\u9fff-`{-~\t\n\r]+/g,
                parseFormat: function(a) {
                    var b = a.replace(this.validParts, "\x00").split("\x00"),
                        c = a.match(this.validParts);
                    if (!b || !b.length || !c || 0 === c.length) throw new Error("Invalid date format.");
                    return {
                        separators: b,
                        parts: c
                    }
                },
                parseDate: function(d, e, f) {
                    function g() {
                        var a = this.slice(0, m[k].length),
                            b = m[k].slice(0, a.length);
                        return a.toLowerCase() === b.toLowerCase()
                    }
                    if (!d) return b;
                    if (d instanceof Date) return d;
                    "string" == typeof e && (e = q.parseFormat(e));
                    var h, i, k, l = /([\-+]\d+)([dmwy])/,
                        m = d.match(/([\-+]\d+)([dmwy])/g);
                    if (/^[\-+]\d+[dmwy]([\s,]+[\-+]\d+[dmwy])*$/.test(d)) {
                        for (d = new Date, k = 0; k < m.length; k++) switch (h = l.exec(m[k]), i = parseInt(h[1]), h[2]) {
                            case "d":
                                d.setUTCDate(d.getUTCDate() + i);
                                break;
                            case "m":
                                d = j.prototype.moveMonth.call(j.prototype, d, i);
                                break;
                            case "w":
                                d.setUTCDate(d.getUTCDate() + 7 * i);
                                break;
                            case "y":
                                d = j.prototype.moveYear.call(j.prototype, d, i)
                        }
                        return c(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate(), 0, 0, 0)
                    }
                    m = d && d.match(this.nonpunctuation) || [], d = new Date;
                    var n, o, r = {},
                        s = ["yyyy", "yy", "M", "MM", "m", "mm", "d", "dd"],
                        t = {
                            yyyy: function(a, b) {
                                return a.setUTCFullYear(b)
                            },
                            yy: function(a, b) {
                                return a.setUTCFullYear(2e3 + b)
                            },
                            m: function(a, b) {
                                if (isNaN(a)) return a;
                                for (b -= 1; 0 > b;) b += 12;
                                for (b %= 12, a.setUTCMonth(b); a.getUTCMonth() !== b;) a.setUTCDate(a.getUTCDate() - 1);
                                return a
                            },
                            d: function(a, b) {
                                return a.setUTCDate(b)
                            }
                        };
                    t.M = t.MM = t.mm = t.m, t.dd = t.d, d = c(d.getFullYear(), d.getMonth(), d.getDate(), 0, 0, 0);
                    var u = e.parts.slice();
                    if (m.length !== u.length && (u = a(u).filter(function(b, c) {
                            return -1 !== a.inArray(c, s)
                        }).toArray()), m.length === u.length) {
                        var v;
                        for (k = 0, v = u.length; v > k; k++) {
                            if (n = parseInt(m[k], 10), h = u[k], isNaN(n)) switch (h) {
                                case "MM":
                                    o = a(p[f].months).filter(g), n = a.inArray(o[0], p[f].months) + 1;
                                    break;
                                case "M":
                                    o = a(p[f].monthsShort).filter(g), n = a.inArray(o[0], p[f].monthsShort) + 1
                            }
                            r[h] = n
                        }
                        var w, x;
                        for (k = 0; k < s.length; k++) x = s[k], x in r && !isNaN(r[x]) && (w = new Date(d), t[x](w, r[x]), isNaN(w) || (d = w))
                    }
                    return d
                },
                formatDate: function(b, c, d) {
                    if (!b) return "";
                    "string" == typeof c && (c = q.parseFormat(c));
                    var e = {
                        d: b.getUTCDate(),
                        D: p[d].daysShort[b.getUTCDay()],
                        DD: p[d].days[b.getUTCDay()],
                        m: b.getUTCMonth() + 1,
                        M: p[d].monthsShort[b.getUTCMonth()],
                        MM: p[d].months[b.getUTCMonth()],
                        yy: b.getUTCFullYear().toString().substring(2),
                        yyyy: b.getUTCFullYear()
                    };
                    e.dd = (e.d < 10 ? "0" : "") + e.d, e.mm = (e.m < 10 ? "0" : "") + e.m, b = [];
                    for (var f = a.extend([], c.separators), g = 0, h = c.parts.length; h >= g; g++) f.length && b.push(f.shift()), b.push(e[c.parts[g]]);
                    return b.join("")
                },
                headTemplate: '<thead><tr><th class="prev">&#171;</th><th colspan="5" class="datepicker-switch"></th><th class="next">&#187;</th></tr></thead>',
                contTemplate: '<tbody><tr><td colspan="7"></td></tr></tbody>',
                footTemplate: '<tfoot><tr><th colspan="7" class="today"></th></tr><tr><th colspan="7" class="clear"></th></tr></tfoot>'
            };
        q.template = '<div class="datepicker"><div class="datepicker-days"><table class=" table-condensed">' + q.headTemplate + "<tbody></tbody>" + q.footTemplate + '</table></div><div class="datepicker-months"><table class="table-condensed">' + q.headTemplate + q.contTemplate + q.footTemplate + '</table></div><div class="datepicker-years"><table class="table-condensed">' + q.headTemplate + q.contTemplate + q.footTemplate + "</table></div></div>", a.fn.datepicker.DPGlobal = q, a.fn.datepicker.noConflict = function() {
            return a.fn.datepicker = l, this
        }, a.fn.datepicker.version = "1.4.0", a(document).on("focus.datepicker.data-api click.datepicker.data-api", '[data-provide="datepicker"]', function(b) {
            var c = a(this);
            c.data("datepicker") || (b.preventDefault(), m.call(c, "show"))
        }), a(function() {
            m.call(a('[data-provide="datepicker-inline"]'))
        })
    }(window.jQuery),
    function(a) {
        a.fn.datepicker.dates.es = {
            days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
            daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"],
            daysMin: ["D", "L", "M", "X", "J", "V", "S", "D"],
            months: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
            monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
            today: "Hoy",
            clear: "Borrar",
            weekStart: 1,
            format: "dd/mm/yyyy"
        }
    }(jQuery),
    function(a) {
        var b, c, d, e, f, g, h, j, k, l, m;
        if (c = !!document.createElement("canvas").getContext, b = function() {
                var a = document.createElement("div");
                a.innerHTML = '<v:shape id="vml_flag1" adj="1" />';
                var b = a.firstChild;
                return b.style.behavior = "url(#default#VML)", b ? "object" == typeof b.adj : !0
            }(), !c && !b) return void(a.fn.maphilight = function() {
            return this
        });
        if (c) {
            j = function(a) {
                return Math.max(0, Math.min(parseInt(a, 16), 255))
            }, k = function(a, b) {
                return "rgba(" + j(a.substr(0, 2)) + "," + j(a.substr(2, 2)) + "," + j(a.substr(4, 2)) + "," + b + ")"
            }, d = function(b) {
                var c = a('<canvas style="width:' + b.width + "px;height:" + b.height + 'px;"></canvas>').get(0);
                return c.getContext("2d").clearRect(0, 0, c.width, c.height), c
            };
            var n = function(a, b, c, d, e) {
                if (d = d || 0, e = e || 0, a.beginPath(), "rect" == b) a.rect(c[0] + d, c[1] + e, c[2] - c[0], c[3] - c[1]);
                else if ("poly" == b)
                    for (a.moveTo(c[0] + d, c[1] + e), i = 2; i < c.length; i += 2) a.lineTo(c[i] + d, c[i + 1] + e);
                else "circ" == b && a.arc(c[0] + d, c[1] + e, c[2], 0, 2 * Math.PI, !1);
                a.closePath()
            };
            e = function(b, c, d, e) {
                var f = b.getContext("2d");
                if (e.shadow) {
                    f.save(), "inside" == e.shadowPosition && (n(f, c, d), f.clip());
                    var g = 100 * b.width,
                        h = 100 * b.height;
                    n(f, c, d, g, h), f.shadowOffsetX = e.shadowX - g, f.shadowOffsetY = e.shadowY - h, f.shadowBlur = e.shadowRadius, f.shadowColor = k(e.shadowColor, e.shadowOpacity);
                    var i = e.shadowFrom;
                    i || (i = "outside" == e.shadowPosition ? "fill" : "stroke"), "stroke" == i ? (f.strokeStyle = "rgba(0,0,0,1)", f.stroke()) : "fill" == i && (f.fillStyle = "rgba(0,0,0,1)", f.fill()), f.restore(), "outside" == e.shadowPosition && (f.save(), n(f, c, d), f.globalCompositeOperation = "destination-out", f.fillStyle = "rgba(0,0,0,1);", f.fill(), f.restore())
                }
                f.save(), n(f, c, d), e.fill && (f.fillStyle = k(e.fillColor, e.fillOpacity), f.fill()), e.stroke && (f.strokeStyle = k(e.strokeColor, e.strokeOpacity), f.lineWidth = e.strokeWidth, f.stroke()), f.restore(), e.fade && a(b).css("opacity", 0).animate({
                    opacity: 1
                }, 100)
            }, f = function(a) {
                a.getContext("2d").clearRect(0, 0, a.width, a.height)
            }
        } else d = function(b) {
            return a('<var style="zoom:1;overflow:hidden;display:block;width:' + b.width + "px;height:" + b.height + 'px;"></var>').get(0)
        }, e = function(b, c, d, e, f) {
            var g, h, i, j;
            for (var k in d) d[k] = parseInt(d[k], 10);
            g = '<v:fill color="#' + e.fillColor + '" opacity="' + (e.fill ? e.fillOpacity : 0) + '" />', h = e.stroke ? 'strokeweight="' + e.strokeWidth + '" stroked="t" strokecolor="#' + e.strokeColor + '"' : 'stroked="f"', i = '<v:stroke opacity="' + e.strokeOpacity + '"/>', "rect" == c ? j = a('<v:rect name="' + f + '" filled="t" ' + h + ' style="zoom:1;margin:0;padding:0;display:block;position:absolute;left:' + d[0] + "px;top:" + d[1] + "px;width:" + (d[2] - d[0]) + "px;height:" + (d[3] - d[1]) + 'px;"></v:rect>') : "poly" == c ? j = a('<v:shape name="' + f + '" filled="t" ' + h + ' coordorigin="0,0" coordsize="' + b.width + "," + b.height + '" path="m ' + d[0] + "," + d[1] + " l " + d.join(",") + ' x e" style="zoom:1;margin:0;padding:0;display:block;position:absolute;top:0px;left:0px;width:' + b.width + "px;height:" + b.height + 'px;"></v:shape>') : "circ" == c && (j = a('<v:oval name="' + f + '" filled="t" ' + h + ' style="zoom:1;margin:0;padding:0;display:block;position:absolute;left:' + (d[0] - d[2]) + "px;top:" + (d[1] - d[2]) + "px;width:" + 2 * d[2] + "px;height:" + 2 * d[2] + 'px;"></v:oval>')), j.get(0).innerHTML = g + i, a(b).append(j)
        }, f = function(b) {
            var c = a("<div>" + b.innerHTML + "</div>");
            c.children("[name=highlighted]").remove(), b.innerHTML = c.html()
        };
        g = function(a) {
            var b, c = a.getAttribute("coords").split(",");
            for (b = 0; b < c.length; b++) c[b] = parseFloat(c[b]);
            return [a.getAttribute("shape").toLowerCase().substr(0, 4), c]
        }, m = function(b, c) {
            var d = a(b);
            return a.extend({}, c, a.metadata ? d.metadata() : !1, d.data("maphilight"))
        }, l = function(a) {
            return a.complete ? "undefined" != typeof a.naturalWidth && 0 === a.naturalWidth ? !1 : !0 : !1
        }, h = {
            position: "absolute",
            left: 0,
            top: 0,
            padding: 0,
            border: 0
        };
        var o = !1;
        a.fn.maphilight = function(i) {
            return i = a.extend({}, a.fn.maphilight.defaults, i), c || o || (a(window).ready(function() {
                document.namespaces.add("v", "urn:schemas-microsoft-com:vml");
                var b = document.createStyleSheet(),
                    c = ["shape", "rect", "oval", "circ", "fill", "stroke", "imagedata", "group", "textbox"];
                a.each(c, function() {
                    b.addRule("v\\:" + this, "behavior: url(#default#VML); antialias:true")
                })
            }), o = !0), this.each(function() {
                var j, k, n, o, p, q, r, s;
                if (j = a(this), !l(this)) return window.setTimeout(function() {
                    j.maphilight(i)
                }, 200);
                if (n = a.extend({}, i, a.metadata ? j.metadata() : !1, j.data("maphilight")), s = j.get(0).getAttribute("usemap"), s && (o = a('map[name="' + s.substr(1) + '"]'), j.is('img,input[type="image"]') && s && o.size() > 0)) {
                    if (j.hasClass("maphilighted")) {
                        var t = j.parent();
                        j.insertBefore(t), t.remove(), a(o).unbind(".maphilight").find("area[coords]").unbind(".maphilight")
                    }
                    k = a("<div></div>").css({
                        display: "block",
                        background: 'url("' + this.src + '")',
                        position: "relative",
                        padding: 0,
                        width: this.width,
                        height: this.height
                    }), n.wrapClass && k.addClass(n.wrapClass === !0 ? a(this).attr("class") : n.wrapClass), j.before(k).css("opacity", 0).css(h).remove(), b && j.css("filter", "Alpha(opacity=0)"), k.append(j), p = d(this), a(p).css(h), p.height = this.height, p.width = this.width, r = function() {
                        var b, d;
                        if (d = m(this, n), !d.neverOn && !d.alwaysOn) {
                            if (b = g(this), e(p, b[0], b[1], d, "highlighted"), d.groupBy) {
                                var f;
                                f = o.find(/^[a-zA-Z][\-a-zA-Z]+$/.test(d.groupBy) ? "area[" + d.groupBy + '="' + a(this).attr(d.groupBy) + '"]' : d.groupBy);
                                var h = this;
                                f.each(function() {
                                    if (this != h) {
                                        var a = m(this, n);
                                        if (!a.neverOn && !a.alwaysOn) {
                                            var b = g(this);
                                            e(p, b[0], b[1], a, "highlighted")
                                        }
                                    }
                                })
                            }
                            c || a(p).append("<v:rect></v:rect>")
                        }
                    }, a(o).bind("alwaysOn.maphilight", function() {
                        q && f(q), c || a(p).empty(), a(o).find("area[coords]").each(function() {
                            var b, f;
                            f = m(this, n), f.alwaysOn && (!q && c && (q = d(j[0]), a(q).css(h), q.width = j[0].width, q.height = j[0].height, j.before(q)), f.fade = f.alwaysOnFade, b = g(this), c ? e(q, b[0], b[1], f, "") : e(p, b[0], b[1], f, ""))
                        })
                    }), a(o).trigger("alwaysOn.maphilight").find("area[coords]").bind("mouseover.maphilight", r).bind("mouseout.maphilight", function() {
                        f(p)
                    }), j.before(p), j.addClass("maphilighted")
                }
            })
        }, a.fn.maphilight.defaults = {
            fill: !0,
            fillColor: "000000",
            fillOpacity: .2,
            stroke: !0,
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
        }
    }(jQuery), ! function(a) {
        var b = function() {
                "use strict";
                return {
                    isMsie: function() {
                        return /(msie|trident)/i.test(navigator.userAgent) ? navigator.userAgent.match(/(msie |rv:)(\d+(.\d+)?)/i)[2] : !1
                    },
                    isBlankString: function(a) {
                        return !a || /^\s*$/.test(a)
                    },
                    escapeRegExChars: function(a) {
                        return a.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")
                    },
                    isString: function(a) {
                        return "string" == typeof a
                    },
                    isNumber: function(a) {
                        return "number" == typeof a
                    },
                    isArray: a.isArray,
                    isFunction: a.isFunction,
                    isObject: a.isPlainObject,
                    isUndefined: function(a) {
                        return "undefined" == typeof a
                    },
                    toStr: function(a) {
                        return b.isUndefined(a) || null === a ? "" : a + ""
                    },
                    bind: a.proxy,
                    each: function(b, c) {
                        function d(a, b) {
                            return c(b, a)
                        }
                        a.each(b, d)
                    },
                    map: a.map,
                    filter: a.grep,
                    every: function(b, c) {
                        var d = !0;
                        return b ? (a.each(b, function(a, e) {
                            return (d = c.call(null, e, a, b)) ? void 0 : !1
                        }), !!d) : d
                    },
                    some: function(b, c) {
                        var d = !1;
                        return b ? (a.each(b, function(a, e) {
                            return (d = c.call(null, e, a, b)) ? !1 : void 0
                        }), !!d) : d
                    },
                    mixin: a.extend,
                    getUniqueId: function() {
                        var a = 0;
                        return function() {
                            return a++
                        }
                    }(),
                    templatify: function(b) {
                        function c() {
                            return String(b)
                        }
                        return a.isFunction(b) ? b : c
                    },
                    defer: function(a) {
                        setTimeout(a, 0)
                    },
                    debounce: function(a, b, c) {
                        var d, e;
                        return function() {
                            var f, g, h = this,
                                i = arguments;
                            return f = function() {
                                d = null, c || (e = a.apply(h, i))
                            }, g = c && !d, clearTimeout(d), d = setTimeout(f, b), g && (e = a.apply(h, i)), e
                        }
                    },
                    throttle: function(a, b) {
                        var c, d, e, f, g, h;
                        return g = 0, h = function() {
                                g = new Date, e = null, f = a.apply(c, d)
                            },
                            function() {
                                var i = new Date,
                                    j = b - (i - g);
                                return c = this, d = arguments, 0 >= j ? (clearTimeout(e), e = null, g = i, f = a.apply(c, d)) : e || (e = setTimeout(h, j)), f
                            }
                    },
                    noop: function() {}
                }
            }(),
            c = function() {
                return {
                    wrapper: '<span class="twitter-typeahead"></span>',
                    dropdown: '<span class="tt-dropdown-menu"></span>',
                    dataset: '<div class="tt-dataset-%CLASS%"></div>',
                    suggestions: '<span class="tt-suggestions"></span>',
                    suggestion: '<div class="tt-suggestion"></div>'
                }
            }(),
            d = function() {
                "use strict";
                var a = {
                    wrapper: {
                        position: "relative",
                        display: "inline-block"
                    },
                    hint: {
                        position: "absolute",
                        top: "0",
                        left: "0",
                        borderColor: "transparent",
                        boxShadow: "none",
                        opacity: "1"
                    },
                    input: {
                        position: "relative",
                        verticalAlign: "top",
                        backgroundColor: "transparent"
                    },
                    inputWithNoHint: {
                        position: "relative",
                        verticalAlign: "top"
                    },
                    dropdown: {
                        position: "absolute",
                        top: "100%",
                        left: "0",
                        zIndex: "100",
                        display: "none"
                    },
                    suggestions: {
                        display: "block"
                    },
                    suggestion: {
                        whiteSpace: "nowrap",
                        cursor: "pointer"
                    },
                    suggestionChild: {
                        whiteSpace: "normal"
                    },
                    ltr: {
                        left: "0",
                        right: "auto"
                    },
                    rtl: {
                        left: "auto",
                        right: " 0"
                    }
                };
                return b.isMsie() && b.mixin(a.input, {
                    backgroundImage: "url(data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7)"
                }), b.isMsie() && b.isMsie() <= 7 && b.mixin(a.input, {
                    marginTop: "-1px"
                }), a
            }(),
            e = function() {
                "use strict";

                function c(b) {
                    b && b.el || a.error("EventBus initialized without el"), this.$el = a(b.el)
                }
                var d = "typeahead:";
                return b.mixin(c.prototype, {
                    trigger: function(a) {
                        var b = [].slice.call(arguments, 1);
                        this.$el.trigger(d + a, b)
                    }
                }), c
            }(),
            f = function() {
                "use strict";

                function a(a, b, c, d) {
                    var e;
                    if (!c) return this;
                    for (b = b.split(i), c = d ? h(c, d) : c, this._callbacks = this._callbacks || {}; e = b.shift();) this._callbacks[e] = this._callbacks[e] || {
                        sync: [],
                        async: []
                    }, this._callbacks[e][a].push(c);
                    return this
                }

                function b(b, c, d) {
                    return a.call(this, "async", b, c, d)
                }

                function c(b, c, d) {
                    return a.call(this, "sync", b, c, d)
                }

                function d(a) {
                    var b;
                    if (!this._callbacks) return this;
                    for (a = a.split(i); b = a.shift();) delete this._callbacks[b];
                    return this
                }

                function e(a) {
                    var b, c, d, e, g;
                    if (!this._callbacks) return this;
                    for (a = a.split(i), d = [].slice.call(arguments, 1);
                        (b = a.shift()) && (c = this._callbacks[b]);) e = f(c.sync, this, [b].concat(d)), g = f(c.async, this, [b].concat(d)), e() && j(g);
                    return this
                }

                function f(a, b, c) {
                    function d() {
                        for (var d, e = 0, f = a.length; !d && f > e; e += 1) d = a[e].apply(b, c) === !1;
                        return !d
                    }
                    return d
                }

                function g() {
                    var a;
                    return a = window.setImmediate ? function(a) {
                        setImmediate(function() {
                            a()
                        })
                    } : function(a) {
                        setTimeout(function() {
                            a()
                        }, 0)
                    }
                }

                function h(a, b) {
                    return a.bind ? a.bind(b) : function() {
                        a.apply(b, [].slice.call(arguments, 0))
                    }
                }
                var i = /\s+/,
                    j = g();
                return {
                    onSync: c,
                    onAsync: b,
                    off: d,
                    trigger: e
                }
            }(),
            g = function(a) {
                "use strict";

                function c(a, c, d) {
                    for (var e, f = [], g = 0, h = a.length; h > g; g++) f.push(b.escapeRegExChars(a[g]));
                    return e = d ? "\\b(" + f.join("|") + ")\\b" : "(" + f.join("|") + ")", c ? new RegExp(e) : new RegExp(e, "i")
                }
                var d = {
                    node: null,
                    pattern: null,
                    tagName: "strong",
                    className: null,
                    wordsOnly: !1,
                    caseSensitive: !1
                };
                return function(e) {
                    function f(b) {
                        var c, d, f;
                        return (c = h.exec(b.data)) && (f = a.createElement(e.tagName), e.className && (f.className = e.className), d = b.splitText(c.index), d.splitText(c[0].length), f.appendChild(d.cloneNode(!0)), b.parentNode.replaceChild(f, d)), !!c
                    }

                    function g(a, b) {
                        for (var c, d = 3, e = 0; e < a.childNodes.length; e++) c = a.childNodes[e], c.nodeType === d ? e += b(c) ? 1 : 0 : g(c, b)
                    }
                    var h;
                    e = b.mixin({}, d, e), e.node && e.pattern && (e.pattern = b.isArray(e.pattern) ? e.pattern : [e.pattern], h = c(e.pattern, e.caseSensitive, e.wordsOnly), g(e.node, f))
                }
            }(window.document),
            h = function() {
                "use strict";

                function c(c) {
                    var e, f, g, i, j = this;
                    c = c || {}, c.input || a.error("input is missing"), e = b.bind(this._onBlur, this), f = b.bind(this._onFocus, this), g = b.bind(this._onKeydown, this), i = b.bind(this._onInput, this), this.$hint = a(c.hint), this.$input = a(c.input).on("blur.tt", e).on("focus.tt", f).on("keydown.tt", g), 0 === this.$hint.length && (this.setHint = this.getHint = this.clearHint = this.clearHintIfInvalid = b.noop), b.isMsie() ? this.$input.on("keydown.tt keypress.tt cut.tt paste.tt", function(a) {
                        h[a.which || a.keyCode] || b.defer(b.bind(j._onInput, j, a))
                    }) : this.$input.on("input.tt", i), this.query = this.$input.val(), this.$overflowHelper = d(this.$input)
                }

                function d(b) {
                    return a('<pre aria-hidden="true"></pre>').css({
                        position: "absolute",
                        visibility: "hidden",
                        whiteSpace: "pre",
                        fontFamily: b.css("font-family"),
                        fontSize: b.css("font-size"),
                        fontStyle: b.css("font-style"),
                        fontVariant: b.css("font-variant"),
                        fontWeight: b.css("font-weight"),
                        wordSpacing: b.css("word-spacing"),
                        letterSpacing: b.css("letter-spacing"),
                        textIndent: b.css("text-indent"),
                        textRendering: b.css("text-rendering"),
                        textTransform: b.css("text-transform")
                    }).insertAfter(b)
                }

                function e(a, b) {
                    return c.normalizeQuery(a) === c.normalizeQuery(b)
                }

                function g(a) {
                    return a.altKey || a.ctrlKey || a.metaKey || a.shiftKey
                }
                var h;
                return h = {
                    9: "tab",
                    27: "esc",
                    37: "left",
                    39: "right",
                    13: "enter",
                    38: "up",
                    40: "down"
                }, c.normalizeQuery = function(a) {
                    return (a || "").replace(/^\s*/g, "").replace(/\s{2,}/g, " ")
                }, b.mixin(c.prototype, f, {
                    _onBlur: function() {
                        this.resetInputValue(), this.trigger("blurred")
                    },
                    _onFocus: function() {
                        this.trigger("focused")
                    },
                    _onKeydown: function(a) {
                        var b = h[a.which || a.keyCode];
                        this._managePreventDefault(b, a), b && this._shouldTrigger(b, a) && this.trigger(b + "Keyed", a)
                    },
                    _onInput: function() {
                        this._checkInputValue()
                    },
                    _managePreventDefault: function(a, b) {
                        var c, d, e;
                        switch (a) {
                            case "tab":
                                d = this.getHint(), e = this.getInputValue(), c = d && d !== e && !g(b);
                                break;
                            case "up":
                            case "down":
                                c = !g(b);
                                break;
                            default:
                                c = !1
                        }
                        c && b.preventDefault()
                    },
                    _shouldTrigger: function(a, b) {
                        var c;
                        switch (a) {
                            case "tab":
                                c = !g(b);
                                break;
                            default:
                                c = !0
                        }
                        return c
                    },
                    _checkInputValue: function() {
                        var a, b, c;
                        a = this.getInputValue(), b = e(a, this.query), c = b ? this.query.length !== a.length : !1, this.query = a, b ? c && this.trigger("whitespaceChanged", this.query) : this.trigger("queryChanged", this.query)
                    },
                    focus: function() {
                        this.$input.focus()
                    },
                    blur: function() {
                        this.$input.blur()
                    },
                    getQuery: function() {
                        return this.query
                    },
                    setQuery: function(a) {
                        this.query = a
                    },
                    getInputValue: function() {
                        return this.$input.val()
                    },
                    setInputValue: function(a, b) {
                        this.$input.val(a), b ? this.clearHint() : this._checkInputValue()
                    },
                    resetInputValue: function() {
                        this.setInputValue(this.query, !0)
                    },
                    getHint: function() {
                        return this.$hint.val()
                    },
                    setHint: function(a) {
                        this.$hint.val(a)
                    },
                    clearHint: function() {
                        this.setHint("")
                    },
                    clearHintIfInvalid: function() {
                        var a, b, c, d;
                        a = this.getInputValue(), b = this.getHint(), c = a !== b && 0 === b.indexOf(a), d = "" !== a && c && !this.hasOverflow(), !d && this.clearHint()
                    },
                    getLanguageDirection: function() {
                        return (this.$input.css("direction") || "ltr").toLowerCase()
                    },
                    hasOverflow: function() {
                        var a = this.$input.width() - 2;
                        return this.$overflowHelper.text(this.getInputValue()), this.$overflowHelper.width() >= a
                    },
                    isCursorAtEnd: function() {
                        var a, c, d;
                        return a = this.$input.val().length, c = this.$input[0].selectionStart, b.isNumber(c) ? c === a : document.selection ? (d = document.selection.createRange(), d.moveStart("character", -a), a === d.text.length) : !0
                    },
                    destroy: function() {
                        this.$hint.off(".tt"), this.$input.off(".tt"), this.$hint = this.$input = this.$overflowHelper = null
                    }
                }), c
            }(),
            i = function() {
                "use strict";

                function e(d) {
                    d = d || {}, d.templates = d.templates || {}, d.source || a.error("missing source"), d.name && !j(d.name) && a.error("invalid dataset name: " + d.name), this.query = null, this.highlight = !!d.highlight, this.name = d.name || b.getUniqueId(), this.source = d.source, this.displayFn = h(d.display || d.displayKey), this.templates = i(d.templates, this.displayFn), this.$el = a(c.dataset.replace("%CLASS%", this.name))
                }

                function h(a) {
                    function c(b) {
                        return b[a]
                    }
                    return a = a || "value", b.isFunction(a) ? a : c
                }

                function i(a, c) {
                    function d(a) {
                        return "<p>" + c(a) + "</p>"
                    }
                    return {
                        empty: a.empty && b.templatify(a.empty),
                        header: a.header && b.templatify(a.header),
                        footer: a.footer && b.templatify(a.footer),
                        suggestion: a.suggestion || d
                    }
                }

                function j(a) {
                    return /^[_a-zA-Z0-9-]+$/.test(a)
                }
                var k = "ttDataset",
                    l = "ttValue",
                    m = "ttDatum";
                return e.extractDatasetName = function(b) {
                    return a(b).data(k)
                }, e.extractValue = function(b) {
                    return a(b).data(l)
                }, e.extractDatum = function(b) {
                    return a(b).data(m)
                }, b.mixin(e.prototype, f, {
                    _render: function(e, f) {
                        function h() {
                            return p.templates.empty({
                                query: e,
                                isEmpty: !0
                            })
                        }

                        function i() {
                            function h(b) {
                                var e;
                                return e = a(c.suggestion).append(p.templates.suggestion(b)).data(k, p.name).data(l, p.displayFn(b)).data(m, b), e.children().each(function() {
                                    a(this).css(d.suggestionChild)
                                }), e
                            }
                            var i, j;
                            return i = a(c.suggestions).css(d.suggestions), j = b.map(f, h), i.append.apply(i, j), p.highlight && g({
                                className: "tt-highlight",
                                node: i[0],
                                pattern: e
                            }), i
                        }

                        function j() {
                            return p.templates.header({
                                query: e,
                                isEmpty: !o
                            })
                        }

                        function n() {
                            return p.templates.footer({
                                query: e,
                                isEmpty: !o
                            })
                        }
                        if (this.$el) {
                            var o, p = this;
                            this.$el.empty(), o = f && f.length, !o && this.templates.empty ? this.$el.html(h()).prepend(p.templates.header ? j() : null).append(p.templates.footer ? n() : null) : o && this.$el.html(i()).prepend(p.templates.header ? j() : null).append(p.templates.footer ? n() : null), this.trigger("rendered")
                        }
                    },
                    getRoot: function() {
                        return this.$el
                    },
                    update: function(a) {
                        function b(b) {
                            c.canceled || a !== c.query || c._render(a, b)
                        }
                        var c = this;
                        this.query = a, this.canceled = !1, this.source(a, b)
                    },
                    cancel: function() {
                        this.canceled = !0
                    },
                    clear: function() {
                        this.cancel(), this.$el.empty(), this.trigger("rendered")
                    },
                    isEmpty: function() {
                        return this.$el.is(":empty")
                    },
                    destroy: function() {
                        this.$el = null
                    }
                }), e
            }(),
            j = function() {
                "use strict";

                function c(c) {
                    var d, f, g, h = this;
                    c = c || {}, c.menu || a.error("menu is required"), this.isOpen = !1, this.isEmpty = !0, this.datasets = b.map(c.datasets, e), d = b.bind(this._onSuggestionClick, this), f = b.bind(this._onSuggestionMouseEnter, this), g = b.bind(this._onSuggestionMouseLeave, this), this.$menu = a(c.menu).on("click.tt", ".tt-suggestion", d).on("mouseenter.tt", ".tt-suggestion", f).on("mouseleave.tt", ".tt-suggestion", g), b.each(this.datasets, function(a) {
                        h.$menu.append(a.getRoot()), a.onSync("rendered", h._onRendered, h)
                    })
                }

                function e(a) {
                    return new i(a)
                }
                return b.mixin(c.prototype, f, {
                    _onSuggestionClick: function(b) {
                        this.trigger("suggestionClicked", a(b.currentTarget))
                    },
                    _onSuggestionMouseEnter: function(b) {
                        this._removeCursor(), this._setCursor(a(b.currentTarget), !0)
                    },
                    _onSuggestionMouseLeave: function() {
                        this._removeCursor()
                    },
                    _onRendered: function() {
                        function a(a) {
                            return a.isEmpty()
                        }
                        this.isEmpty = b.every(this.datasets, a), this.isEmpty ? this._hide() : this.isOpen && this._show(), this.trigger("datasetRendered")
                    },
                    _hide: function() {
                        this.$menu.hide()
                    },
                    _show: function() {
                        this.$menu.css("display", "block")
                    },
                    _getSuggestions: function() {
                        return this.$menu.find(".tt-suggestion")
                    },
                    _getCursor: function() {
                        return this.$menu.find(".tt-cursor").first()
                    },
                    _setCursor: function(a, b) {
                        a.first().addClass("tt-cursor"), !b && this.trigger("cursorMoved")
                    },
                    _removeCursor: function() {
                        this._getCursor().removeClass("tt-cursor")
                    },
                    _moveCursor: function(a) {
                        var b, c, d, e;
                        if (this.isOpen) {
                            if (c = this._getCursor(), b = this._getSuggestions(), this._removeCursor(), d = b.index(c) + a, d = (d + 1) % (b.length + 1) - 1, -1 === d) return void this.trigger("cursorRemoved"); - 1 > d && (d = b.length - 1), this._setCursor(e = b.eq(d)), this._ensureVisible(e)
                        }
                    },
                    _ensureVisible: function(a) {
                        var b, c, d, e;
                        b = a.position().top, c = b + a.outerHeight(!0), d = this.$menu.scrollTop(), e = this.$menu.height() + parseInt(this.$menu.css("paddingTop"), 10) + parseInt(this.$menu.css("paddingBottom"), 10), 0 > b ? this.$menu.scrollTop(d + b) : c > e && this.$menu.scrollTop(d + (c - e))
                    },
                    close: function() {
                        this.isOpen && (this.isOpen = !1, this._removeCursor(), this._hide(), this.trigger("closed"))
                    },
                    open: function() {
                        this.isOpen || (this.isOpen = !0, !this.isEmpty && this._show(), this.trigger("opened"))
                    },
                    setLanguageDirection: function(a) {
                        this.$menu.css("ltr" === a ? d.ltr : d.rtl)
                    },
                    moveCursorUp: function() {
                        this._moveCursor(-1)
                    },
                    moveCursorDown: function() {
                        this._moveCursor(1)
                    },
                    getDatumForSuggestion: function(a) {
                        var b = null;
                        return a.length && (b = {
                            raw: i.extractDatum(a),
                            value: i.extractValue(a),
                            datasetName: i.extractDatasetName(a)
                        }), b
                    },
                    getDatumForCursor: function() {
                        return this.getDatumForSuggestion(this._getCursor().first())
                    },
                    getDatumForTopSuggestion: function() {
                        return this.getDatumForSuggestion(this._getSuggestions().first())
                    },
                    update: function(a) {
                        function c(b) {
                            b.update(a)
                        }
                        b.each(this.datasets, c)
                    },
                    empty: function() {
                        function a(a) {
                            a.clear()
                        }
                        b.each(this.datasets, a), this.isEmpty = !0
                    },
                    isVisible: function() {
                        return this.isOpen && !this.isEmpty
                    },
                    destroy: function() {
                        function a(a) {
                            a.destroy()
                        }
                        this.$menu.off(".tt"), this.$menu = null, b.each(this.datasets, a)
                    }
                }), c
            }(),
            k = function() {
                "use strict";

                function f(c) {
                    var d, f, i;
                    c = c || {}, c.input || a.error("missing input"), this.isActivated = !1, this.autoselect = !!c.autoselect, this.minLength = b.isNumber(c.minLength) ? c.minLength : 1, this.$node = g(c.input, c.withHint), d = this.$node.find(".tt-dropdown-menu"), f = this.$node.find(".tt-input"), i = this.$node.find(".tt-hint"), f.on("blur.tt", function(a) {
                        var c, e, g;
                        c = document.activeElement, e = d.is(c), g = d.has(c).length > 0, b.isMsie() && (e || g) && (a.preventDefault(), a.stopImmediatePropagation(), b.defer(function() {
                            f.focus()
                        }))
                    }), d.on("mousedown.tt", function(a) {
                        a.preventDefault()
                    }), this.eventBus = c.eventBus || new e({
                        el: f
                    }), this.dropdown = new j({
                        menu: d,
                        datasets: c.datasets
                    }).onSync("suggestionClicked", this._onSuggestionClicked, this).onSync("cursorMoved", this._onCursorMoved, this).onSync("cursorRemoved", this._onCursorRemoved, this).onSync("opened", this._onOpened, this).onSync("closed", this._onClosed, this).onAsync("datasetRendered", this._onDatasetRendered, this), this.input = new h({
                        input: f,
                        hint: i
                    }).onSync("focused", this._onFocused, this).onSync("blurred", this._onBlurred, this).onSync("enterKeyed", this._onEnterKeyed, this).onSync("tabKeyed", this._onTabKeyed, this).onSync("escKeyed", this._onEscKeyed, this).onSync("upKeyed", this._onUpKeyed, this).onSync("downKeyed", this._onDownKeyed, this).onSync("leftKeyed", this._onLeftKeyed, this).onSync("rightKeyed", this._onRightKeyed, this).onSync("queryChanged", this._onQueryChanged, this).onSync("whitespaceChanged", this._onWhitespaceChanged, this), this._setLanguageDirection()
                }

                function g(b, e) {
                    var f, g, h, j;
                    f = a(b), g = a(c.wrapper).css(d.wrapper), h = a(c.dropdown).css(d.dropdown), j = f.clone().css(d.hint).css(i(f)), j.val("").removeData().addClass("tt-hint").removeAttr("id name placeholder required").prop("readonly", !0).attr({
                        autocomplete: "off",
                        spellcheck: "false",
                        tabindex: -1
                    }), f.data(l, {
                        dir: f.attr("dir"),
                        autocomplete: f.attr("autocomplete"),
                        spellcheck: f.attr("spellcheck"),
                        style: f.attr("style")
                    }), f.addClass("tt-input").attr({
                        autocomplete: "off",
                        spellcheck: !1
                    }).css(e ? d.input : d.inputWithNoHint);
                    try {
                        !f.attr("dir") && f.attr("dir", "auto")
                    } catch (k) {}
                    return f.wrap(g).parent().prepend(e ? j : null).append(h)
                }

                function i(a) {
                    return {
                        backgroundAttachment: a.css("background-attachment"),
                        backgroundClip: a.css("background-clip"),
                        backgroundColor: a.css("background-color"),
                        backgroundImage: a.css("background-image"),
                        backgroundOrigin: a.css("background-origin"),
                        backgroundPosition: a.css("background-position"),
                        backgroundRepeat: a.css("background-repeat"),
                        backgroundSize: a.css("background-size")
                    }
                }

                function k(a) {
                    var c = a.find(".tt-input");
                    b.each(c.data(l), function(a, d) {
                        b.isUndefined(a) ? c.removeAttr(d) : c.attr(d, a)
                    }), c.detach().removeData(l).removeClass("tt-input").insertAfter(a), a.remove()
                }
                var l = "ttAttrs";
                return b.mixin(f.prototype, {
                    _onSuggestionClicked: function(a, b) {
                        var c;
                        (c = this.dropdown.getDatumForSuggestion(b)) && this._select(c)
                    },
                    _onCursorMoved: function() {
                        var a = this.dropdown.getDatumForCursor();
                        this.input.setInputValue(a.value, !0), this.eventBus.trigger("cursorchanged", a.raw, a.datasetName)
                    },
                    _onCursorRemoved: function() {
                        this.input.resetInputValue(), this._updateHint()
                    },
                    _onDatasetRendered: function() {
                        this._updateHint()
                    },
                    _onOpened: function() {
                        this._updateHint(), this.eventBus.trigger("opened")
                    },
                    _onClosed: function() {
                        this.input.clearHint(), this.eventBus.trigger("closed")
                    },
                    _onFocused: function() {
                        this.isActivated = !0, this.dropdown.open()
                    },
                    _onBlurred: function() {
                        this.isActivated = !1, this.dropdown.empty(), this.dropdown.close()
                    },
                    _onEnterKeyed: function(a, b) {
                        var c, d;
                        c = this.dropdown.getDatumForCursor(), d = this.dropdown.getDatumForTopSuggestion(), c ? (this._select(c), b.preventDefault()) : this.autoselect && d && (this._select(d), b.preventDefault())
                    },
                    _onTabKeyed: function(a, b) {
                        var c;
                        (c = this.dropdown.getDatumForCursor()) ? (this._select(c), b.preventDefault()) : this._autocomplete(!0)
                    },
                    _onEscKeyed: function() {
                        this.dropdown.close(), this.input.resetInputValue()
                    },
                    _onUpKeyed: function() {
                        var a = this.input.getQuery();
                        this.dropdown.isEmpty && a.length >= this.minLength ? this.dropdown.update(a) : this.dropdown.moveCursorUp(), this.dropdown.open()
                    },
                    _onDownKeyed: function() {
                        var a = this.input.getQuery();
                        this.dropdown.isEmpty && a.length >= this.minLength ? this.dropdown.update(a) : this.dropdown.moveCursorDown(), this.dropdown.open()
                    },
                    _onLeftKeyed: function() {
                        "rtl" === this.dir && this._autocomplete()
                    },
                    _onRightKeyed: function() {
                        "ltr" === this.dir && this._autocomplete()
                    },
                    _onQueryChanged: function(a, b) {
                        this.input.clearHintIfInvalid(), b.length >= this.minLength ? this.dropdown.update(b) : this.dropdown.empty(), this.dropdown.open(), this._setLanguageDirection()
                    },
                    _onWhitespaceChanged: function() {
                        this._updateHint(), this.dropdown.open()
                    },
                    _setLanguageDirection: function() {
                        var a;
                        this.dir !== (a = this.input.getLanguageDirection()) && (this.dir = a, this.$node.css("direction", a), this.dropdown.setLanguageDirection(a))
                    },
                    _updateHint: function() {
                        var a, c, d, e, f, g;
                        a = this.dropdown.getDatumForTopSuggestion(), a && this.dropdown.isVisible() && !this.input.hasOverflow() ? (c = this.input.getInputValue(), d = h.normalizeQuery(c), e = b.escapeRegExChars(d), f = new RegExp("^(?:" + e + ")(.+$)", "i"), g = f.exec(a.value), g ? this.input.setHint(c + g[1]) : this.input.clearHint()) : this.input.clearHint()
                    },
                    _autocomplete: function(a) {
                        var b, c, d, e;
                        b = this.input.getHint(), c = this.input.getQuery(), d = a || this.input.isCursorAtEnd(), b && c !== b && d && (e = this.dropdown.getDatumForTopSuggestion(), e && this.input.setInputValue(e.value), this.eventBus.trigger("autocompleted", e.raw, e.datasetName))
                    },
                    _select: function(a) {
                        this.input.setQuery(a.value), this.input.setInputValue(a.value, !0), this._setLanguageDirection(), this.eventBus.trigger("selected", a.raw, a.datasetName), this.dropdown.close(), b.defer(b.bind(this.dropdown.empty, this.dropdown))
                    },
                    open: function() {
                        this.dropdown.open()
                    },
                    close: function() {
                        this.dropdown.close()
                    },
                    setVal: function(a) {
                        a = b.toStr(a), this.isActivated ? this.input.setInputValue(a) : (this.input.setQuery(a), this.input.setInputValue(a, !0)), this._setLanguageDirection()
                    },
                    getVal: function() {
                        return this.input.getQuery()
                    },
                    destroy: function() {
                        this.input.destroy(), this.dropdown.destroy(), k(this.$node), this.$node = null
                    }
                }), f
            }();
        ! function() {
            "use strict";
            var c, d, f;
            c = a.fn.typeahead, d = "ttTypeahead", f = {
                initialize: function(c, f) {
                    function g() {
                        var g, h, i = a(this);
                        b.each(f, function(a) {
                            a.highlight = !!c.highlight
                        }), h = new k({
                            input: i,
                            eventBus: g = new e({
                                el: i
                            }),
                            withHint: b.isUndefined(c.hint) ? !0 : !!c.hint,
                            minLength: c.minLength,
                            autoselect: c.autoselect,
                            datasets: f
                        }), i.data(d, h)
                    }
                    return f = b.isArray(f) ? f : [].slice.call(arguments, 1), c = c || {}, this.each(g)
                },
                open: function() {
                    function b() {
                        var b, c = a(this);
                        (b = c.data(d)) && b.open()
                    }
                    return this.each(b)
                },
                close: function() {
                    function b() {
                        var b, c = a(this);
                        (b = c.data(d)) && b.close()
                    }
                    return this.each(b)
                },
                val: function(b) {
                    function c() {
                        var c, e = a(this);
                        (c = e.data(d)) && c.setVal(b)
                    }

                    function e(a) {
                        var b, c;
                        return (b = a.data(d)) && (c = b.getVal()), c
                    }
                    return arguments.length ? this.each(c) : e(this.first())
                },
                destroy: function() {
                    function b() {
                        var b, c = a(this);
                        (b = c.data(d)) && (b.destroy(), c.removeData(d))
                    }
                    return this.each(b)
                }
            }, a.fn.typeahead = function(b) {
                var c;
                return f[b] && "initialize" !== b ? (c = this.filter(function() {
                    return !!a(this).data(d)
                }), f[b].apply(c, [].slice.call(arguments, 1))) : f.initialize.apply(this, arguments)
            }, a.fn.typeahead.noConflict = function() {
                return a.fn.typeahead = c, this
            }
        }()
    }(window.jQuery), ! function(a) {
        var b = function() {
                "use strict";
                return {
                    isMsie: function() {
                        return /(msie|trident)/i.test(navigator.userAgent) ? navigator.userAgent.match(/(msie |rv:)(\d+(.\d+)?)/i)[2] : !1
                    },
                    isBlankString: function(a) {
                        return !a || /^\s*$/.test(a)
                    },
                    escapeRegExChars: function(a) {
                        return a.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")
                    },
                    isString: function(a) {
                        return "string" == typeof a
                    },
                    isNumber: function(a) {
                        return "number" == typeof a
                    },
                    isArray: a.isArray,
                    isFunction: a.isFunction,
                    isObject: a.isPlainObject,
                    isUndefined: function(a) {
                        return "undefined" == typeof a
                    },
                    toStr: function(a) {
                        return b.isUndefined(a) || null === a ? "" : a + ""
                    },
                    bind: a.proxy,
                    each: function(b, c) {
                        function d(a, b) {
                            return c(b, a)
                        }
                        a.each(b, d)
                    },
                    map: a.map,
                    filter: a.grep,
                    every: function(b, c) {
                        var d = !0;
                        return b ? (a.each(b, function(a, e) {
                            return (d = c.call(null, e, a, b)) ? void 0 : !1
                        }), !!d) : d
                    },
                    some: function(b, c) {
                        var d = !1;
                        return b ? (a.each(b, function(a, e) {
                            return (d = c.call(null, e, a, b)) ? !1 : void 0
                        }), !!d) : d
                    },
                    mixin: a.extend,
                    getUniqueId: function() {
                        var a = 0;
                        return function() {
                            return a++
                        }
                    }(),
                    templatify: function(b) {
                        function c() {
                            return String(b)
                        }
                        return a.isFunction(b) ? b : c
                    },
                    defer: function(a) {
                        setTimeout(a, 0)
                    },
                    debounce: function(a, b, c) {
                        var d, e;
                        return function() {
                            var f, g, h = this,
                                i = arguments;
                            return f = function() {
                                d = null, c || (e = a.apply(h, i))
                            }, g = c && !d, clearTimeout(d), d = setTimeout(f, b), g && (e = a.apply(h, i)), e
                        }
                    },
                    throttle: function(a, b) {
                        var c, d, e, f, g, h;
                        return g = 0, h = function() {
                                g = new Date, e = null, f = a.apply(c, d)
                            },
                            function() {
                                var i = new Date,
                                    j = b - (i - g);
                                return c = this, d = arguments, 0 >= j ? (clearTimeout(e), e = null, g = i, f = a.apply(c, d)) : e || (e = setTimeout(h, j)), f
                            }
                    },
                    noop: function() {}
                }
            }(),
            c = "0.10.5",
            d = function() {
                "use strict";

                function a(a) {
                    return a = b.toStr(a), a ? a.split(/\s+/) : []
                }

                function c(a) {
                    return a = b.toStr(a), a ? a.split(/\W+/) : []
                }

                function d(a) {
                    return function() {
                        var c = [].slice.call(arguments, 0);
                        return function(d) {
                            var e = [];
                            return b.each(c, function(c) {
                                e = e.concat(a(b.toStr(d[c])))
                            }), e
                        }
                    }
                }
                return {
                    nonword: c,
                    whitespace: a,
                    obj: {
                        nonword: d(c),
                        whitespace: d(a)
                    }
                }
            }(),
            e = function() {
                "use strict";

                function c(c) {
                    this.maxSize = b.isNumber(c) ? c : 100, this.reset(), this.maxSize <= 0 && (this.set = this.get = a.noop)
                }

                function d() {
                    this.head = this.tail = null
                }

                function e(a, b) {
                    this.key = a, this.val = b, this.prev = this.next = null
                }
                return b.mixin(c.prototype, {
                    set: function(a, b) {
                        var c, d = this.list.tail;
                        this.size >= this.maxSize && (this.list.remove(d), delete this.hash[d.key]), (c = this.hash[a]) ? (c.val = b, this.list.moveToFront(c)) : (c = new e(a, b), this.list.add(c), this.hash[a] = c, this.size++)
                    },
                    get: function(a) {
                        var b = this.hash[a];
                        return b ? (this.list.moveToFront(b), b.val) : void 0
                    },
                    reset: function() {
                        this.size = 0, this.hash = {}, this.list = new d
                    }
                }), b.mixin(d.prototype, {
                    add: function(a) {
                        this.head && (a.next = this.head, this.head.prev = a), this.head = a, this.tail = this.tail || a
                    },
                    remove: function(a) {
                        a.prev ? a.prev.next = a.next : this.head = a.next, a.next ? a.next.prev = a.prev : this.tail = a.prev
                    },
                    moveToFront: function(a) {
                        this.remove(a), this.add(a)
                    }
                }), c
            }(),
            f = function() {
                "use strict";

                function a(a) {
                    this.prefix = ["__", a, "__"].join(""), this.ttlKey = "__ttl__", this.keyMatcher = new RegExp("^" + b.escapeRegExChars(this.prefix))
                }

                function c() {
                    return (new Date).getTime()
                }

                function d(a) {
                    return JSON.stringify(b.isUndefined(a) ? null : a)
                }

                function e(a) {
                    return JSON.parse(a)
                }
                var f, g;
                try {
                    f = window.localStorage, f.setItem("~~~", "!"), f.removeItem("~~~")
                } catch (h) {
                    f = null
                }
                return g = f && window.JSON ? {
                    _prefix: function(a) {
                        return this.prefix + a
                    },
                    _ttlKey: function(a) {
                        return this._prefix(a) + this.ttlKey
                    },
                    get: function(a) {
                        return this.isExpired(a) && this.remove(a), e(f.getItem(this._prefix(a)))
                    },
                    set: function(a, e, g) {
                        return b.isNumber(g) ? f.setItem(this._ttlKey(a), d(c() + g)) : f.removeItem(this._ttlKey(a)), f.setItem(this._prefix(a), d(e))
                    },
                    remove: function(a) {
                        return f.removeItem(this._ttlKey(a)), f.removeItem(this._prefix(a)), this
                    },
                    clear: function() {
                        var a, b, c = [],
                            d = f.length;
                        for (a = 0; d > a; a++)(b = f.key(a)).match(this.keyMatcher) && c.push(b.replace(this.keyMatcher, ""));
                        for (a = c.length; a--;) this.remove(c[a]);
                        return this
                    },
                    isExpired: function(a) {
                        var d = e(f.getItem(this._ttlKey(a)));
                        return b.isNumber(d) && c() > d ? !0 : !1
                    }
                } : {
                    get: b.noop,
                    set: b.noop,
                    remove: b.noop,
                    clear: b.noop,
                    isExpired: b.noop
                }, b.mixin(a.prototype, g), a
            }(),
            g = function() {
                "use strict";

                function c(b) {
                    b = b || {}, this.cancelled = !1, this.lastUrl = null, this._send = b.transport ? d(b.transport) : a.ajax, this._get = b.rateLimiter ? b.rateLimiter(this._get) : this._get, this._cache = b.cache === !1 ? new e(0) : i
                }

                function d(c) {
                    return function(d, e) {
                        function f(a) {
                            b.defer(function() {
                                h.resolve(a)
                            })
                        }

                        function g(a) {
                            b.defer(function() {
                                h.reject(a)
                            })
                        }
                        var h = a.Deferred();
                        return c(d, e, f, g), h
                    }
                }
                var f = 0,
                    g = {},
                    h = 6,
                    i = new e(10);
                return c.setMaxPendingRequests = function(a) {
                    h = a
                }, c.resetCache = function() {
                    i.reset()
                }, b.mixin(c.prototype, {
                    _get: function(a, b, c) {
                        function d(b) {
                            c && c(null, b), k._cache.set(a, b)
                        }

                        function e() {
                            c && c(!0)
                        }

                        function i() {
                            f--, delete g[a], k.onDeckRequestArgs && (k._get.apply(k, k.onDeckRequestArgs), k.onDeckRequestArgs = null)
                        }
                        var j, k = this;
                        this.cancelled || a !== this.lastUrl || ((j = g[a]) ? j.done(d).fail(e) : h > f ? (f++, g[a] = this._send(a, b).done(d).fail(e).always(i)) : this.onDeckRequestArgs = [].slice.call(arguments, 0))
                    },
                    get: function(a, c, d) {
                        var e;
                        return b.isFunction(c) && (d = c, c = {}), this.cancelled = !1, this.lastUrl = a, (e = this._cache.get(a)) ? b.defer(function() {
                            d && d(null, e)
                        }) : this._get(a, c, d), !!e
                    },
                    cancel: function() {
                        this.cancelled = !0
                    }
                }), c
            }(),
            h = function() {
                "use strict";

                function c(b) {
                    b = b || {}, b.datumTokenizer && b.queryTokenizer || a.error("datumTokenizer and queryTokenizer are both required"), this.datumTokenizer = b.datumTokenizer, this.queryTokenizer = b.queryTokenizer, this.reset()
                }

                function d(a) {
                    return a = b.filter(a, function(a) {
                        return !!a
                    }), a = b.map(a, function(a) {
                        return a.toLowerCase()
                    })
                }

                function e() {
                    return {
                        ids: [],
                        children: {}
                    }
                }

                function f(a) {
                    for (var b = {}, c = [], d = 0, e = a.length; e > d; d++) b[a[d]] || (b[a[d]] = !0, c.push(a[d]));
                    return c
                }

                function g(a, b) {
                    function c(a, b) {
                        return a - b
                    }
                    var d = 0,
                        e = 0,
                        f = [];
                    a = a.sort(c), b = b.sort(c);
                    for (var g = a.length, h = b.length; g > d && h > e;) a[d] < b[e] ? d++ : a[d] > b[e] ? e++ : (f.push(a[d]), d++, e++);
                    return f
                }
                return b.mixin(c.prototype, {
                    bootstrap: function(a) {
                        this.datums = a.datums, this.trie = a.trie
                    },
                    add: function(a) {
                        var c = this;
                        a = b.isArray(a) ? a : [a], b.each(a, function(a) {
                            var f, g;
                            f = c.datums.push(a) - 1, g = d(c.datumTokenizer(a)), b.each(g, function(a) {
                                var b, d, g;
                                for (b = c.trie, d = a.split(""); g = d.shift();) b = b.children[g] || (b.children[g] = e()), b.ids.push(f)
                            })
                        })
                    },
                    get: function(a) {
                        var c, e, h = this;
                        return c = d(this.queryTokenizer(a)), b.each(c, function(a) {
                            var b, c, d, f;
                            if (e && 0 === e.length) return !1;
                            for (b = h.trie, c = a.split(""); b && (d = c.shift());) b = b.children[d];
                            return b && 0 === c.length ? (f = b.ids.slice(0), void(e = e ? g(e, f) : f)) : (e = [], !1)
                        }), e ? b.map(f(e), function(a) {
                            return h.datums[a]
                        }) : []
                    },
                    reset: function() {
                        this.datums = [], this.trie = e()
                    },
                    serialize: function() {
                        return {
                            datums: this.datums,
                            trie: this.trie
                        }
                    }
                }), c
            }(),
            i = function() {
                "use strict";

                function d(a) {
                    return a.local || null
                }

                function e(d) {
                    var e, f;
                    return f = {
                        url: null,
                        thumbprint: "",
                        ttl: 864e5,
                        filter: null,
                        ajax: {}
                    }, (e = d.prefetch || null) && (e = b.isString(e) ? {
                        url: e
                    } : e, e = b.mixin(f, e), e.thumbprint = c + e.thumbprint, e.ajax.type = e.ajax.type || "GET", e.ajax.dataType = e.ajax.dataType || "json", !e.url && a.error("prefetch requires url to be set")), e
                }

                function f(c) {
                    function d(a) {
                        return function(c) {
                            return b.debounce(c, a)
                        }
                    }

                    function e(a) {
                        return function(c) {
                            return b.throttle(c, a)
                        }
                    }
                    var f, g;
                    return g = {
                        url: null,
                        cache: !0,
                        wildcard: "%QUERY",
                        replace: null,
                        rateLimitBy: "debounce",
                        rateLimitWait: 300,
                        send: null,
                        filter: null,
                        ajax: {}
                    }, (f = c.remote || null) && (f = b.isString(f) ? {
                        url: f
                    } : f, f = b.mixin(g, f), f.rateLimiter = /^throttle$/i.test(f.rateLimitBy) ? e(f.rateLimitWait) : d(f.rateLimitWait), f.ajax.type = f.ajax.type || "GET", f.ajax.dataType = f.ajax.dataType || "json", delete f.rateLimitBy, delete f.rateLimitWait, !f.url && a.error("remote requires url to be set")), f
                }
                return {
                    local: d,
                    prefetch: e,
                    remote: f
                }
            }();
        ! function(c) {
            "use strict";

            function e(b) {
                b && (b.local || b.prefetch || b.remote) || a.error("one of local, prefetch, or remote is required"), this.limit = b.limit || 5, this.sorter = j(b.sorter), this.dupDetector = b.dupDetector || k, this.local = i.local(b), this.prefetch = i.prefetch(b), this.remote = i.remote(b), this.cacheKey = this.prefetch ? this.prefetch.cacheKey || this.prefetch.url : null, this.index = new h({
                    datumTokenizer: b.datumTokenizer,
                    queryTokenizer: b.queryTokenizer
                }), this.storage = this.cacheKey ? new f(this.cacheKey) : null
            }

            function j(a) {
                function c(b) {
                    return b.sort(a)
                }

                function d(a) {
                    return a
                }
                return b.isFunction(a) ? c : d
            }

            function k() {
                return !1
            }
            var l, m;
            return l = c.Bloodhound, m = {
                data: "data",
                protocol: "protocol",
                thumbprint: "thumbprint"
            }, c.Bloodhound = e, e.noConflict = function() {
                return c.Bloodhound = l, e
            }, e.tokenizers = d, b.mixin(e.prototype, {
                _loadPrefetch: function(b) {
                    function c(a) {
                        f.clear(), f.add(b.filter ? b.filter(a) : a), f._saveToStorage(f.index.serialize(), b.thumbprint, b.ttl)
                    }
                    var d, e, f = this;
                    return (d = this._readFromStorage(b.thumbprint)) ? (this.index.bootstrap(d), e = a.Deferred().resolve()) : e = a.ajax(b.url, b.ajax).done(c), e
                },
                _getFromRemote: function(a, b) {
                    function c(a, c) {
                        b(a ? [] : f.remote.filter ? f.remote.filter(c) : c)
                    }
                    var d, e, f = this;
                    return this.transport ? (a = a || "", e = encodeURIComponent(a), d = this.remote.replace ? this.remote.replace(this.remote.url, a) : this.remote.url.replace(this.remote.wildcard, e), this.transport.get(d, this.remote.ajax, c)) : void 0
                },
                _cancelLastRemoteRequest: function() {
                    this.transport && this.transport.cancel()
                },
                _saveToStorage: function(a, b, c) {
                    this.storage && (this.storage.set(m.data, a, c), this.storage.set(m.protocol, location.protocol, c), this.storage.set(m.thumbprint, b, c))
                },
                _readFromStorage: function(a) {
                    var b, c = {};
                    return this.storage && (c.data = this.storage.get(m.data), c.protocol = this.storage.get(m.protocol), c.thumbprint = this.storage.get(m.thumbprint)), b = c.thumbprint !== a || c.protocol !== location.protocol, c.data && !b ? c.data : null
                },
                _initialize: function() {
                    function c() {
                        e.add(b.isFunction(f) ? f() : f)
                    }
                    var d, e = this,
                        f = this.local;
                    return d = this.prefetch ? this._loadPrefetch(this.prefetch) : a.Deferred().resolve(), f && d.done(c), this.transport = this.remote ? new g(this.remote) : null, this.initPromise = d.promise()
                },
                initialize: function(a) {
                    return !this.initPromise || a ? this._initialize() : this.initPromise
                },
                add: function(a) {
                    this.index.add(a)
                },
                get: function(a, c) {
                    function d(a) {
                        var d = f.slice(0);
                        b.each(a, function(a) {
                            var c;
                            return c = b.some(d, function(b) {
                                return e.dupDetector(a, b)
                            }), !c && d.push(a), d.length < e.limit
                        }), c && c(e.sorter(d))
                    }
                    var e = this,
                        f = [],
                        g = !1;
                    f = this.index.get(a), f = this.sorter(f).slice(0, this.limit), f.length < this.limit ? g = this._getFromRemote(a, d) : this._cancelLastRemoteRequest(), g || (f.length > 0 || !this.transport) && c && c(f)
                },
                clear: function() {
                    this.index.reset()
                },
                clearPrefetchCache: function() {
                    this.storage && this.storage.clear()
                },
                clearRemoteCache: function() {
                    this.transport && g.resetCache()
                },
                ttAdapter: function() {
                    return b.bind(this.get, this)
                }
            }), e
        }(this)
    }(window.jQuery),
    function() {
        "use strict";
        var a, b;
        a = jQuery, b = function(b, c) {
            var d, e, f, g = this;
            return this.options = a.extend({
                title: null,
                footer: null,
                remote: null
            }, a.fn.ekkoLightbox.defaults, c || {}), this.$element = a(b), d = "", this.modal_id = this.options.modal_id ? this.options.modal_id : "ekkoLightbox-" + Math.floor(1e3 * Math.random() + 1), f = '<div class="modal-header"' + (this.options.title || this.options.always_show_close ? "" : ' style="display:none"') + '><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">' + (this.options.title || "&nbsp;") + "</h4></div>", e = '<div class="modal-footer"' + (this.options.footer ? "" : ' style="display:none"') + ">" + this.options.footer + "</div>", a(document.body).append('<div id="' + this.modal_id + '" class="ekko-lightbox modal fade" tabindex="-1"><div class="modal-dialog"><div class="modal-content">' + f + '<div class="modal-body"><div class="ekko-lightbox-container"><div></div></div></div>' + e + "</div></div></div>"), this.modal = a("#" + this.modal_id), this.modal_dialog = this.modal.find(".modal-dialog").first(), this.modal_content = this.modal.find(".modal-content").first(), this.modal_body = this.modal.find(".modal-body").first(), this.lightbox_container = this.modal_body.find(".ekko-lightbox-container").first(), this.lightbox_body = this.lightbox_container.find("> div:first-child").first(), this.showLoading(), this.modal_arrows = null, this.border = {
                top: parseFloat(this.modal_dialog.css("border-top-width")) + parseFloat(this.modal_content.css("border-top-width")) + parseFloat(this.modal_body.css("border-top-width")),
                right: parseFloat(this.modal_dialog.css("border-right-width")) + parseFloat(this.modal_content.css("border-right-width")) + parseFloat(this.modal_body.css("border-right-width")),
                bottom: parseFloat(this.modal_dialog.css("border-bottom-width")) + parseFloat(this.modal_content.css("border-bottom-width")) + parseFloat(this.modal_body.css("border-bottom-width")),
                left: parseFloat(this.modal_dialog.css("border-left-width")) + parseFloat(this.modal_content.css("border-left-width")) + parseFloat(this.modal_body.css("border-left-width"))
            }, this.padding = {
                top: parseFloat(this.modal_dialog.css("padding-top")) + parseFloat(this.modal_content.css("padding-top")) + parseFloat(this.modal_body.css("padding-top")),
                right: parseFloat(this.modal_dialog.css("padding-right")) + parseFloat(this.modal_content.css("padding-right")) + parseFloat(this.modal_body.css("padding-right")),
                bottom: parseFloat(this.modal_dialog.css("padding-bottom")) + parseFloat(this.modal_content.css("padding-bottom")) + parseFloat(this.modal_body.css("padding-bottom")),
                left: parseFloat(this.modal_dialog.css("padding-left")) + parseFloat(this.modal_content.css("padding-left")) + parseFloat(this.modal_body.css("padding-left"))
            }, this.modal.on("show.bs.modal", this.options.onShow.bind(this)).on("shown.bs.modal", function() {
                return g.modal_shown(), g.options.onShown.call(g)
            }).on("hide.bs.modal", this.options.onHide.bind(this)).on("hidden.bs.modal", function() {
                return g.gallery && a(document).off("keydown.ekkoLightbox"), g.modal.remove(), g.options.onHidden.call(g)
            }).modal("show", c), this.modal
        }, b.prototype = {
            modal_shown: function() {
                var b, c = this;
                return this.options.remote ? (this.gallery = this.$element.data("gallery"), this.gallery && (this.gallery_items = "document.body" === this.options.gallery_parent_selector || "" === this.options.gallery_parent_selector ? a(document.body).find('*[data-toggle="lightbox"][data-gallery="' + this.gallery + '"]') : this.$element.parents(this.options.gallery_parent_selector).first().find('*[data-toggle="lightbox"][data-gallery="' + this.gallery + '"]'), this.gallery_index = this.gallery_items.index(this.$element), a(document).on("keydown.ekkoLightbox", this.navigate.bind(this)), this.options.directional_arrows && this.gallery_items.length > 1 && (this.lightbox_container.prepend('<div class="ekko-lightbox-nav-overlay"><a href="#" class="' + this.strip_stops(this.options.left_arrow_class) + '"></a><a href="#" class="' + this.strip_stops(this.options.right_arrow_class) + '"></a></div>'), this.modal_arrows = this.lightbox_container.find("div.ekko-lightbox-nav-overlay").first(), this.lightbox_container.find("a" + this.strip_spaces(this.options.left_arrow_class)).on("click", function(a) {
                    return a.preventDefault(), c.navigate_left()
                }), this.lightbox_container.find("a" + this.strip_spaces(this.options.right_arrow_class)).on("click", function(a) {
                    return a.preventDefault(), c.navigate_right()
                }))), this.options.type ? "image" === this.options.type ? this.preloadImage(this.options.remote, !0) : "youtube" === this.options.type && (b = this.getYoutubeId(this.options.remote)) ? this.showYoutubeVideo(b) : "vimeo" === this.options.type ? this.showVimeoVideo(this.options.remote) : "instagram" === this.options.type ? this.showInstagramVideo(this.options.remote) : "url" === this.options.type ? this.showInstagramVideo(this.options.remote) : this.error('Could not detect remote target type. Force the type using data-type="image|youtube|vimeo|url"') : this.detectRemoteType(this.options.remote)) : this.error("No remote target given")
            },
            strip_stops: function(a) {
                return a.replace(/\./g, "")
            },
            strip_spaces: function(a) {
                return a.replace(/\s/g, "")
            },
            isImage: function(a) {
                return a.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp|svg)((\?|#).*)?$)/i)
            },
            isSwf: function(a) {
                return a.match(/\.(swf)((\?|#).*)?$/i)
            },
            getYoutubeId: function(a) {
                var b;
                return b = a.match(/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/), b && 11 === b[2].length ? b[2] : !1
            },
            getVimeoId: function(a) {
                return a.indexOf("vimeo") > 0 ? a : !1
            },
            getInstagramId: function(a) {
                return a.indexOf("instagram") > 0 ? a : !1
            },
            navigate: function(a) {
                if (a = a || window.event, 39 === a.keyCode || 37 === a.keyCode) {
                    if (39 === a.keyCode) return this.navigate_right();
                    if (37 === a.keyCode) return this.navigate_left()
                }
            },
            navigateTo: function(b) {
                var c, d;
                return 0 > b || b > this.gallery_items.length - 1 ? this : (this.showLoading(), this.gallery_index = b, this.options.onNavigate.call(this, this.gallery_index), this.$element = a(this.gallery_items.get(this.gallery_index)), this.updateTitleAndFooter(), d = this.$element.attr("data-remote") || this.$element.attr("href"), this.detectRemoteType(d, this.$element.attr("data-type") || !1), this.gallery_index + 1 < this.gallery_items.length && (c = a(this.gallery_items.get(this.gallery_index + 1), !1), d = c.attr("data-remote") || c.attr("href"), "image" === c.attr("data-type") || this.isImage(d)) ? this.preloadImage(d, !1) : void 0)
            },
            navigate_left: function() {
                return 1 !== this.gallery_items.length ? (0 === this.gallery_index ? this.gallery_index = this.gallery_items.length - 1 : this.gallery_index--, this.options.onNavigate.call(this, "left", this.gallery_index), this.navigateTo(this.gallery_index)) : void 0
            },
            navigate_right: function() {
                return 1 !== this.gallery_items.length ? (this.gallery_index === this.gallery_items.length - 1 ? this.gallery_index = 0 : this.gallery_index++, this.options.onNavigate.call(this, "right", this.gallery_index), this.navigateTo(this.gallery_index)) : void 0
            },
            detectRemoteType: function(a, b) {
                var c;
                return "image" === b || this.isImage(a) ? (this.options.type = "image", this.preloadImage(a, !0)) : "youtube" === b || (c = this.getYoutubeId(a)) ? (this.options.type = "youtube", this.showYoutubeVideo(c)) : "vimeo" === b || (c = this.getVimeoId(a)) ? (this.options.type = "vimeo", this.showVimeoVideo(c)) : "instagram" === b || (c = this.getInstagramId(a)) ? (this.options.type = "instagram", this.showInstagramVideo(c)) : "url" === b || (c = this.getInstagramId(a)) ? (this.options.type = "instagram", this.showInstagramVideo(c)) : (this.options.type = "url", this.loadRemoteContent(a))
            },
            updateTitleAndFooter: function() {
                var a, b, c, d;
                return c = this.modal_content.find(".modal-header"), b = this.modal_content.find(".modal-footer"), d = this.$element.data("title") || "", a = this.$element.data("footer") || "", d || this.options.always_show_close ? c.css("display", "").find(".modal-title").html(d || "&nbsp;") : c.css("display", "none"), a ? b.css("display", "").html(a) : b.css("display", "none"), this
            },
            showLoading: function() {
                return this.lightbox_body.html('<div class="modal-loading">Loading..</div>'), this
            },
            showYoutubeVideo: function(a) {
                var b, c, d;
                return b = 560 / 315, d = this.$element.data("width") || 560, d = this.checkDimensions(d), c = d / b, this.resize(d), this.lightbox_body.html('<iframe width="' + d + '" height="' + c + '" src="//www.youtube.com/embed/' + a + '?badge=0&autoplay=1&html5=1" frameborder="0" allowfullscreen></iframe>'), this.options.onContentLoaded.call(this), this.modal_arrows ? this.modal_arrows.css("display", "none") : void 0
            },
            showVimeoVideo: function(a) {
                var b, c, d;
                return b = 500 / 281, d = this.$element.data("width") || 560, d = this.checkDimensions(d), c = d / b, this.resize(d), this.lightbox_body.html('<iframe width="' + d + '" height="' + c + '" src="' + a + '?autoplay=1" frameborder="0" allowfullscreen></iframe>'), this.options.onContentLoaded.call(this), this.modal_arrows ? this.modal_arrows.css("display", "none") : void 0
            },
            showInstagramVideo: function(a) {
                var b;
                return b = this.$element.data("width") || 612, b = this.checkDimensions(b), this.resize(b), this.lightbox_body.html('<iframe width="' + b + '" height="' + b + '" src="' + this.addTrailingSlash(a) + 'embed/" frameborder="0" allowfullscreen></iframe>'), this.options.onContentLoaded.call(this), this.modal_arrows ? this.modal_arrows.css("display", "none") : void 0
            },
            loadRemoteContent: function(b) {
                var c, d, e = this;
                return d = this.$element.data("width") || 560, this.resize(d), c = this.$element.data("disableExternalCheck") || !1, c || this.isExternal(b) ? (this.lightbox_body.html('<iframe width="' + d + '" height="' + d + '" src="' + b + '" frameborder="0" allowfullscreen></iframe>'), this.options.onContentLoaded.call(this)) : this.lightbox_body.load(b, a.proxy(function() {
                    return e.$element.trigger("loaded.bs.modal")
                })), this.modal_arrows ? this.modal_arrows.css("display", "block") : void 0
            },
            isExternal: function(a) {
                var b;
                return b = a.match(/^([^:\/?#]+:)?(?:\/\/([^\/?#]*))?([^?#]+)?(\?[^#]*)?(#.*)?/), "string" == typeof b[1] && b[1].length > 0 && b[1].toLowerCase() !== location.protocol ? !0 : "string" == typeof b[2] && b[2].length > 0 && b[2].replace(new RegExp(":(" + {
                    "http:": 80,
                    "https:": 443
                }[location.protocol] + ")?$"), "") !== location.host ? !0 : !1
            },
            error: function(a) {
                return this.lightbox_body.html(a), this
            },
            preloadImage: function(b, c) {
                var d, e = this;
                return d = new Image, (null == c || c === !0) && (d.onload = function() {
                    var b;
                    return b = a("<img />"), b.attr("src", d.src), b.addClass("img-responsive"), e.lightbox_body.html(b), e.modal_arrows && e.modal_arrows.css("display", "block"), e.resize(d.width), e.options.onContentLoaded.call(e)
                }, d.onerror = function() {
                    return e.error("Failed to load image: " + b)
                }), d.src = b, d
            },
            resize: function(b) {
                var c;
                return c = b + this.border.left + this.padding.left + this.padding.right + this.border.right, this.modal_dialog.css("width", "auto").css("max-width", c), this.lightbox_container.find("a").css("line-height", function() {
                    return a(this).parent().height() + "px"
                }), this
            },
            checkDimensions: function(a) {
                var b, c;
                return c = a + this.border.left + this.padding.left + this.padding.right + this.border.right, b = document.body.clientWidth, c > b && (a = this.modal_body.width()), a
            },
            close: function() {
                return this.modal.modal("hide")
            },
            addTrailingSlash: function(a) {
                return "/" !== a.substr(-1) && (a += "/"), a
            }
        }, a.fn.ekkoLightbox = function(c) {
            return this.each(function() {
                var d;
                return d = a(this), c = a.extend({
                    remote: d.attr("data-remote") || d.attr("href"),
                    gallery_parent_selector: d.attr("data-parent"),
                    type: d.attr("data-type")
                }, c, d.data()), new b(this, c), this
            })
        }, a.fn.ekkoLightbox.defaults = {
            gallery_parent_selector: "*:not(.row)",
            left_arrow_class: ".glyphicon .glyphicon-chevron-left",
            right_arrow_class: ".glyphicon .glyphicon-chevron-right",
            directional_arrows: !0,
            type: null,
            always_show_close: !0,
            onShow: function() {},
            onShown: function() {},
            onHide: function() {},
            onHidden: function() {},
            onNavigate: function() {},
            onContentLoaded: function() {}
        }
    }.call(this);
  