## First Time Setup on Windows 10/11

1. Set up WSL, VS Code, Hyper, OhMyZSH, Powerlevel10k by following the instructions [here](https://gist.github.com/AbhieSpeaks/a8ce8130cda913b16c39041034be2f25).
	- WSL
		- Gimmi uses Ubuntu, but any Linux distribution should be fine.
		- You may need to get the WSL2 Kernel update for Windows. More information about that can be found [here](https://superuser.com/questions/1709437/how-can-i-update-the-kernel-in-wsl2-kernel-to-latest-release).
		- More information about setting up WSL2 can be found on Microsoft's site [here](https://learn.microsoft.com/en-us/windows/wsl/install).
	- VS Code
		- Gimmi's configuration for `~/.zshrc` and VS Code `settings.json` can be found in the [broadband-config](https://github.com/iambroadband/configs) repo on GitHub.
		- Recommend signing in to VS Code with either your GitHub or Microsoft account so you can use Settings Sync and have your `settings.json` persist across machines.
	- OhMyZSH
		- Ignore PowerLevel9K in the original tutorial, get PowerLevel10K. Instructions can be found [here](https://github.com/romkatv/powerlevel10k#installation)
	- NVM and Node
		- You're likely to encounter some issues with "apt-key is deprecated" when installing yarn (and possibly other packages). There is some information about how to fix this [here](https://itsfoss.com/apt-key-deprecated/).
		- If you want to try to avoid this before installing, you can try this code block instead of the one in the tutorial for setting up yarn's pubkey.
			```
			curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/yarn.gpg
			```
2. Install ChromeDriver
	- [Setting Up Selenium](https://cloudbytes.dev/snippets/run-selenium-and-chrome-on-wsl2)
3. Install Poetry
	- [Introduction to Poetry](https://python-poetry.org/docs/)
	- `curl -sSL https://install.python-poetry.org | python3 -`
		- If you need to uninstall in the future: `curl -sSL https://install.python-poetry.org | python3 - --uninstall`
	- Updating your .zshrc
		- Add tab completion to zsh
			- `mkdir $ZSH_CUSTOM/plugins/poetry`
			- `poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry`
		- Add to your .zshrc if it's not already present
			- Add Poetry to PATH
				- `export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH`
			- Completions
				- Add `poetry` to your plugins
				- ```
					plugins(
							poetry
							...
						)
					```
		- `source ~/.zshrc`
	- check with `poetry --version`
4. Install dependencies with Poetry
	- `poetry install`
	- Check on your packages with `poetry show --tree`
5. Run `poetry run python3 main.py` to test
