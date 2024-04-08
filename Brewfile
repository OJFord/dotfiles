tap 'OJFord/formulae'

brew 'bat'
brew 'curl', link: 'force'
brew 'fd'
brew 'git', link: 'force'
brew 'jq'
brew 'lsd'
brew 'prettyping'
brew 'kubectx'
brew 'packer'
brew 'parallel'
brew 'pre-commit'
brew 'pstree'
brew 'ranger'
brew 'ripgrep'
brew 'shellcheck'
brew 'stern'
brew 'wget', link: 'force'
brew 'yarn'

cask 'dbeaver-community'
cask 'slack'

Dir.glob(File.join(File.dirname(__FILE__), '*', '**', 'Brewfile')) do |brewfile|
    eval(IO.read(brewfile), binding)
end
