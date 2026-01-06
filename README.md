# Конфигурация рабочего окружения ZSH

Этот репозиторий содержит настройки для быстрого развертывания рабочего окружения на базе ZSH в любой Linux-системе, включая WSL.

## Подготовка окружения

### Установка WSL (Windows Subsystem for Linux)

Выполните следующие команды в PowerShell или командной строке Windows:

```powershell
# Установка Debian на WSL
wsl --install -d Debian

# Установка WSL версии 2 по умолчанию
wsl --set-default-version 2
```

### Настройка Git в WSL

```bash
# Обновление пакетов и установка Git
sudo apt update
sudo apt install -y git

# Настройка Git
git config --global alias.st status
git config --global user.name "Father1993"
git config --global user.email "enjoyhillol@gmail.com"

# Настройка корректного отображения кириллических имен файлов
git config --global core.quotepath false
```

### Клонирование репозитория с настройками

```bash
# Клонирование репозитория
git clone https://github.com/Father1993/custom-settings.git
```

## Установка и настройка компонентов

### Установка основных Linux-инструментов

```bash
# Установка основных инструментов
sudo apt install -y zsh git gpg pass zip unzip curl wget tmux gcc bsdmainutils htop fzf bat ripgrep build-essential neofetch meson

# Создание символической ссылки для bat
sudo ln -s $(which batcat) /usr/local/bin/bat
```

### Настройка Alacritty

```bash
# Создание директории для конфигурации Alacritty в Windows
mkdir -p /mnt/c/Users/Anri/AppData/Roaming/alacritty

# Копирование конфигурации Alacritty в Windows
cp $HOME/custom-settings/.config/alacritty/alacritty.toml \
    /mnt/c/Users/Anri/AppData/Roaming/alacritty/

# Настройка тем для Alacritty
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

### Установка шрифтов

Для корректного отображения иконок и символов в терминале рекомендуется установить Hack Nerd Font:

```bash
# GNU/Linux
sudo apt install -y fonts-hack-ttf

# Или скачайте шрифт с официального сайта:
# https://www.nerdfonts.com/font-downloads
```

Hack Nerd Font — это модификация шрифта Hack (версия 3.003), оптимизированная для программирования. Особенности:

-   Чёткий дизайн с хорошей читаемостью даже при малых размерах
-   Чётко различимый нуль с точкой внутри
-   Короткие нижние выносные элементы для более компактного отображения кода
-   Основан на работе, проделанной для Bitstream Vera и DejaVu
-   Включает множество дополнительных иконок и символов для разработчиков

### Настройка ZSH и Oh-My-ZSH

```bash
# Копирование конфигурационных файлов ZSH
mkdir -p ~/.config/zsh
cp -r custom-settings/.config/zsh/* ~/.config/zsh/
cp custom-settings/.zshrc ~/.zshrc

# Установка Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Добавление конфигурации в .zshrc
echo "source \$HOME/.config/zsh/env.zsh" >> ~/.zshrc
echo "source \$HOME/.config/zsh/aliases.zsh" >> ~/.zshrc

# Установка плагинов ZSH
# Если плагины уже установлены, эти команды можно пропустить
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Установка ZSH как оболочки по умолчанию
chsh -s $(which zsh)
```

### Настройка Neofetch

```bash
# Создание директории для конфигурации Neofetch
mkdir -p ~/.config/neofetch

# Копирование конфигурации Neofetch
cp custom-settings/.config/neofetch/config.conf ~/.config/neofetch/
```

### Настройка Facad

```bash
git clone https://github.com/yellow-footed-honeyguide/facad.git
cd facad
meson setup build && meson compile -C build
# now facad binary in build dir

# for system-wide installation (may require elevated privileges like `sudo`):
cd build && sudo ninja install
```

### Настройка Neovim

```bash
# Создание директории для программ
mkdir -p ~/.soft

# Загрузка и установка Neovim
wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
mv nvim-linux64 ~/.soft/nvim
sudo ln -s $HOME/.soft/nvim/bin/nvim /usr/local/bin/nvim

# Настройка алиасов для Neovim
echo "alias n=nvim" >> ~/.zshrc && source ~/.zshrc
echo "export EDITOR=vim" >> ~/.zshrc && source ~/.zshrc
```

## Настройки для Windows

### Улучшение отзывчивости клавиатуры

Для уменьшения задержки при вводе повторных символов:

1. Нажмите Win + R
2. Введите `control keyboard` и нажмите Enter
3. В окне "Свойства клавиатуры" в разделе "Задержка перед началом повторения" (Repeat delay) установите ползунок ближе к значению "Короткая" (Short)

### Типографская раскладка Бирмана

Раскладка Бирмана позволяет быстро вводить специальные символы типографики (кавычки, тире и т.д.) с помощью сочетаний клавиш.

Скачать и узнать подробности: [Типографская раскладка Ильи Бирмана](https://ilyabirman.ru/typography-layout/)

### Настройка Caps Lock как Ctrl

Файл `caps.reg` в репозитории изменяет поведение клавиши Caps Lock, превращая её в дополнительную клавишу Ctrl, что удобно для многих команд в терминале и текстовых редакторах.

Для применения:

1. Дважды кликните по файлу `caps.reg` в проводнике Windows
2. Подтвердите внесение изменений в реестр
3. Перезагрузите компьютер для применения изменений

## Содержимое репозитория

### Структура каталогов

```
custom-settings/
├── .config/
│   ├── alacritty/
│   │   └── alacritty.toml
│   ├── neofetch/
│   │   └── config.conf
│   └── zsh/
│       ├── aliases.zsh
│       └── env.zsh
└── .zshrc
```

### Компоненты

#### ZSH

-   `.zshrc` - основной конфигурационный файл ZSH, настраивающий тему, плагины и базовые параметры
-   `.config/zsh/aliases.zsh` - пользовательские сокращения (алиасы) для часто используемых команд
-   `.config/zsh/env.zsh` - настройки переменных окружения

#### Терминал Alacritty

-   `.config/alacritty/alacritty.toml` - конфигурация терминального эмулятора Alacritty с настройками темы, шрифтов и горячих клавиш

#### Утилиты

-   `.config/neofetch/config.conf` - настройки Neofetch для отображения информации о системе

## Основные возможности

1. **Оптимизированный ZSH**:

    - Тема robbyrussell
    - Плагины: git, syntax-highlighting, autosuggestions, completions
    - Удобные алиасы для часто используемых команд

2. **Настроенный Alacritty**:

    - Тема Kanagawa Dragon
    - Шрифт Hack Nerd Font
    - Оптимизированные горячие клавиши

3. **Дополнительные утилиты**:
    - Функция генерации паролей (pwgen)
    - Настроенный Neofetch

## Системные требования

-   Linux-система (включая WSL)
-   Установленный ZSH
-   Oh-My-ZSH
-   Alacritty (опционально)
-   Neofetch (опционально)

## Устранение проблем

Если у вас возникли проблемы при установке или использовании конфигурации, проверьте следующее:

1. **Шрифты отображаются некорректно**:

    - Установите шрифт Hack Nerd Font: `sudo apt install fonts-hack-ttf` (для Debian/Ubuntu)
    - Для других дистрибутивов скачайте шрифт с [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

2. **Плагины не работают**:
    - Убедитесь, что плагины правильно установлены в директорию `~/.oh-my-zsh/custom/plugins/`
    - Проверьте, что они подключены в файле `.zshrc` в секции `plugins=(...)`
