YAML = require('yamljs')
Path = require('path')
_ = require('lodash')
argv = require('yargs').argv


faFontelloConfigPath = Path.join(__dirname, 'bower_components/awesome-uni.font/config.yml')
faFontelloConfig = YAML.load(faFontelloConfigPath)

faVars = require('./faVariables.coffee')

ngGridConfigPath = Path.join(__dirname, 'bower_components/angular-ui-grid/src/font/config.json')
ngGridConfig = require(ngGridConfigPath)


# fontello uid -> font-awesome content
getFaContent = (uid) ->

  # this is spin5 by fontelico, we substitute it with
  # fa-spinner (http://fontawesome.io/icon/spinner/)
  if uid == '5d2d07f112b8de19f2c0dbfec3e42c05'
    return '\\f110'

  glyph = _.find(faFontelloConfig.glyphs, {uid: uid})
  return '' unless glyph
  return '\\' + (glyph.from or glyph.code).toString(16)

# fa content -> fa variable
getFaVar = (content) ->
  _.findKey(faVars, (_content) -> _content == content)


result = ''

if argv.less
  result += "@import \"/path/to/font-awesome/less/variables\";\n"

result += """
[class^="ui-grid-icon"]:before, [class*=" ui-grid-icon"]:before {
  font-family: "FontAwesome";
}

"""

for glyph in ngGridConfig.glyphs
  result += ".ui-grid-icon-#{glyph.css}:before {\n"

  content = getFaContent(glyph.uid)

  if argv.less
    result += "  content: #{getFaVar(content)};\n"

  else
    result += "  content: \"#{content}\";\n"

  result += "}\n"

console.log(result)

return
