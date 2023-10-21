const { withDangerousMod, withPlugins } = require( '@expo/config-plugins' )
const fs = require( 'fs' )
const path = require( 'path' )

async function readFile( path ) {
  return fs.promises.readFile( path, 'utf8' )
}

async function saveFile( path, content ) {
  return fs.promises.writeFile( path, content, 'utf8' )
}

module.exports = ( config, props ) => withPlugins( config, [ ( config ) => {
  return withDangerousMod( config, [
    'ios',
    async ( config ) => {
      const file2Replace = path.join(config.modRequest.projectRoot, props.file)
      const file2ReplaceContent = await readFile(file2Replace)

      const file = path.join( config.modRequest.platformProjectRoot, 'Podfile' )
      await saveFile(file, file2ReplaceContent)
      return config
    }
  ] )
} ] )