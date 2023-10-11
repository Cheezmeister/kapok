# Kapok
[![NPM version](https://img.shields.io/npm/v/kapok.svg)](https://www.npmjs.com/package/kapok)
[![Build Status](https://cheezmeister.semaphoreci.com/badges/kapok/branches/master.svg)](https://cheezmeister.semaphoreci.com/projects/kapok)
[![Code Climate](https://codeclimate.com/github/Cheezmeister/kapok/badges/gpa.svg)](https://codeclimate.com/github/Cheezmeister/kapok)

Overview
--------

**Kapok** is a simple, static(ish) collapsible tree generator for JS objects (and by extension, JSON). It aims to be easy to use for both developers and end-users, but reasonably flexible where applicable. You can [try it here](http://cheezmeister.github.io/kapok).

It looks something like this:

![screenshot](https://camo.githubusercontent.com/f9eb362e14f9c1cbf2d4a04c00fb735fdaafaa70/687474703a2f2f692e696d6775722e636f6d2f6548716c5578662e706e67)

It was written in about a week while recovering from an expensive appendectomy, because I needed something like it and couldn't find anything satisfactory from the googles. As such it is a bit immature and probably has holes here and there, but it has tested stable on most modern browsers.


Installation
------------

The recommended way to use Kapok is to simply drop [`kapok.js`][js] and [`kapok-full.css`][fullcss] into your source tree and include them however you please.

If you don't like the default styling or cannot override it to your satisfaction, use [`kapok-core.css`][corecss] instead, which has the bare minimum CSS for expand/collapse behaviour.

[js]: https://github.com/Cheezmeister/kapok/releases/download/v0.0.5/kapok.js
[fullcss]: https://github.com/Cheezmeister/kapok/releases/download/v0.0.5/kapok-full.css
[corecss]: https://github.com/Cheezmeister/kapok/releases/download/v0.0.5/kapok-core.css

Usage
-----

```js
var someObject = {foo: 'bar'};
document.body.appendChild(kapok.render(someObject));
```

Server-side use is not supported as a DOM is assumed.

Kapok does not make use of [UMD](https://github.com/umdjs/umd), [AMD](https://github.com/amdjs/amdjs-api/wiki/AMD), or any other MD. It doesn't [export](https://developer.mozilla.org/en-US/docs/web/javascript/reference/statements/export) anything either.

Instead it takes a steaming dump on best practices and sticks its functionality into the global scope, because that's one less thing that might break a year from now when all the cool kids are using BBQMD instead. If you have a global var `kapok` that you don't want trampled, you should rename this module's references to it. Yes, all three of them.




Acknowledgments
---------------

This [CSS Ninja guide](http://www.thecssninja.com/css/css-tree-menu) served as a reference for this project. I used Keith Elias's [fiddle](http://jsfiddle.net/Friar_Broccoli/6LKc6/) as a starting point for styling.
