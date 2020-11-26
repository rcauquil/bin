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
		echo '$(*):$($(*))   DRY is $(DRY)'; \
		if [ ! -e '$($(*))' ]; then \
			echo '$(*): $($(*)) doest not exist, please verify your path' && exit 1; \
		fi \
	fi

# FOLDERS
# ------------------------

# ALL
all: sync-bin sync-ssh sync-documents sync-pictures sync-music sync-marie sync-videos sync-workspaces sync-projects
.PHONY: all

# BIN
%-bin: SRC = ~/bin/
%-bin: DST = $(DEST)/bin

# SSH
%-ssh: SRC = ~/.ssh/
%-ssh: DST = $(DEST)/.ssh

# DOCUMENTS
%-documents: SRC = ~/Documents/
%-documents: DST = $(DEST)/Documents

# IMAGES
%-pictures: SRC = ~/Pictures/
%-pictures: DST = $(DEST)/Pictures

# MUSIC
%-music: SRC = ~/Music/
%-music: DST = $(DEST)/Music

# VIDEOS
%-videos: SRC = ~/Videos/
%-videos: DST = $(DEST)/Videos

# WORKSPACES
%-workspaces: SRC = ~/Workspaces/
%-workspaces: DST = $(DEST)/Workspaces

# PROJECTS
%-projects: SRC = ~/Projects/
%-projects: DST = $(DEST)/Projects
%-projects: FILTER = -f 'merge ./sync/filter-projects'

# MARIE
%-marie: SRC = ~/Marie/
%-marie: DST = $(DEST)/Marie

# SYNC
# ------------------------

# Sync to an external drive
sync-%: guardPath-DEST
	@rsync $(DRY) -avzP --delete --delete-excluded --delete-during -f 'merge ./sync/filter' $(FILTER) $(SRC) $(DST)
