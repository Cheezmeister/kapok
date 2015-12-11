@kapok = (options) ->

  options ?= {}

  treeClass = options.treeClass ?= 'kapok-tree'
  objectClass = options.objectClass ?= 'kapok-object'
  labelClass = options.labelClass ?= 'kapok-label'
  itemClass = options.itemClass ?= 'kapok-item'
  keyClass = options.keyClass ?= 'kapok-key'
  valueClass = options.valueClass ?= 'kapok-value'

  makeElement = (tag, elClass, content) ->
    retVal = document.createElement tag
    retVal.className = elClass unless !elClass
    retVal.innerHTML = content unless !content
    retVal


  makeTree = (tree) ->
    retVal = makeElement 'ol', treeClass
    for key of tree
      li = makeElement 'li', itemClass
      value = tree[key]
      
      # This value is itself an object (or array).
      # Create a collapsible item and recurse to populate it.
      if typeof value == 'object' and value != null
        li.setAttribute 'class', objectClass
        input = document.createElement('input')
        input.type = 'checkbox'
        input.id = key
        li.appendChild input
        label = document.createElement('label')
        label.setAttribute 'class', labelClass
        label.setAttribute 'for', key
        label.innerHTML = key
        li.appendChild label
        li.appendChild makeTree(value)

      # This value is a leaf. 
      # Create key-value item. Omit keys for array elements.
      else
        if Array.isArray(tree)
          li.innerHTML = value
        else
          keySpan = document.createElement 'span'
          keySpan.setAttribute 'class', keyClass
          keySpan.innerHTML = key
          li.appendChild keySpan
          valueSpan = document.createElement 'span'
          valueSpan.setAttribute 'class', valueClass
          valueSpan.innerHTML = value
          li.appendChild valueSpan

      retVal.appendChild li
    retVal

  { render: makeTree }
