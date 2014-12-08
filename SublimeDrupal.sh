#!/bin/bash

# Attempt OS detection to set path
os=`uname`;
phpcs=`which phpcs`;

# ST2 Packages directory
if [ $os = 'Linux' ]
then
  st2Dir=~/".config/sublime-text-2/Packages/"
else
  # Assume OSX
  st2Dir=~/"Library/Application Support/Sublime Text 2/Packages/"
fi

# Navigate to Packages DirectoryCKAGE
cd "$st2Dir";

# User Packages Directory
st2UserDir="$st2Dir"User/;

# Default Settings File
st2Settings="$st2UserDir"Preferences.sublime-settings;


# Default Preferences fork for enzo
if [ ! -d "DrupalSublimeConfig" ]; then
 git clone https://github.com/enzolutions/drupal-sublime-config.git DrupalSublimeConfig;
else
  echo "Updating plugin DrupalSublimeConfig";
  cd "DrupalSublimeConfig"
  git pull origin master
  cd ..
fi

# Back up old PHP settings file
if [ -f "$st2UserDir"PHP.sublime-settings ]; then
  echo "Backing up previous version of PHP.sublime-settings...";
  sudo cp -Lf "$st2UserDir"PHP.sublime-settings "$st2UserDir"PHP.sublime-settings.bak;
fi

# Link up new PHP settings file
echo "Linking up settings PHP.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/PHP.sublime-settings "$st2UserDir"PHP.sublime-settings;

# Back up old Preferences settings file
if [ -f "$st2UserDir"Preferences.sublime-settings ]; then
  echo "Backing up previous version of Preferences.sublime-settings...";
  sudo cp -Lf "$st2UserDir"Preferences.sublime-settings "$st2UserDir"Preferences.sublime-settings.bak;
fi

# Link up new settings file
echo "Linking up settings Preferences.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/Preferences.sublime-settings "$st2Settings";

# Back up old SublimeLinter settings file
if [ -f "$st2UserDir"SublimeLinter.sublime-settings ]; then
  echo "Backing up previous version of SublimeLinter.sublime-settings...";
  sudo cp -Lf "$st2UserDir"SublimeLinter.sublime-settings "$st2UserDir"SublimeLinter.sublime-settings.bak;
fi

# Link up new settings file
echo "Linking up settings SublimeLinter.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/SublimeLinter.sublime-settings "$st2UserDir"SublimeLinter.sublime-settings;

# Back up old GitGutter settings file
if [ -f "$st2UserDir"GitGutter.sublime-settings ]; then
  echo "Backing up previous version of GitGutter.sublime-settings...";
  sudo cp -Lf "$st2UserDir"GitGutter.sublime-settings "$st2UserDir"GitGutter.sublime-settings.bak;
fi

# Link up new settings file
echo "Linking up settings GitGutter.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/GitGutter.sublime-settings "$st2UserDir"GitGutter.sublime-settings;

# Back up old Highlighter settings file
if [ -f "$st2UserDir"Highlighter.sublime-settings ]; then
  echo "Backing up previous version of Highlighter.sublime-settings...";
  sudo cp -Lf "$st2UserDir"Highlighter.sublime-settings "$st2UserDir"Highlighter.sublime-settings.bak;
fi

# Link up new settings file
echo "Linking up settings Highlighter.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/Highlighter.sublime-settings "$st2UserDir"Highlighter.sublime-settings;


# Clone all the plugins!
if [ ! -d "PACKAGE CONTROL" ]; then
  git clone https://github.com/wbond/sublime_package_control.git "Package Control";
else
 echo "Updating plugin Package Control";
 cd "Package Control"
 git pull origin master
 cd ..
fi

# BracketHighlighter
if [ ! -d "BracketHighlighter" ]; then
 git clone https://github.com/facelessuser/BracketHighlighter.git BracketHighlighter;
 else
  echo "Updating plugin BracketHighlighter";
  cd "BracketHighlighter"
  git pull origin master
  cd ..
fi

# Highlighter
if [ ! -d "Highlighter" ]; then
 git clone git@github.com:bluegray/Highlighter.git Highlighter;
 else
  echo "Updating plugin Highlighter";
  cd "Highlighter"
  git pull origin master
  cd ..
fi

# ApplySyntax
if [ ! -d "ApplySyntax" ]; then
 git clone git@github.com:facelessuser/ApplySyntax.git ApplySyntax;
 else
  echo "Updating plugin Apply Syntax";
  cd "ApplySyntax"
  git pull origin master
  cd ..
fi

# Pretty YAML
if [ ! -d "PrettyYAML" ]; then
 git clone git@github.com:aukaost/SublimePrettyYAML.git PrettyYAML;
 else
  echo "Updating plugin PrettyYAML";
  cd "PrettyYAML"
  git pull origin master
  cd ..
fi

# DocBlockr
if [ ! -d "DocBlockr" ]; then
 git clone https://github.com/spadgos/sublime-jsdocs.git DocBlockr;
else
  echo "Updating plugin DocBlockr";
  cd "DocBlockr"
  git pull origin master
  cd ..
fi

# LiveCSS
if [ ! -d "LiveCSS" ]; then
 git clone git://github.com/niklas-heer/sublime-css-colors.git LiveCSS;
else
  echo "Updating plugin LiveCSS";
  cd "LiveCSS"
  #support for previous installation the project was moved from https://github.com/a-sk/livecss
  git remote set-url origin git://github.com/niklas-heer/sublime-css-colors.git
  git pull origin master
  cd ..
fi

# GotoDrupalAPI
if [ ! -d "Sublime-Text-2-Goto-Drupal-API" ]; then
 git clone https://github.com/BrianGilbert/Sublime-Text-2-Goto-Drupal-API.git;
else
  echo "Updating plugin Sublime-Text-2-Goto-Drupal-API";
  cd "Sublime-Text-2-Goto-Drupal-API"
  git pull origin master
  cd ..
fi

# Drupal Sublime Snippets
if [ ! -d "DrupalSublimeSnippets" ]; then
 git clone https://github.com/juhasz/drupal_sublime-snippets.git DrupalSublimeSnippets;
else
  echo "Updating plugin DrupalSublimeSnippets";
  cd "DrupalSublimeSnippets"
  git pull origin master
  cd ..
fi

# DrupalCodingStandard Fork
if [ ! -d "DrupalCodingStandard" ]; then
 git clone https://github.com/rypit/DrupalCodingStandard.git DrupalCodingStandard;
else
  echo "Updating plugin DrupalCodingStandard";
  cd "DrupalCodingStandard"
  git pull origin master
  cd ..
fi

#PHP Syntax Checker
#git clone git://github.com/naomichi-y/php_syntax_checker.git

# Address pathing issues with DrupalCodingStandard's phpcs path
if [ -d /usr/bin/phpcs ]; then
  # Control will enter here if $DIRECTORY exists.
  echo "Setting a symlink to phpcs for DrupalCodingStandard..."
  sudo ln -s "$phpcs" /usr/bin/phpcs
fi

# Goto Documentation
if [ ! -d "sublime-text-2-goto-documentation" ]; then
 git clone https://github.com/kemayo/sublime-text-2-goto-documentation;
else
  echo "Updating plugin sublime-text-2-goto-documentation";
  cd "sublime-text-2-goto-documentation"
  git pull origin master
  cd ..
fi

# Synced SideBar
if [ ! -d "SyncedSideBar" ]; then
 git clone git://github.com/sobstel/SyncedSideBar;
else
  echo "Updating plugin SyncedSideBar";
  cd "SyncedSideBar"
  git pull origin master
  cd ..
fi

# Traling Spaces
if [ ! -d "TrailingSpaces" ]; then
 git clone https://github.com/SublimeText/TrailingSpaces.git;
else
  echo "Updating plugin TrailingSpaces";
  cd "TrailingSpaces"
  git pull origin master
  cd ..
fi

# Drupal AutoComplete
if [ ! -d "st2-drupal-autocomplete" ]; then
 git clone git://github.com/tanc/st2-drupal-autocomplete.git;
else
  echo "Updating plugin st2-drupal-autocomplete";
  cd "st2-drupal-autocomplete"
  git pull origin master
  cd ..
fi

# To-Do: Test other version  right now takes to much time
# Find Function Definition
#if [ ! -d "sublime-find-function-definition" ]; then
# git clone git://github.com/timdouglas/sublime-find-function-definition.git;
#else
#  echo "Updating Find Function Definition";
#  cd "sublime-find-function-definition"
#  git pull origin master
#  cd ..
#fi

# Git
if [ ! -d "sublime-text-2-git" ]; then
 git clone https://github.com/kemayo/sublime-text-2-git.git;
else
  echo "Updating plugin Git";
  cd "sublime-text-2-git"
  git pull origin master
  cd ..
fi

# GitGutter
if [ ! -d "GitGutter" ]; then
 git clone git://github.com/jisaacks/GitGutter.git;
else
  echo "Updating plugin GitGutter";
  cd "GitGutter"
  git pull origin master
  cd ..
fi

# SideBarGit
if [ ! -d "SideBarGit" ]; then
 git clone git://github.com/SublimeText/SideBarGit.git;
else
  echo "Updating plugin SideBarGit";
  cd "SideBarGit"
  git pull origin master
  cd ..
fi

# SublimeLinter
if [ ! -d "SublimeLinter" ]; then
 git clone git://github.com/SublimeLinter/SublimeLinter.git
else
  echo "Updating plugin SublimeLinter";
  cd "SublimeLinter"
  git pull origin master
  cd ..
fi

# SASS
if [ ! -d "SASS" ]; then
 git clone git@github.com:nathos/sass-textmate-bundle.git SASS;
else
  echo "Updating plugin SASS";
  cd "SASS"
  git pull origin master
  cd ..
fi

# CssSnippets
if [ ! -d "CssSnippets" ]; then
 git clone git@github.com:P233/Emmet-Css-Snippets-for-Sublime-Text-2.git CssSnippets;
else
  echo "Updating plugin CssSnippets";
  cd "CssSnippets"
  git pull origin master
  cd ..
fi

# JSLint
if [ ! -d "JSLint" ]; then
 git clone git@github.com:darrenderidder/Sublime-JSLint.git JSLint;
else
  echo "Updating plugin JSLint";
  cd "JSLint"
  git pull origin master
  cd ..
fi

#Specific plugings for MAC
if [ $os != 'Linux' ]; then
  # MacTerminal
  if [ ! -d "MacTerminal" ]; then
     git clone https://github.com/afterdesign/MacTerminal.git
   else
    echo "Updating plugin MacTerminal";
    cd "MacTerminal"
    git pull origin master
    cd ..
  fi

   if [ -d "/Applications/iTerm.app" ]; then
    # Back up old MacTerminal settings file
    if [ -f "$st2UserDir"MacTerminal.sublime-settings ]; then
      echo "Backing up previous version of MacTerminal.sublime-settings...";
      sudo cp -Lf "$st2UserDir"MacTerminal.sublime-settings "$st2UserDir"MacTerminal.sublime-settings.bak;
    fi

    # Link up new PHP settings file
    echo "Linking up settings MacTerminal.sublime-settings..."
    ln -fs "$st2Dir"DrupalSublimeConfig/MacTerminal.sublime-settings "$st2UserDir"MacTerminal.sublime-settings;
   fi
fi

# Soda Theme
if [ ! -d "Theme - Soda" ]; then
 git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"
else
  echo "Updating plugin Theme - Soda";
  cd "Theme - Soda"
  git pull origin master
  cd ..
fi

# fetch specific color schemas for soda theme

cd "Theme - Soda"
if [ ! -f "colour-schemes.zip" ]; then
 curl -OLk https://buymeasoda.github.com/soda-theme/extras/colour-schemes.zip;
else
 rm colour-schemes.zip
 curl -OLk https://buymeasoda.github.com/soda-theme/extras/colour-schemes.zip
fi
yes | unzip colour-schemes.zip

echo "Done";
