stow:
	stow --dotfiles .

test:
	stow -n --dotfiles .

clean:
	stow -D --dotfiles .
