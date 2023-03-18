#!/bin/sh

sudo apt-get update
sudo apt-get install curl vim net-tools apt-transport-https

# Brave Browser (see https://brave.com/linux/)
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update

sudo apt-get install blender openscad freecad gimp gimp-help-de language-pack-gnome-de inkscape sonic-pi mu-editor brave-browser

sudo snap install --classic code
sudo snap install chromium chromium-ffmpeg 
sudo snap install discord
sudo snap install arduino

# Processing 4.2
curl -L https://github.com/processing/processing4/releases/download/processing-1292-4.2/processing-4.2-linux-x64.tgz | tar -xz
sudo mkdir /opt/processing
sudo cp -r processing-4.2/* /opt/processing/

sudo sh -c 'echo "#!/usr/bin/env xdg-open" > /usr/share/applications/processing.desktop'
sudo sh -c 'echo "[Desktop Entry]" >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Version=4.0b3 " >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Name=Processing " >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Comment=graphics and animation language " >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Exec=/opt/processing/processing" >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Icon=/opt/processing/lib/icons/pde-256.png" >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Terminal=false" >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Type=Application" >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "Categories=AudioVideo;Video;Graphics;" >> /usr/share/applications/processing.desktop'
sudo sh -c 'echo "StartupWMClass=Processing" >> /usr/share/applications/processing.desktop'

# Volta (nodejs installer)
curl https://get.volta.sh | bash
source ~/.bashrc
volta install node yarn


# Sublime Text 4 (from http://www.sublimetext.com/docs/linux_repositories.html)
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text



# Set favorite apps
gsettings set org.gnome.shell favorite-apps "['brave-browser.desktop', 'org.gnome.Terminal.desktop', 'sublime_text.desktop', 'code_code.desktop', 'processing.desktop', 'mu.codewith.editor.desktop', 'arduino_arduino.desktop', 'org.inkscape.Inkscape.desktop', 'blender.desktop', 'openscad.desktop', 'discord_discord.desktop', 'org.gnome.Nautilus.desktop']" 
# TODO: SonicPI not included, because it fails to start on Ubuntu 21.10