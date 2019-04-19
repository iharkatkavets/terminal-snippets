
### Xcode -> Scheme -> Build -> Pre-actions
```bash
cd "${PROJECT_DIR}"

# redirect output to the file
exec > "${PROJECT_DIR}/pre_action.log" 2>&1

//update git submodule commands
echo "Updating git submodules..."
git submodule foreach git pull origin master
echo "...updating git submodules. Done"

BRAND_PATH="${PROJECT_DIR}/brands/ios/awesome/"
PROJ_RESOURCES_PATH="${PROJECT_DIR}/DefaultBrand/"

rsync -r --include="*.[Jj][Pp][Gg]" --include="*.[Pp][Nn][Gg]" --include="*/" --exclude="*" -av --progress ${BRAND_PATH} ${PROJ_RESOURCES_PATH}

${PROJECT_DIR}/scripts/writeplist.py -i "${BRAND_PATH}/Colors.plist" -o "${PROJ_RESOURCES_PATH}/Colors.plist"

${PROJECT_DIR}/scripts/writeplist.py -i "${BRAND_PATH}/Info.plist" -o "${PROJ_RESOURCES_PATH}/Info.plist"
```
