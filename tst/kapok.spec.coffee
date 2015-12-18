
describe 'kapok', ->

  element = document.createElement 'ol'
  element.className = 'kapok-tree'

  it 'exists', ->
    expect(kapok).toBeDefined()

  it 'exposes render', ->
    expect(kapok.render).toBeDefined()

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

