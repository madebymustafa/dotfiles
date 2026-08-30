
# Setting PATH for Python 3.14
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"
export PATH

# Make 'python' usable as an alias for python3
if command -v python3.14 >/dev/null 2>&1; then
  alias python='python3.14'
fi
