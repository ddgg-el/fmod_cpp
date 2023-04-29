### Test Repository for FMOD C++ integration

### Compile
```
$ cd <path/to/folder>
$ make
```
the compiled file is called `fmod_start` that you can simply launch with:
```
$ ./fmod_start
```
if you change something in your code you can simply recompile the binarues again with the `make`command.

<b> The program as it is, will search for a `1.wav` file inside the `media` folder.</b>
 You can change this behaviour by editing `src/simple_fmod_start.cpp` on line 49:
```c++
system->createSound("./media/1.wav", FMOD_DEFAULT, nullptr, &sound);
```
into
```c++
system->createSound("./whatever/you/want.wav", FMOD_DEFAULT, nullptr, &sound);
```
if you are facing linking problem or you want to rebuild the project just run...
```
$ make clean
```
...before recompiling

### MacOS
If you are facing `code signature` issue I would suggest you to disable the OS Gatekeeper by running:
```
$ sudo spctl --master-disable
```
you can later reanable Gatekeeper with:
```
$ sudo spctl --master-enable
```
but there are probably others workarounds