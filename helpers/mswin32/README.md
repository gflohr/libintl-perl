# Helpers for MS-DOS/MS-Windows

## C Sharp Program

The file `Program.cs` is a c-sharp program that lists all locales on the
system.  You can build and run it like this:

```c-sharp
$ dotnet run >locales.txt
```

You must has a .NET SDK installed.

You can then generate the lookup tables in `Locale::Util` from the generated
file with this commmand:

```perl
$ perl ms-win32-lookups <locales.txt 
```
