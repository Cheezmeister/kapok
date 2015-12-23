
describe 'kapok', ->

  element = document.createElement 'ol'
  element.className = 'kapok-tree'

  it 'exists', ->
    expect(kapok).toBeDefined()

  it 'exposes render', ->
    expect(kapok.render).toBeDefined()

  it 'accepts an options hash', ->
    expect(kapok {}).toBeDefined()
    expect(kapok option: true).toBeDefined()

  it 'accepts a POJsO', ->
    expect(kapok.render {}).toEqual element

  it 'accepts a JSON string', ->
    expect(kapok.render '{}').toEqual element

  it 'spits out HTMLNodes', ->
    result = kapok.render('{}')
    expect(result.outerHTML).toEqual '<ol class="kapok-tree"></ol>'
    expect(result.innerHTML).toEqual ''
  
  it 'handles arrays too', ->
    expect(kapok.render '[]').toEqual element
    expect(kapok.render []).toEqual element

  it 'produces key-value pairs', ->
    result = kapok.render {foo: 'bar'}
    expect(result.children.length).toEqual 1
    expect(result.children[0].children.length).toEqual 2
    expect(result.children[0].children[0].innerHTML).toEqual 'foo'
    expect(result.children[0].children[1].innerHTML).toEqual 'bar'

  it 'produces value-only items for array elements', ->
    result = kapok.render ['justme']
    expect(result.children.length).toEqual 1
    expect(result.children[0].innerHTML).toEqual 'justme'

  it 'produces subtrees', ->
    result = kapok.render obj: {}
    expect(result.children.length).toEqual 1
    expect(result.children[0].children.length).toEqual 3
    expect(result.children[0].children[1].tagName).toEqual 'LABEL'
    expect(result.children[0].children[1].innerHTML).toEqual 'obj'


