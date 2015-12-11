Overview
--------

**Kapok** is a simple, static(ish) collapsible tree generator for JS objects (and by extension, JSON). It aims to be easy to use for both developers and end-users, but reasonably flexible where applicable.

It looks something like this:

![screenshot](FIXME)

It was written in about a week while recovering from an expensive appendectomy, because I needed something like it and couldn't find anything satisfactory from the googles. As such it is a bit immature and probably has holes here and there, but it has tested stable on most modern browsers.


Installation
------------

The recommended way to use Kapok is to simply drop `kapok.js` and `kapok-full.css` into your source tree and include them however you please.

If you don't like the default styling or cannot override it to your satisfaction, use `kapok-core.css` instead, which has the bare minimum CSS for expand/collapse behaviour.

Usage
-----

```js
var someObject = {foo: 'bar'};
document.body.appendChild(kapok.render(someObject));
```

Server-side use is not supported as a DOM is assumed.

Acknowledgments
---------------

This [CSS Ninja guide](http://www.thecssninja.com/css/css-tree-menu) served as a reference for this project. I used Keith Elias's [fiddle](http://jsfiddle.net/Friar_Broccoli/6LKc6/) as a starting point for styling.
