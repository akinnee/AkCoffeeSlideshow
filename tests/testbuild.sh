# This should be removed if a build process is set up to keep the codebase DRY.
# For now, I see no reason for a real build process (like grunt) because the code
# is only 2 files; the AkCoffeeSlideshow class, and the AkCoffeeSlideshow_spec test
# file.

# The paths are relative from the testem.json file in the root of the repo
coffee -o ./build/ -c ./source/*.coffee;
coffee -c ./tests/*.coffee;