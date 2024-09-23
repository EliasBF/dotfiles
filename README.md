# dotfiles

Este repositorio contiene mis archivos de configuracion para Nvim, Wezterm y otros.

## Instalacion

### Para Windows

**1. Instalar winget**

Usaremos winget para instalar los paquetes/programas necesarios.

Ingresar a https://winget.run/ para obtener el instalador de winget.

**2. Instalar WezTerm**

Para instalar WezTerm ejecutar el siguiente comando:

```
winget install wez.wezterm
```

Instalaremos la fuente **"Iosevka"** desde Nerd Fonts para personalizar la terminal y se vean correctamente los iconos en Nvim. Ingresar a https://www.nerdfonts.com/font-downloads y descargar **"Iosevka Nerd Font"**.

Descomprimir el zip e instalar todos los archivos de fuentes con la opcion **"Instalar"** del menu luego de hacer click derecho en los archivos.

Ahora copiar la carpeta `Wezterm/wezterm` dentro de la carpeta `~/.config`.

**3. Configurar prompt de powershell**

Instalar **Oh My Posh** con el siguiente comando:

```
winget install JanDeDobbeleer.OhMyPosh -s winget
```

Editar el archivo de configuracion de powershell. Se puede obtener la ruta de ese archivo con la variable de entorno `$PROFILE`.

Para editar con VSCode podemos ejecutar el comando:

```
code $PROFILE
```

Agregar esta linea al final del archivo:

```
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/avit.omp.json" | Invoke-Expression
```

**4. Instalar Nvim**

Para instalar Nvim ejecutar el siguiente comando:

```
winget install Neovim.Neovim
```

Utilizaremos **LazyVim** para obtener un entorno de desarrollo completo en Nvim.

Primero instalamos algunas dependencias de **LazyVim**:

```
winget install sharkdp.fd
winget install BurntSushi.ripgrep.MSVC
winget install Git.Git
winget install JesseDuffield.lazygit
```

Instalamos esto ultimo como administrador:

```
winget install zig.zig
```

Ahora copiar la carpeta `Nvim/nvim` dentro de la carpeta de datos de aplicaciones de nuestro usuario. Podemos obtener esta ruta con la variable de entorno `$LOCALAPPDATA`.

Ahora podemos iniciar Nvim con el comando:

```
nvim
```

Y esperar a que **LazyVim** se termine de instalar.

---

### Para Linux/Ubuntu

**1. Actualizar repositorios de paquetes e instalar git**

```
sudo apt update -y
sudo apt install -y git
```

Necesitamos git como requisito para instalar todo lo siguiente.

**2. Instalar Fish**

Utilizaremos **fish** como shell de linea de comandos.

Instalar con el siguiente comando:

```
sudo apt install fish
```

Configuramos **fish** como nuestra shell por defecto para nuestro usuario con el comando:

```
chsh -s /usr/bin/fish
```

Instalamos **Oh My Fish** para obtener una configuracion y paquetes que nos permitan gestionar mejor **fish**.

```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

Crearemos un nuevo tema en **Oh My Fish** para obtener un prompt similar al que configuramos en Windows con **Oh My Posh**.

Primero creamos un nuevo directorio dentro de la carpeta de temas de **Oh My Fish**:

```
mkdir ~/.local/share/omf/themes/avit
```

Copiar el archivo `Fish/fish_prompt.fish` dentro del nuevo directorio.

Configurar el nuevo tema en **fish**

```
omf theme avit
```

**3. Instalar WezTerm**

Instalar con los siguientes comandos:

```
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg

echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

sudo apt update -y

sudo apt install -y wezterm
```

Instalaremos la fuente **"Iosevka"** desde Nerd Fonts para personalizar la terminal y se vean correctamente los iconos en Nvim. Ingresar a https://www.nerdfonts.com/font-downloads y descargar **"Iosevka Nerd Font"**.

Descomprimir el zip y mover todos los archivos de fuentes dentro de la carpeta `~/.local/share/fonts`.

Ahora copiar la carpeta `Wezterm/wezterm` dentro de la carpeta `~/.config`.

**4. Instalar Nvim**

Para instalar Nvim ejecutar el siguiente comando:

```
sudo apt install -y neovim
```

Utilizaremos **LazyVim** para obtener un entorno de desarrollo completo en Nvim.

Primero instalamos algunas dependencias de **LazyVim**:

```
sudo apt install -y gcc ripgrep fd fd-find luarocks
```

Instalamos lazygit, otra dependencia de Nvim:

```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

tar xf lazygit.tar.gz lazygit

sudo install lazygit /usr/local/bin
```

Ahora copiar la carpeta `Nvim/nvim` dentro de la carpeta `~/.config`.

Ahora podemos iniciar Nvim con el comando:

```
nvim
```

Y esperar a que **LazyVim** se termine de instalar.