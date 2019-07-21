tap 'OJFord/formulae'

brew 'awscli'
brew 'bat'
brew 'fd'
brew 'htop'
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

cask 'docker'
cask 'keybase'
cask 'slack'

Dir.glob(File.join(File.dirname(__FILE__), '*', '**', 'Brewfile')) do |brewfile|
    eval(IO.read(brewfile), binding)
end
