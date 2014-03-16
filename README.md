panda
=====

Set to cross-compile from OSX to a pandaboard running Ubuntu 12.04LTS (Precise Pangolin).

Doesn't seem to work at the moment with the stock OSX LLVM; I'm using the most recent LLVM from git:

    git clone http://llvm.org/git/llvm.git
    mkdir llvm_build
    cd llvm_build
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX="$(dirname "$(pwd)")"/llvm_install -DLLVM_BUILD_EXAMPLES=ON -DLLVM_BUILD_TESTS=ON ../llvm

Afterwards install the binutils version from this package using brew

    brew install binutils-arm-none-linux-gnueabihf.rb

And then it works! For me at least.... If you want to try this with another version of ubuntu.... You need to copy the /usr/lib, /usr/include and /lib directories from the pandaboard to this directory.
However first they need to contain the development headerfiles etc (I'm not exactly sure what), an {apt-get install llvm} on the pandaboard seemed to do the trick (add the universal aptitude source first).
