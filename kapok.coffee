@kapok = (options) ->

  options ?= {}

  treeClass = 'kapok-tree'
  objectClass = 'kapok-object'
  labelClass = 'kapok-label'
  itemClass = 'kapok-item'
  keyClass = 'kapok-key'
  valueClass = 'kapok-value'

  makeElement = (tag, elClass, content) ->
    retVal = document.createElement tag
    retVal.className = elClass unless !elClass
    retVal.innerHTML = content unless !content
    retVal

  makeTree = (tree) ->
    retVal = makeElement 'ol', treeClass
    for key of tree
      value = tree[key]
      
      li = makeElement 'li', itemClass

      # This value is itself an object (or array).
      # Create a collapsible item and recurse to populate it.
      if typeof value == 'object' and value != null
        li.setAttribute 'class', objectClass
        input = makeElement 'input'
        input.type = 'checkbox'
        input.id = key
        li.appendChild input
        label = makeElement 'label', labelClass, key
        label.setAttribute 'for', key
        li.appendChild label
        li.appendChild makeTree(value)

      # This value is a leaf. 
      # Create key-value item. Omit keys for array elements.
      else
        if Array.isArray(tree)
          li.innerHTML = value
        else
          li.appendChild makeElement 'span', keyClass, key
          li.appendChild makeElement 'span', valueClass, value

      retVal.appendChild li
    retVal

  { render: makeTree }
@kapok.render = @kapok().render
