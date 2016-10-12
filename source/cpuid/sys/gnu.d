/++
CPU cache infromation provided by macOS, iOS, TVOS, WatchOS.

$(GREEN This module is is compatible with betterC compilation mode.)

License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).

Authors:   Ilya Yaroshenko
+/
module cpuid.sys.gnu;


version (CRuntime_Glibc)
    version = GNUClib;
version (D_Ddoc)
    version = GNUClib;

version (GNUClib):

///
unittest
{
    import std.stdio;
    gnu_cpu_cache_info info = void;
    get_gnu_cpu_cache_info(info);
    "#######################################".writeln;
    "############ SYS/GNU REPORT ###########".writeln;
    "#######################################".writeln;
    "L1i cache size = ".writeln(info.LEVEL1_ICACHE_SIZE);
    "L1i cache assoc = ".writeln(info.LEVEL1_ICACHE_ASSOC);
    "L1i cache linesize = ".writeln(info.LEVEL1_ICACHE_LINESIZE);
    "L1d cache size = ".writeln(info.LEVEL1_DCACHE_SIZE);
    "L1d cache assoc = ".writeln(info.LEVEL1_DCACHE_ASSOC);
    "L1d cache linesize = ".writeln(info.LEVEL1_DCACHE_LINESIZE);
    "L2 cache size = ".writeln(info.LEVEL2_CACHE_SIZE);
    "L2 cache assoc = ".writeln(info.LEVEL2_CACHE_ASSOC);
    "L2 cache linesize = ".writeln(info.LEVEL2_CACHE_LINESIZE);
    "L3 cache size = ".writeln(info.LEVEL3_CACHE_SIZE);
    "L3 cache assoc = ".writeln(info.LEVEL3_CACHE_ASSOC);
    "L3 cache linesize = ".writeln(info.LEVEL3_CACHE_LINESIZE);
    "L4 cache size = ".writeln(info.LEVEL4_CACHE_SIZE);
    "L4 cache assoc = ".writeln(info.LEVEL4_CACHE_ASSOC);
    "L4 cache linesize = ".writeln(info.LEVEL4_CACHE_LINESIZE);
}

nothrow @nogc:

///
struct gnu_cpu_cache_info
{
    int LEVEL1_ICACHE_SIZE;
    int LEVEL1_ICACHE_ASSOC;
    int LEVEL1_ICACHE_LINESIZE;
    int LEVEL1_DCACHE_SIZE;
    int LEVEL1_DCACHE_ASSOC;
    int LEVEL1_DCACHE_LINESIZE;
    int LEVEL2_CACHE_SIZE;
    int LEVEL2_CACHE_ASSOC;
    int LEVEL2_CACHE_LINESIZE;
    int LEVEL3_CACHE_SIZE;
    int LEVEL3_CACHE_ASSOC;
    int LEVEL3_CACHE_LINESIZE;
    int LEVEL4_CACHE_SIZE;
    int LEVEL4_CACHE_ASSOC;
    int LEVEL4_CACHE_LINESIZE;
}

///
@safe nothrow @nogc
void get_gnu_cpu_cache_info(ref gnu_cpu_cache_info info)
{
    import core.sys.posix.unistd;
    info.LEVEL1_ICACHE_SIZE = cast(int) sysconf(_SC_LEVEL1_ICACHE_SIZE);
    info.LEVEL1_ICACHE_ASSOC = cast(int) sysconf(_SC_LEVEL1_ICACHE_ASSOC);
    info.LEVEL1_ICACHE_LINESIZE = cast(int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
    info.LEVEL1_DCACHE_SIZE = cast(int) sysconf(_SC_LEVEL1_DCACHE_SIZE);
    info.LEVEL1_DCACHE_ASSOC = cast(int) sysconf(_SC_LEVEL1_DCACHE_ASSOC);
    info.LEVEL1_DCACHE_LINESIZE = cast(int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
    info.LEVEL2_CACHE_SIZE = cast(int) sysconf(_SC_LEVEL2_CACHE_SIZE);
    info.LEVEL2_CACHE_ASSOC = cast(int) sysconf(_SC_LEVEL2_CACHE_ASSOC);
    info.LEVEL2_CACHE_LINESIZE = cast(int) sysconf(_SC_LEVEL2_CACHE_LINESIZE);
    info.LEVEL3_CACHE_SIZE = cast(int) sysconf(_SC_LEVEL3_CACHE_SIZE);
    info.LEVEL3_CACHE_ASSOC = cast(int) sysconf(_SC_LEVEL3_CACHE_ASSOC);
    info.LEVEL3_CACHE_LINESIZE = cast(int) sysconf(_SC_LEVEL3_CACHE_LINESIZE);
    info.LEVEL4_CACHE_SIZE = cast(int) sysconf(_SC_LEVEL4_CACHE_SIZE);
    info.LEVEL4_CACHE_ASSOC = cast(int) sysconf(_SC_LEVEL4_CACHE_ASSOC);
    info.LEVEL4_CACHE_LINESIZE = cast(int) sysconf(_SC_LEVEL4_CACHE_LINESIZE);
}
