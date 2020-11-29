# UTILS
# ------------------------

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

ifeq ($(DRY), false)
	override DRY =
else
	override DRY = --dry-run
endif

guardPath-%:
	@if [ -z '$($(*))' ]; then \
		echo '$(*) must be set, please add it in .env' && exit 1; \
	else \
		if [ ! -e '$($(*))' ]; then \
			echo '$(*): $($(*)) doest not exist, please verify your path' && exit 1; \
		fi \
	fi

# FOLDERS
# ------------------------

# ALL
all: sync-bin \
	sync-ssh \
	sync-config \
	sync-documents \
	sync-marie \
	sync-music \
	sync-pictures \
	sync-projects \
	sync-videos \
	sync-workspaces
.PHONY: all

# BIN
%-bin: SRC = ~/bin/
%-bin: DST = $(DEST)/bin

# SSH
%-ssh: SRC = ~/.ssh/
%-ssh: DST = $(DEST)/.ssh

# CONFIG
%-config: SRC = ~/config/
%-config: DST = $(DEST)/config

# DOCUMENTS
%-documents: SRC = ~/Documents/
%-documents: DST = $(DEST)/Documents

# MARIE
%-marie: SRC = ~/Marie/
%-marie: DST = $(DEST)/Marie

# MUSIC
%-music: SRC = ~/Music/
%-music: DST = $(DEST)/Music

# PICTURES
%-pictures: SRC = ~/Pictures/
%-pictures: DST = $(DEST)/Pictures

# PROJECTS
%-projects: SRC = ~/Projects/
%-projects: DST = $(DEST)/Projects
%-projects: FILTER = -f 'merge ./sync/filter-projects'

# VIDEOS
%-videos: SRC = ~/Videos/
%-videos: DST = $(DEST)/Videos

# WORKSPACES
%-workspaces: SRC = ~/Workspaces/
%-workspaces: DST = $(DEST)/Workspaces

# SYNC
# ------------------------

# Sync to an external drive
sync-%: guardPath-DEST
	@rsync $(DRY) -avzP --delete --delete-excluded --delete-during -f 'merge ./sync/filter' $(FILTER) $(SRC) $(DST)
