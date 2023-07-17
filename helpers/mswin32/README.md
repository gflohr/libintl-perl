# Helpers for MS-DOS/MS-Windows

## C Sharp Program

The file `Program.cs` is a c-sharp program that lists all locales on the
system.  You can build and run it like this:

```sh
$ dotnet run >locales-utf-16le.txt
```

You must has a .NET SDK installed.

The output is in a bastardized UTF-16 encoding.  Convert it to UTF-8 like this:

```sh
$ iconv --from-code=UTF-16 --to-code=UTF-8 locales-utf-16le.txt >locales.txt
 ```

Bastardized UTF-16 because all non US-ASCII characters are encoded multiple
times.  But that happens only, when you generate the list on an MS-DOS system.
On a Mac, the output is a in UTF-8 but unfortunately shortened.  I therefore
used the converted MS-DOS version and modified it by hand.

You can then generate the lookup tables in `Locale::Util` from the generated
file with this commmand:

```perl
$ perl ms-win32-lookups.pl locales.txt 
```
