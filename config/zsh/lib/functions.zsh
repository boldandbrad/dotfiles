# update the created and modified date for all images in the current directory to match their exif create date
function exifupdate() {
  if type exiftool &>/dev/null; then
    for file in *; do
      exifdate="$(exiftool -p '$CreateDate' -d '%m/%d/%Y %H:%M:%S' "$file")"
      if [ ! -z $exifdate ]; then
        SetFile -d "$exifdate" "$file"
        SetFile -m "$exifdate" "$file"
        echo "Updated dates for $file"
      else
        echo "ERROR: File skipped. No exif date found for $file"
      fi
    done
  else
    echo "exiftool not found. Install with 'brew install exiftool'"
  fi
}

# trash <files> - move files to trash
function trash() {
  mv "$@" ~/.Trash
}

# yazi change cwd when exiting
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
