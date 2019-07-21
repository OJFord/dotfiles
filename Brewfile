tap 'OJFord/formulae'

brew 'bat'
brew 'fd'
brew 'lsd'
brew 'prettyping'
brew 'kubectx'
brew 'packer'
brew 'parallel'
brew 'passbase'
brew 'pstree'
brew 'ranger'
brew 'ripgrep'
brew 'shellcheck'
brew 'stern'
brew 'terraform'
brew 'wget'

cask 'keybase'
cask 'slack'

Dir.glob(File.join(File.dirname(__FILE__), '*', '**', 'Brewfile')) do |brewfile|
    eval(IO.read(brewfile), binding)
end
